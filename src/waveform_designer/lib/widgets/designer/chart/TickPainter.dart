import 'package:flutter/widgets.dart';

class TickPainter extends CustomPainter {
  final int _frequency;
  final int _duration;

  TickPainter({required int frequency, required int duration})
      : _duration = duration,
        _frequency = frequency;

  @override
  void paint(Canvas canvas, Size size) {
    var dashHeight = 4, dashSpace = 6, startY = 0.0;
    final paint = Paint()
      ..color = const Color.fromARGB(255, 71, 71, 71)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final tickCount = (_duration / _frequency + 1).toInt();
    final distance = size.width / (tickCount - 1);
    for (var i = 0; i < tickCount; i++) {
      final bottomOffset = Offset(i * distance, size.height);

      startY = 0;
      while (startY < bottomOffset.dy) {
        canvas.drawLine(Offset(i * distance, startY),
            Offset(i * distance, startY + dashHeight), paint);
        startY += dashHeight + dashSpace;
      }

      const textStyle = TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 14,
      );
      var textSpan = TextSpan(
        text: (i * _frequency).toString(),
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
