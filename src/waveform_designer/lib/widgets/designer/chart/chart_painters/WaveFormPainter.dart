import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/calc/ValueRangeMapper.dart';
import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/designer/chart/PanningBehavior.dart';
import 'package:opc_node_designer/widgets/designer/chart/ZoomCompensator.dart';

class Range {
  final int start;
  final int stop;

  Range({
    required this.start,
    required this.stop,
  });
}

class WaveFormPainter extends CustomPainter
    with ValueRangeMapper, PanningBehavior, ZoomCompensator {
  final List<int> _transitionPoints;
  final int _duration;
  final double _slice;
  final double _offset;

  WaveFormPainter(
    WaveFormModel waveform,
    DesignerModel panning,
  )   : _offset = panning.sliceOffset,
        _slice = panning.sliceRatio,
        _transitionPoints = waveform.values.map((v) => v.tick).toList(),
        _duration = waveform.duration;

  List<Range> _mapToRanges(List<int> input) {
    List<Range> ranges = [];

    for (int i = 0; i < input.length - 1; i++) {
      ranges.add(Range(start: input[i], stop: input[i + 1]));
    }

    return ranges;
  }

  @override
  void paint(Canvas canvas, Size size) {
    zoomAndPan(canvas, size, _slice, _offset);
    final strokeWidth = 2.0;
    final horizontalLinePainter = Paint()
      ..color = AppTheme.textColor
      ..strokeWidth = strokeWidth;
    final verticalLinePainter = Paint()
      ..color = AppTheme.textColor
      ..strokeWidth = compensateZoom(strokeWidth, _slice);

    final intervals = _mapToRanges([0, ..._transitionPoints, _duration]);

    var verticalOffsetMultiplier = 0.8;

    for (var i = 0; i < intervals.length; i++) {
      // draw horizontal line
      final verticalOffset = size.height * verticalOffsetMultiplier;
      final paintStart = mapValueToNewRange(0, _duration.toDouble(),
          intervals[i].start.toDouble(), 0, size.width);
      final paintEnd = mapValueToNewRange(
          0, _duration.toDouble(), intervals[i].stop.toDouble(), 0, size.width);
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
