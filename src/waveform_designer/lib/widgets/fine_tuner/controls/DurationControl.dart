import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.dart';
import 'package:waveform_designer/widgets/input/MultiLabeledInput.dart';

class DurationControl extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void _handleUpdate(int? newDuration) {
      if (newDuration == null) {
        return;
      }
      ref.read(waveFormStateProvider.notifier).updateDuration(newDuration);
    }

    final duration = ref.watch(waveFormStateProvider).duration;
    return MultiLabeledInput(
      onSubmitted: _handleUpdate,
      onFocusLost: _handleUpdate,
      mainLabel: "Duration",
      secondaryLabel: "ms",
      value: duration,
    );
  }
}
