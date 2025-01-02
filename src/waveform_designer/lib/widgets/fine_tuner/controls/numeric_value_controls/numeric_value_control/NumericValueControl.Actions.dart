import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.state.dart';

mixin NumericValueControlActions {
  void handleValueChange(
    WaveFormValueModel point,
    double? newValue,
    WidgetRef ref,
  ) {
    if (newValue == null) {
      return;
    }
    ref
        .read(waveFormStateProvider.notifier)
        .updateWaveformValue(point.copyWith(value: DoubleValue(newValue)));
  }
}
