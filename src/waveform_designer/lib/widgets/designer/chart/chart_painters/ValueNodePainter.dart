import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/chart/PanningBehavior.dart';
import 'package:waveform_designer/widgets/designer/chart/ZoomCompensator.dart';

class ValueNodePainter extends CustomPainter
    with ValueRangeMapper, PanningBehavior, ZoomCompensator {
  final List<WaveFormValueModel> _values;
  final int _duration;
  final double _slice;
  final double _offset;

  ValueNodePainter(
    WaveFormModel waveform,
    DesignerModel panning,
  )   : _offset = panning.sliceOffset,
        _slice = panning.sliceRatio,
        _values = waveform.values,
        _duration = waveform.duration;

  @override
  void paint(Canvas canvas, Size size) {
    zoomAndPan(canvas, size, _slice, _offset);
    final paint = Paint()
      ..color = AppTheme.accentColor
      ..style = PaintingStyle.fill;
    final circleRadius = 8.0;
    final [minValue, maxValue] = _getMinMax();
    // avoid rendering point at the very top or bottom of,
    // the chart drawable area vertically is restricted
    final verticalRestriction = .94;

    for (final value in _values) {
      final horizontalOffset = mapValueToNewRange(
        0,
        _duration.toDouble(),
        value.tick.toDouble(),
        0,
        size.width,
      );
      final verticalOffset = mapValueToNewRange(
        maxValue,
        minValue,
        value.value.getValue(),
        size.height * (1 - verticalRestriction),
        size.height * verticalRestriction,
      );
      final boundingBox = Rect.fromCenter(
        center: Offset(horizontalOffset, verticalOffset),
        height: circleRadius,
        width: compensateZoom(circleRadius, _slice),
      );

      canvas.drawOval(
        boundingBox,
        paint,
      );
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
