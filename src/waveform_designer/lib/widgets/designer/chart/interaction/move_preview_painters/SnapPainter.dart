import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/calc/ValueRangeMapper.dart';
import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/designer/chart/PanningBehavior.dart';
import 'package:opc_node_designer/widgets/designer/chart/ZoomCompensator.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/NeighboringTickCalculator.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';

class SnapPainter extends CustomPainter
    with
        ValueRangeMapper,
        PanningBehavior,
        ZoomCompensator,
        WaveformMinMaxer,
        RangeRestrictorMapper,
        PointTransformer,
        NeighboringTickCalculator {
  final WaveFormModel _waveform;
  final DesignerModel _panning;
  final ScreenSpacePoint? _desiredPosition;

  SnapPainter({
    required WaveFormModel waveform,
    required DesignerModel panning,
    required ScreenSpacePoint? point,
  })  : _waveform = waveform,
        _panning = panning,
        _desiredPosition = point;

  @override
  void paint(Canvas canvas, Size size) {
    if (_desiredPosition == null) {
      return;
    }
    final tickToSnapTo = getNeighboringTick(
      _desiredPosition,
      _waveform,
      _panning,
    );

    zoomAndPan(canvas, size, _panning.sliceRatio, _panning.sliceOffset);
    final paint = Paint()
      ..color = AppTheme.secondaryAccent
      ..strokeWidth = compensateZoom(3.0, _panning.sliceRatio)
      ..style = PaintingStyle.stroke;

    final dx = mapValueToNewRange(0, _waveform.duration.toDouble(),
        tickToSnapTo.toDouble(), 0, size.width);
    final topOffset = Offset(dx, 0);
    final bottomOffset = Offset(dx, size.height);
    canvas.drawLine(topOffset, bottomOffset, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
