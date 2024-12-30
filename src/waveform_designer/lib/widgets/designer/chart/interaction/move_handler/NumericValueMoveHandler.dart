import 'package:flutter_riverpod/src/consumer.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/VerticalOffsetCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/move_handler/TransitionValueMoveHandler.dart';

class NumericValueMoveHandler extends TransitionValueMoveHandler
    with WaveformMinMaxer, VerticalOffsetCalculator {
  @override
  void handleMove(
    WaveFormValueModel<WaveformPointValue> value,
    ScreenSpacePoint newPosition,
    WidgetRef ref,
  ) {
    final waveForm = ref.read(waveFormStateProvider);
    final designer = ref.read(designerStateProvider);
    final newValue = getNewValue(waveForm, designer, newPosition);
    final updatedValue = value.copyWith(value: DoubleValue(newValue));
    ref.read(waveFormStateProvider.notifier).updateWaveformValue(
          updatedValue,
        );
    super.handleMove(updatedValue, newPosition, ref);
  }
}
