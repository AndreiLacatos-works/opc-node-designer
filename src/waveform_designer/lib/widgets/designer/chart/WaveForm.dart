import 'package:flutter/widgets.dart';

class Range {
  final int start;
  final int stop;

  Range({required this.start, required this.stop});
}

class WaveFormPainter extends CustomPainter {
  final List<int> transitionPoints;
  final int duration;

  WaveFormPainter({required this.transitionPoints, required this.duration});

  List<Range> mapToRanges(List<int> input) {
    List<Range> ranges = [];

    for (int i = 0; i < input.length - 1; i++) {
      ranges.add(Range(start: input[i], stop: input[i + 1]));
    }

    return ranges;
  }

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
    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = 2;

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
      canvas.drawLine(startOffset, stopOffset, paint);

      // draw vertical line
      if (i == intervals.length - 1) {
        break;
      }
      startOffset = stopOffset;
      verticalOffsetMultiplier = 1 - verticalOffsetMultiplier;
      stopOffset =
          Offset(stopOffset.dx, size.height * verticalOffsetMultiplier);
      canvas.drawLine(startOffset, stopOffset, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
