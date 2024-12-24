import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';

class Range {
  final int start;
  final int stop;

  Range({required this.start, required this.stop});
}

class WaveFormPainter extends CustomPainter with ValueRangeMapper {
  final List<int> transitionPoints;
  final int duration;
  final double slice;
  final double offset;

  WaveFormPainter({
    required this.transitionPoints,
    required this.duration,
    required this.slice,
    required this.offset,
  });

  List<Range> mapToRanges(List<int> input) {
    List<Range> ranges = [];

    for (int i = 0; i < input.length - 1; i++) {
      ranges.add(Range(start: input[i], stop: input[i + 1]));
    }

    return ranges;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // prevent rendering outside of the original canvas size
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    // create a zoom effect by horizontally scaling the canvas
    final zoomRatio = 1.0 / slice;
    canvas.transform(Matrix4.identity().scaled(zoomRatio, 1.0).storage);

    // move it to the left such that the beginning of the zoomed area aligns
    // witht the beginning of the "physical" canvas
    canvas.translate(size.width * offset * -1, 0.0);

    final strokeWidth = 2.0;
    final horizontalLinePainter = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = strokeWidth;
    final verticalLinePainter = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = strokeWidth / zoomRatio;

    final intervals = mapToRanges([0, ...transitionPoints, duration]);

    var verticalOffsetMultiplier = 0.8;

    for (var i = 0; i < intervals.length; i++) {
      // draw horizontal line
      final verticalOffset = size.height * verticalOffsetMultiplier;
      final paintStart = mapValueToNewRange(
          0, duration.toDouble(), intervals[i].start.toDouble(), 0, size.width);
      final paintEnd = mapValueToNewRange(
          0, duration.toDouble(), intervals[i].stop.toDouble(), 0, size.width);
      var startOffset = Offset(paintStart, verticalOffset);
      var stopOffset = Offset(paintEnd, verticalOffset);
      canvas.drawLine(startOffset, stopOffset, horizontalLinePainter);

      // draw vertical line
      if (i == intervals.length - 1) {
        break;
      }
      startOffset = stopOffset;
      verticalOffsetMultiplier = 1 - verticalOffsetMultiplier;
      stopOffset =
          Offset(stopOffset.dx, size.height * verticalOffsetMultiplier);
      canvas.drawLine(startOffset, stopOffset, verticalLinePainter);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
