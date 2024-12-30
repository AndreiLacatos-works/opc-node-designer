import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/chart/PanningBehavior.dart';
import 'package:waveform_designer/widgets/designer/chart/ZoomCompensator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/VerticalOffsetCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';

class ValueNodePainter extends CustomPainter
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

    for (final value in _values) {
      final horizontalOffset = mapValueToNewRange(
        0,
        _duration.toDouble(),
        value.tick.toDouble(),
        0,
        size.width,
      );
      final verticalOffset = getVerticalOffset(_values, value, size);
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
}
