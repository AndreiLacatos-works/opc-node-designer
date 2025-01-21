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

class StepConnectorPainter extends CustomPainter
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
  final double _slice;
  final double _offset;

  StepConnectorPainter(
    WaveFormModel waveform,
    DesignerModel panning,
  )   : _offset = panning.sliceOffset,
        _slice = panning.sliceRatio,
        _values = waveform.values,
        _duration = waveform.duration;

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

    var previous = _values.first;
    for (final current in _values.sublist(1)) {
      drawHorizontalSection(
        previous,
        current,
        _duration,
        _values,
        canvas,
        size,
        horizontalLinePainter,
      );
      drawVerticalSection(
        previous,
        current,
        _duration,
        _values,
        canvas,
        size,
        verticalLinePainter,
      );
      previous = current;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
