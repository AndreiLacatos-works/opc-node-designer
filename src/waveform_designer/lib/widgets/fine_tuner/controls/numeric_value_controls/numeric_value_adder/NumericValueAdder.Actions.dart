import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/add_handler/NumericValueAddHandler.dart';
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
        NumericValueAddHandler().addValue(tick, DoubleValue(value ?? 0), ref);
        callback();
      } on String catch (e) {
        if (this is ErrorHandler) {
          (this as ErrorHandler).setError(e);
        }
      }
    }
  }
}
