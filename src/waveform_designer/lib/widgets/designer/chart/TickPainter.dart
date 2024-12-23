import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';

class TickPainter extends CustomPainter with ValueRangeMapper {
  final int _frequency;
  final int _duration;

  TickPainter({required int frequency, required int duration})
      : _duration = duration,
        _frequency = frequency;

  @override
  void paint(Canvas canvas, Size size) {
    final tickCount = (_duration / _frequency + 1).toInt();
    for (var i = 0; i < tickCount; i++) {
      final horizontalOffset = mapValueToNewRange(
          0, _duration.toDouble(), i * _frequency.toDouble(), 0, size.width);
      _drawTickAtOffset(canvas, size, horizontalOffset, i * _frequency);
    }

    // in case the last tick does not align with the duration, draw an extra tick
    if (_duration & _frequency != 0) {
      _drawTickAtOffset(canvas, size, size.width, _duration);
    }
  }

  void _drawTickAtOffset(
      Canvas canvas, Size size, double horizontalOffset, int tickIndex) {
    var dashHeight = 4, dashSpace = 6, startY = 0.0;
    final paint = Paint()
      ..color = const Color.fromARGB(255, 71, 71, 71)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    final bottomOffset = Offset(horizontalOffset, size.height);

    // draw small vertical dashed segments that add up to a dashed line
    startY = 0;
    while (startY < bottomOffset.dy) {
      canvas.drawLine(Offset(horizontalOffset, startY),
          Offset(horizontalOffset, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }

    // draw tick text
    const textStyle = TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 14,
    );
    var textSpan = TextSpan(
      text: (tickIndex).toString(),
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    textPainter.paint(
        canvas, bottomOffset.translate(textPainter.width / 2 * -1, 5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
