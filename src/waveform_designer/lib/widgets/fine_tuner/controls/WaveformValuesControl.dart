import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/numeric_value_controls/NumericValuesControl.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/transition_value_controls/TransitionPointsControl.dart';

class WaveformValuesControl extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waveformType = ref.watch(waveFormStateProvider).type;
    return switch (waveformType) {
      Void => SizedBox.shrink(),
      Transition => TransitionPointsControl(),
      DoubleValue => NumericValuesControl(),
      _ => throw "${waveformType} has no value controls!",
    };
  }
}
