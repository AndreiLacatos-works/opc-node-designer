import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/move_handler/AbstractMoveHandler.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/move_handler/NullMoveHandler.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/move_handler/NumericValueMoveHandler.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/move_handler/TransitionValueMoveHandler.dart';

class ValueMoveHandlerFactory {
  static AbstractMoveHandler getMoveHandler(
    WaveFormModel waveForm,
  ) {
    return switch (waveForm.type) {
      Void => NullMoveHandler(),
      Transition => TransitionValueMoveHandler(),
      DoubleValue => NumericValueMoveHandler(),
      _ => throw "${waveForm.type} has no value move handler",
    };
  }
}