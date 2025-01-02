import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';

mixin NeighboringTickCalculator on PointTransformer {
  int getNeighboringTick(
    ScreenSpacePoint position,
    WaveFormModel waveForm,
    DesignerModel designer,
  ) {
    final diagramPoint = toDriagramSpace(position, waveForm, designer);
    if (waveForm.tickFrequency == 0) {
      return 0;
    }
    // determine the closest tick
    final tickCount = waveForm.duration ~/ waveForm.tickFrequency + 1;
    final ticks =
        List.generate(tickCount, (i) => i * waveForm.tickFrequency).toList();
    return ticks.reduce((a, b) =>
        (a - diagramPoint.dx).abs() < (b - diagramPoint.dx).abs() ? a : b);
  }
}
