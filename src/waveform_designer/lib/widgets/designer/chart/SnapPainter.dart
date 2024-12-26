import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/chart/PanningBehavior.dart';

class SnapPainter extends CustomPainter with ValueRangeMapper, PanningBehavior {
  final int? _tick;
  final int _duration;
  final double _slice;
  final double _offset;

  SnapPainter({
    required int? tick,
    required int duration,
    required double slice,
    required double offset,
  })  : _offset = offset,
        _slice = slice,
        _duration = duration,
        _tick = tick;

  @override
  void paint(Canvas canvas, Size size) {
    if (_tick == null) {
      return;
    }
    zoomAndPan(canvas, size, _slice, _offset);
    final zoomRatio = 1.0 / _slice;
    final paint = Paint()
      ..color = AppTheme.secondarAccent
      ..strokeWidth = 3.0 / zoomRatio
      ..style = PaintingStyle.stroke;

    final dx = mapValueToNewRange(
        0, _duration.toDouble(), _tick!.toDouble(), 0, size.width);
    final topOffset = Offset(dx, 0);
    final bottomOffset = Offset(dx, size.height);
    canvas.drawLine(topOffset, bottomOffset, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
