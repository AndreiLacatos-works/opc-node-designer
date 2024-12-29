import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';

mixin NumericValueAdderActions {
  void handleConfirm(
    Function() callback,
    int? tick,
    double? value,
    WidgetRef ref,
  ) {
    if (tick != null) {
      try {
        ref.read(waveFormStateProvider.notifier).addWaveformValue(
              WaveFormValueModel(
                tick: tick,
                value: DoubleValue(value ?? 0),
              ),
            );

        callback();
      } on String catch (e) {
        if (this is ErrorHandler) {
          (this as ErrorHandler).setError(e);
        }
      }
    }
  }
}
