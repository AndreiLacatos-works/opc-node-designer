import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';

class SnapPainter extends CustomPainter with ValueRangeMapper {
  final int? _tick;
  final int _duration;

  SnapPainter({required int? tick, required int duration})
      : _duration = duration,
        _tick = tick;

  @override
  void paint(Canvas canvas, Size size) {
    if (_tick == null) {
      return;
    }

    final paint = Paint()
      ..color = const Color.fromARGB(255, 18, 173, 235)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final dx = mapValueToNewRange(
        0, _duration.toDouble(), _tick.toDouble(), 0, size.width);
    final topOffset = Offset(dx, 0);
    final bottomOffset = Offset(dx, size.height);
    canvas.drawLine(topOffset, bottomOffset, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
