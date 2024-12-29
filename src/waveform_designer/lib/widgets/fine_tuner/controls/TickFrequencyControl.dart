import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';
import 'package:waveform_designer/widgets/input/MultiLabeledInput.dart';
import 'package:waveform_designer/widgets/shared/ErrorDisplay.dart';

class TickFrequencyControl extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TickFrequencyControlState();
}

class _TickFrequencyControlState extends ErrorConsumerState {
  @override
  Widget build(BuildContext context) {
    void _handleUpdate(int? newDuration) {
      if (newDuration == null) {
        return;
      }
      try {
        ref
            .read(waveFormStateProvider.notifier)
            .updateTickFrequency(newDuration);
      } on String catch (e) {
        setError(e);
      }
    }

    final frequency = ref.watch(waveFormStateProvider).tickFrequency;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MultiLabeledInput<int>(
          onSubmitted: _handleUpdate,
          onFocusLost: _handleUpdate,
          onFocus: clearError,
          mainLabel: "Tick frequency",
          secondaryLabel: "ms",
          value: frequency,
        ),
        SizedBox.fromSize(
          size: Size.fromHeight(6),
        ),
        ErrorDisplay(error: error),
      ],
    );
  }
}
