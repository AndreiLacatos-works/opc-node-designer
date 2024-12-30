import 'package:flutter/widgets.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/ValueNodeConnectorPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/ValueNodePainter.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/WaveFormPainter.dart';

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
