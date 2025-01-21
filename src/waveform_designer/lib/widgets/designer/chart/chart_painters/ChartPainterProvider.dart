import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/ValueNodePainter.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/WaveFormPainter.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/node_connector_painters/CubicSplineConnectorPainter.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/node_connector_painters/LinearConnectorPainter.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/node_connector_painters/StepConnectorPainter.dart';

mixin ChartPainterProvider {
  List<CustomPainter> providePainters(
    WaveFormModel waveform,
    DesignerModel panning,
  ) {
    switch (waveform.type) {
      case Transition:
        return [
          WaveFormPainter(waveform, panning),
        ];
      case DoubleValue:
        {
          var smoothing = SmoothingStrategy.step;
          if (waveform.meta is NumericWaveformMeta) {
            smoothing = (waveform.meta as NumericWaveformMeta).smoothing;
          }
          CustomPainter connector = switch (smoothing) {
            SmoothingStrategy.step => StepConnectorPainter(waveform, panning),
            SmoothingStrategy.linear =>
              LinearConnectorPainter(waveform, panning),
            SmoothingStrategy.cubic =>
              CubicSplineConnectorPainter(waveform, panning),
          };
          return [ValueNodePainter(waveform, panning), connector];
        }
      default:
        return [];
    }
  }
}
