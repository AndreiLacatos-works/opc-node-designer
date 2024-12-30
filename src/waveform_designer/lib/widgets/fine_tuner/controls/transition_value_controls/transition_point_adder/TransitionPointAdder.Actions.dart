import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/add_handler/TransitionValueAddHandler.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';

mixin TransitionPointAdderActions {
  void handleConfirm(
    Function() callback,
    int? value,
    WidgetRef ref,
  ) {
    if (value != null) {
      try {
        TransitionValueAddHandler().addValue(value, Transition(), ref);

        callback();
      } on String catch (e) {
        if (this is ErrorHandler) {
          (this as ErrorHandler).setError(e);
        }
      }
    }
  }
}
