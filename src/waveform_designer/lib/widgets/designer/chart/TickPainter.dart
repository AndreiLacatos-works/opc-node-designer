import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/widgets/designer/chart/PanningBehavior.dart';

class TickPainter extends CustomPainter with ValueRangeMapper, PanningBehavior {
  final int _frequency;
  final int _duration;
  final double _slice;
  final double _offset;

  TickPainter({
    required int frequency,
    required int duration,
    required double slice,
    required double offset,
  })  : _offset = offset,
        _slice = slice,
        _duration = duration,
        _frequency = frequency;

  @override
  void paint(Canvas canvas, Size size) {
    final clipSize = Size(size.width + 40, size.height + 40);
    zoomAndPan(canvas, size, _slice, _offset, clipSize);

    // show roughly 20 ticks in the visible viewport
    final maxTicksToShow = 20 ~/ _slice;
    final alternativeStep =
        _calculateAlternativeStepSize(_duration, maxTicksToShow, _frequency);
    final ticksToShow =
        List.generate(maxTicksToShow, (i) => i * alternativeStep);
    final totalTickCount = (_duration / _frequency + 1).toInt();
    for (var i = 0; i < totalTickCount; i++) {
      final tick = i * _frequency;
      if (ticksToShow.contains(tick)) {
        final horizontalOffset = mapValueToNewRange(
            0, _duration.toDouble(), i * _frequency.toDouble(), 0, size.width);
        _drawTickAtOffset(canvas, size, horizontalOffset, tick);
      }
    }

    // in case the last tick does not align with the duration, draw an extra tick
    if (_duration & _frequency != 0) {
      _drawTickAtOffset(canvas, size, size.width, _duration);
    }
  }

  void _drawTickAtOffset(
    Canvas canvas,
    Size size,
    double horizontalOffset,
    int tickIndex,
  ) {
    var dashHeight = 4, dashSpace = 6, startY = 0.0;
    final zoomRatio = 1.0 / _slice;
    final paint = Paint()
      ..color = const Color.fromARGB(255, 71, 71, 71)
      ..strokeWidth = 2.0 / zoomRatio
      ..style = PaintingStyle.stroke;
    final bottomOffset = Offset(horizontalOffset, size.height);

    // draw small vertical dashed segments that add up to a dashed line
    startY = 0;
    while (startY < bottomOffset.dy) {
      canvas.drawLine(Offset(horizontalOffset, startY),
          Offset(horizontalOffset, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }

    _drawTickText(canvas, size, horizontalOffset, tickIndex);
  }

  void _drawTickText(
    Canvas canvas,
    Size size,
    double horizontalOffset,
    int tickIndex,
  ) {
    canvas.save();

    final zoomRatio = 1.0 / _slice;
    // apply an inverse canvas transformation to avoid stretching text
    canvas.transform(Matrix4.identity().scaled(1 / zoomRatio, 1.0).storage);

    final bottomOffset = Offset(horizontalOffset * zoomRatio, size.height);
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
    canvas.restore();
  }

  int _calculateAlternativeStepSize(
    int duration,
    int targetItemCount,
    int stepOriginal,
  ) {
    final stepAlternative = duration / targetItemCount;
    return stepAlternative <= stepOriginal
        ? stepOriginal
        : (stepAlternative / stepOriginal).ceil() * stepOriginal;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
