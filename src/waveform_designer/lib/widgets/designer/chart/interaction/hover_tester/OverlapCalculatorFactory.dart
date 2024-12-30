import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/hover_tester/AbstractValueOverlapCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/hover_tester/NullOverlapCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/hover_tester/NumericValueOverlapCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/hover_tester/TransitionValueOverlapCalculator.dart';

class OverlapCalculatorFactory {
  static AbstractValueOverlapCalculator getOverlapCalculator(
    WaveFormModel waveForm,
  ) {
    return switch (waveForm.type) {
      Void => NullOverlapCalculator(),
      Transition => TransitionValueOverlapCalculator(),
      DoubleValue => NumericValueOverlapCalculator(),
      _ => throw "${waveForm.type} has no overlap calculator",
    };
  }
}
