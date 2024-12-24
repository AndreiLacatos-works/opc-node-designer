import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/widgets/designer/chart/PanningBehavior.dart';

class SnapPainter extends CustomPainter with ValueRangeMapper, PanningBehavior {
  final int? tick;
  final int duration;
  final double slice;
  final double offset;

  SnapPainter({
    required this.tick,
    required this.duration,
    required this.slice,
    required this.offset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (tick == null) {
      return;
    }
    zoomAndPan(canvas, size, slice, offset);
    final zoomRatio = 1.0 / slice;
    final paint = Paint()
      ..color = const Color.fromARGB(255, 8, 176, 243)
      ..strokeWidth = 3.0 / zoomRatio
      ..style = PaintingStyle.stroke;

    final dx = mapValueToNewRange(
        0, duration.toDouble(), tick!.toDouble(), 0, size.width);
    final topOffset = Offset(dx, 0);
    final bottomOffset = Offset(dx, size.height);
    canvas.drawLine(topOffset, bottomOffset, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
