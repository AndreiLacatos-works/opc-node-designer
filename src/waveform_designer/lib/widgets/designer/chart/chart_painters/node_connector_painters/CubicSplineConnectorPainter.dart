import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/calc/ValueRangeMapper.dart';
import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/PanningBehavior.dart';
import 'package:opc_node_designer/widgets/designer/chart/ZoomCompensator.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/VerticalOffsetCalculator.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';

class _Coefficients {
  final List<double> a;
  final List<double> b;
  final List<double> c;
  final List<double> d;

  _Coefficients({
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });
}

class CubicSplineConnectorPainter extends CustomPainter
    with
        ValueRangeMapper,
        PanningBehavior,
        ZoomCompensator,
        RangeRestrictorMapper,
        WaveformMinMaxer,
        PointTransformer,
        VerticalOffsetCalculator {
  final List<WaveFormValueModel> _values;
  final int _duration;
  final int _tickFrequency;
  final double _slice;
  final double _offset;

  CubicSplineConnectorPainter(
    WaveFormModel waveform,
    DesignerModel panning,
  )   : _offset = panning.sliceOffset,
        _slice = panning.sliceRatio,
        _values = waveform.values,
        _duration = waveform.duration,
        _tickFrequency = waveform.tickFrequency;

  @override
  void paint(Canvas canvas, Size size) {
    if (_values.length < 2) {
      return;
    }

    zoomAndPan(canvas, size, _slice, _offset);
    final horizontalLinePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..isAntiAlias = true;
    final verticalLinePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = compensateZoom(1, _slice)
      ..isAntiAlias = true;

    // map the explicit transition points to two arrays holding
    // ticks for X & value for Y coordinates
    var x = _values.map((val) => val.tick.toDouble()).toList();
    var y = _values.map((val) => val.value.getValue()).toList();

    var pina = y.where((v) => v.isNaN).toList();
    print("found ${pina.length} NaN");

    // add two additional entries for X = 0 & X = waveform.Duration
    if (x.first != 0) {
      x.insert(0, 0);
      y.insert(0, _values.first.value.getValue());
    }
    if (x.last != _duration.toDouble()) {
      x.add(_duration.toDouble());
      y.add(_values.last.value.getValue());
    }

    final coeff = _computeCubicSplineCoefficients(x, y);
    final tickCount = _duration ~/ _tickFrequency + 1;
    final ticks = List.generate(tickCount, (i) => i * _tickFrequency).toList();
    var prev = WaveFormValueModel(tick: 0, value: _values.first.value);
    for (final tick in ticks.sublist(1)) {
      final v = _interpolate(coeff, x, tick);
      if (v.isNaN) {
        print("interpolate yieldid NaN for tick ${tick}");
      }
      final cur = WaveFormValueModel<DoubleValue>(
        tick: tick,
        value: DoubleValue(v),
      );

      _drawHorizontalSection(prev, cur, canvas, size, horizontalLinePainter);
      _drawVerticalSection(prev, cur, canvas, size, verticalLinePainter);

      prev = cur;
    }
  }

  void _drawHorizontalSection(
    WaveFormValueModel previous,
    WaveFormValueModel current,
    Canvas canvas,
    Size size,
    Paint paint,
  ) {
    var from = Offset(
      mapValueToNewRange(
        0,
        _duration.toDouble(),
        previous.tick.toDouble(),
        0,
        size.width,
      ),
      getVerticalOffset(_values, previous, size),
    );
    var to = Offset(
      mapValueToNewRange(
        0,
        _duration.toDouble(),
        current.tick.toDouble(),
        0,
        size.width,
      ),
      getVerticalOffset(_values, previous, size),
    );
    canvas.drawLine(from, to, paint);
  }

  void _drawVerticalSection(
    WaveFormValueModel previous,
    WaveFormValueModel current,
    Canvas canvas,
    Size size,
    Paint paint,
  ) {
    var from = Offset(
      mapValueToNewRange(
        0,
        _duration.toDouble(),
        current.tick.toDouble(),
        0,
        size.width,
      ),
      getVerticalOffset(_values, previous, size),
    );
    var to = Offset(
      mapValueToNewRange(
        0,
        _duration.toDouble(),
        current.tick.toDouble(),
        0,
        size.width,
      ),
      getVerticalOffset(_values, current, size),
    );

    if (from.dx.isNaN) {
      print("lofaszgeci from.dx.isNaN ${previous.value.getValue()}");
      return;
    }
    if (from.dy.isNaN) {
      print("lofaszgeci from.dy.isNaN ${previous.value.getValue()}");
      return;
    }
    if (to.dx.isNaN) {
      print("lofaszgeci to.dx.isNaN ${current.value.getValue()}");
      return;
    }
    if (to.dy.isNaN) {
      print("lofaszgeci to.dy.isNaN ${current.value.getValue()}");
      return;
    }
    canvas.drawLine(from, to, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  _Coefficients _computeCubicSplineCoefficients(
      List<double> x, List<double> y) {
    var n = x.length - 1;

    // step 1: calculate the h's, the differences between adjacent x's
    var h = List<double>.filled(n, 0);
    for (var i = 0; i < n; i++) {
      h[i] = (x[i + 1] - x[i]);
    }

    // step 2: set up the alpha array
    var alpha = List<double>.filled(n, 0);
    for (var i = 1; i < n; i++) {
      alpha[i] =
          ((3 / h[i]) * (y[i + 1] - y[i]) - (3 / h[i - 1]) * (y[i] - y[i - 1]));
    }

    // step 3: set up the matrix system for the c coefficients (tridiagonal system)
    var l = List<double>.filled(n + 1, 0);
    var mu = List<double>.filled(n, 0);
    var z = List<double>.filled(n + 1, 0);

    l[0] = 1.0;
    for (var i = 1; i < n; i++) {
      l[i] = 2 * (x[i + 1] - x[i - 1]) - h[i - 1] * mu[i - 1];
      mu[i] = h[i] / l[i];
      z[i] = (alpha[i] - h[i - 1] * z[i - 1]) / l[i];
    }

    l[n] = 1.0;
    z[n] = 0.0;

    // step 4: back substitution to calculate c coefficients
    var c = List<double>.filled(n + 1, 0);
    for (var j = n - 1; j >= 0; j--) {
      c[j] = z[j] - mu[j] * c[j + 1];
    }

    // step 5: calculate b and d coefficients
    var b = List<double>.filled(n, 0);
    var d = List<double>.filled(n, 0);
    var a = y;

    for (var i = 0; i < n; i++) {
      b[i] = (y[i + 1] - y[i]) / h[i] - h[i] * (c[i + 1] + 2 * c[i]) / 3;
      d[i] = (c[i + 1] - c[i]) / (3 * h[i]);
    }

    return _Coefficients(a: a, b: b, c: c, d: d);
  }

  double _interpolate(_Coefficients coefficients, List<double> x, int tick) {
    var xQuery = tick.toDouble();
    var n = x.length - 1;

    // find the interval containing xQuery
    var i;
    for (i = 0; i < n; i++) {
      if (xQuery <= x[i + 1]) {
        break;
      }
    }

    var dx = xQuery - x[i];
    var ca = coefficients.a;
    var cb = coefficients.b;
    var cc = coefficients.c;
    var cd = coefficients.d;
    return ca[i] + cb[i] * dx + cc[i] * dx * dx + cd[i] * dx * dx * dx;
  }
}
