import 'package:waveform_designer/calc/PointTransformer.dart';
import 'package:waveform_designer/calc/ScreenSpacePoint.dart';

mixin NeighboringTickCalculator on PointTransformer {
  int getNeighboringTick(ScreenSpacePoint position) {
    final diagramPoint = toDriagramSpace(position);
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
