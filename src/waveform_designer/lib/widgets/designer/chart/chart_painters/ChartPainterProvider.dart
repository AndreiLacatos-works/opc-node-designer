import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/ValueNodeConnectorPainter.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/ValueNodePainter.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/WaveFormPainter.dart';

mixin ChartPainterProvider {
  List<CustomPainter> providePainters(
    WaveFormModel waveform,
    DesignerModel panning,
  ) {
    return switch (waveform.type) {
      Transition => [
          WaveFormPainter(waveform, panning),
        ],
      DoubleValue => [
          ValueNodePainter(waveform, panning),
          ValueNodeConnectorPainter(waveform, panning),
        ],
      _ => [],
    };
  }
}
