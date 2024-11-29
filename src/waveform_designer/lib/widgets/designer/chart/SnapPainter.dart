import 'package:flutter/widgets.dart';

class SnapPainter extends CustomPainter {
  final int? tick;
  final int duration;

  SnapPainter({required this.tick, required this.duration});

  double mapValueToNewRange(double originalRangeStart, double originalRangeEnd,
      double value, double newRangeStart, double newRangeEnd) {
    double proportion =
        (value - originalRangeStart) / (originalRangeEnd - originalRangeStart);

    double mappedValue =
        newRangeStart + proportion * (newRangeEnd - newRangeStart);

    return mappedValue;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (tick == null) {
      return;
    }

    final paint = Paint()
      ..color = const Color.fromARGB(255, 18, 173, 235)
      ..strokeWidth = 2.0
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
