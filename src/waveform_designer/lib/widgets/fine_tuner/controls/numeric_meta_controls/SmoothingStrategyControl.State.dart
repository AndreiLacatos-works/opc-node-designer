import 'package:opc_node_designer/state/waveform/waveform.model.dart';

mixin SmoothingStrategyControlState {
  final Map<String, SmoothingStrategy> optionsMap = {
    "Step": SmoothingStrategy.step,
    "Linear": SmoothingStrategy.linear,
    "Cubic spline": SmoothingStrategy.cubic,
  };

  List<String> get options => optionsMap.keys.toList();
  String getSelectedItem(WaveformMeta? meta) {
    final defaultOption = optionsMap.keys.first;
    if (meta is NumericWaveformMeta) {
      return optionsMap.entries
              .where((entry) => entry.value == meta.smoothing)
              .firstOrNull
              ?.key ??
          defaultOption;
    } else {
      return defaultOption;
    }
  }
}
