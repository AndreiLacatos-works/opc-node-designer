import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/chart/PanningBehavior.dart';
import 'package:waveform_designer/widgets/designer/chart/ZoomCompensator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';

class ValueMovePainter extends CustomPainter
    with
        ValueRangeMapper,
        PanningBehavior,
        ZoomCompensator,
        RangeRestrictorMapper,
        WaveformMinMaxer,
        PointTransformer,
        NeighboringTickCalculator {
  final WaveFormModel _waveform;
  final DesignerModel _panning;
  final ScreenSpacePoint? _point;

  ValueMovePainter({
    required WaveFormModel waveform,
    required DesignerModel panning,
    required ScreenSpacePoint? point,
  })  : _waveform = waveform,
        _panning = panning,
        _point = point;

  @override
  void paint(Canvas canvas, Size size) {
    if (_point == null) {
      return;
    }

    zoomAndPan(canvas, size, _panning.sliceRatio, _panning.sliceOffset);

    final tickToSnapTo = getNeighboringTick(_point, _waveform, _panning);
    final paint = Paint()
      ..color = AppTheme.secondaryAccent
      ..style = PaintingStyle.fill;
    final circleRadius = 14.0;
    final [minValue, maxValue] = getWaveformMinMaxValues(_waveform.values);

    final horizontalOffset = mapValueToNewRange(
      0,
      _waveform.duration.toDouble(),
      tickToSnapTo.toDouble(),
      0,
      size.width,
    );
    final verticalOffset = mapValueToRestrictedRange(
      maxValue,
      minValue,
      toDriagramSpace(_point, _waveform, _panning).dy,
      size.height,
      size.height,
    );
    final boundingBox = Rect.fromCenter(
      center: Offset(horizontalOffset, verticalOffset),
      height: circleRadius,
      width: compensateZoom(circleRadius, _panning.sliceRatio),
    );

    canvas.drawOval(
      boundingBox,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
