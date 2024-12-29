import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/chart/PanningBehavior.dart';
import 'package:waveform_designer/widgets/designer/chart/ZoomCompensator.dart';

class ValueNodeConnectorPainter extends CustomPainter
    with ValueRangeMapper, PanningBehavior, ZoomCompensator {
  final List<WaveFormValueModel> _values;
  final int _duration;
  final double _slice;
  final double _offset;

  ValueNodeConnectorPainter(
    WaveFormModel waveform,
    DesignerModel panning,
  )   : _offset = panning.sliceOffset,
        _slice = panning.sliceRatio,
        _values = waveform.values,
        _duration = waveform.duration;

  @override
  void paint(Canvas canvas, Size size) {
    if (_values.length < 2) {
      return;
    }

    zoomAndPan(canvas, size, _slice, _offset);
    final [minValue, maxValue] = _getMinMax();
    var previous = _values.first;
    final paint = Paint()
      ..color = AppTheme.textColor
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    final verticalRestriction = .94;

    for (final current in _values.sublist(1)) {
      final from = Offset(
        mapValueToNewRange(
          0,
          _duration.toDouble(),
          previous.tick.toDouble(),
          0,
          size.width,
        ),
        mapValueToNewRange(
          maxValue,
          minValue,
          previous.value.getValue(),
          size.height * (1 - verticalRestriction),
          size.height * verticalRestriction,
        ),
      );
      final to = Offset(
        mapValueToNewRange(
          0,
          _duration.toDouble(),
          current.tick.toDouble(),
          0,
          size.width,
        ),
        mapValueToNewRange(
          maxValue,
          minValue,
          current.value.getValue(),
          size.height * (1 - verticalRestriction),
          size.height * verticalRestriction,
        ),
      );
      canvas.drawLine(from, to, paint);
      previous = current;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<double> _getMinMax() {
    if (_values.isEmpty) {
      return [0, 0];
    }

    var minValue = _values[0].value.getValue();
    var maxValue = _values[0].value.getValue();

    for (final value in _values.sublist(1)) {
      final num = value.value.getValue();
      if (num < minValue) {
        minValue = num;
      }
      if (num > maxValue) {
        maxValue = num;
      }
    }

    return [minValue, maxValue];
  }
}
