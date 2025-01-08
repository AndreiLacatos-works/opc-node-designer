import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/calc/ValueRangeMapper.dart';
import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/PanningBehavior.dart';
import 'package:opc_node_designer/widgets/designer/chart/ZoomCompensator.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/VerticalOffsetCalculator.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/node_connector_painters/SegmentDrawer.dart';

class _Section {
  final WaveFormValueModel from;
  final WaveFormValueModel to;

  _Section({
    required this.from,
    required this.to,
  });
}

class LinearConnectorPainter extends CustomPainter
    with
        ValueRangeMapper,
        PanningBehavior,
        ZoomCompensator,
        RangeRestrictorMapper,
        WaveformMinMaxer,
        PointTransformer,
        VerticalOffsetCalculator,
        SegmentDrawer {
  final List<WaveFormValueModel> _values;
  final int _duration;
  final int _tickFrequency;
  final double _slice;
  final double _offset;

  LinearConnectorPainter(
    WaveFormModel waveform,
    DesignerModel panning,
  )   : _offset = panning.sliceOffset,
        _slice = panning.sliceRatio,
        _values = waveform.values,
        _duration = waveform.duration,
        _tickFrequency = waveform.tickFrequency;

  @override
  void paint(Canvas canvas, Size size) {
    if (_values.length < 2) {
      return;
    }

    zoomAndPan(canvas, size, _slice, _offset);
    final horizontalLinePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..isAntiAlias = true;
    final verticalLinePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = compensateZoom(1, _slice)
      ..isAntiAlias = true;

    List<_Section> sections = [];
    var prev = _values[0];

    for (var i = 1; i < _values.length; i++) {
      var cur = _values[i];
      sections.add(_Section(from: prev, to: cur));
      prev = cur;
    }

    final first = _values[0];
    if (first.tick > 0) {
      // add extra section from 0 to the first explicit transition
      sections.insert(
        0,
        _Section(
          from: WaveFormValueModel(tick: 0, value: first.value),
          to: first,
        ),
      );
    }

    final last = _values.last;
    if (last.tick < _duration) {
      // add extra section from the last explicit transition to
      // the end of the waveform
      sections.add(
        _Section(
          from: last,
          to: WaveFormValueModel(tick: _duration, value: last.value),
        ),
      );
    }

    final tickCount = _duration ~/ _tickFrequency + 1;
    final ticks = List.generate(tickCount, (i) => i * _tickFrequency).toList();
    prev = sections.first.from;
    for (final tick in ticks.sublist(1)) {
      final s = _getEncompassingSection(sections, tick);
      if (s == null) {
        continue;
      }

      final cur = WaveFormValueModel<DoubleValue>(
        tick: tick,
        value: DoubleValue(
          mapValueToNewRange(
            s.from.tick.toDouble(),
            s.to.tick.toDouble(),
            tick.toDouble(),
            s.from.value.getValue(),
            s.to.value.getValue(),
          ),
        ),
      );

      drawHorizontalSection(
          prev, cur, _duration, _values, canvas, size, horizontalLinePainter);
      drawVerticalSection(
          prev, cur, _duration, _values, canvas, size, verticalLinePainter);

      prev = cur;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  _Section? _getEncompassingSection(List<_Section> sections, int tick) {
    // do a binary search to find the correct section
    var left = 0;
    var right = sections.length - 1;

    while (left <= right) {
      var mid = (left + right) ~/ 2;
      var section = sections[mid];
      if (section.from.tick <= tick && section.to.tick >= tick) {
        // jackpot
        return section;
      }

      // adjust bounds based on comparison
      if (section.to.tick < tick) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return null;
  }
}
