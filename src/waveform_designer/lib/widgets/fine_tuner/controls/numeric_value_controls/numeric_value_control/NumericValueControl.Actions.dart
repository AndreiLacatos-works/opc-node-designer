import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';

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
