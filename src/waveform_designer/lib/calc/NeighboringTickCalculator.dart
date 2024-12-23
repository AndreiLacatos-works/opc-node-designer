import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

mixin NeighboringTickCalculator on ValueRangeMapper {
  double diagramWidth = 0;
  late WaveFormModel waveForm;

  int getNeighboringTick(double position) {
    final mapped = mapValueToNewRange(
            0, diagramWidth, position, 0, waveForm.duration.toDouble())
        .toInt();

    // determine the closest tick
    final tickCount = waveForm.duration ~/ waveForm.tickFrequency + 1;
    final ticks =
        List.generate(tickCount, (i) => i * waveForm.tickFrequency).toList();
    return ticks
        .reduce((a, b) => (a - mapped).abs() < (b - mapped).abs() ? a : b);
  }
}
