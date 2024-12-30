import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';

mixin TransitionPointAdderActions {
  void handleConfirm(
    Function() callback,
    int? value,
    WidgetRef ref,
  ) {
    if (value != null) {
      try {
        ref.read(waveFormStateProvider.notifier).addWaveformValue(
              WaveFormValueModel(
                tick: value,
                value: Transition(),
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
