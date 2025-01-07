import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.state.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/numeric_meta_controls/SmoothingStrategyControl.State.dart';

mixin SmoothingStrategyControlActions on SmoothingStrategyControlState {
  void handleChange(String newStrategy, WidgetRef ref) {
    if (optionsMap.containsKey(newStrategy)) {
      ref.read(waveFormStateProvider.notifier).updateMeta(
            NumericWaveformMeta(
              smoothing: optionsMap[newStrategy]!,
            ),
          );
    }
  }
}
