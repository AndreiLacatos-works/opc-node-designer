import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

part 'waveform.g.dart';

@riverpod
class WaveFormState extends _$WaveFormState {
  @override
  WaveFormModel build() {
    return WaveFormModel(
      duration: 1000,
      tickFrequency: 100,
      transitionPoints: [500],
    );
  }

  void updateDuration(int newDuration) {
    state = state.copyWith(duration: newDuration);
  }

  void updateTickFrequency(int newTickFrequency) {
    state = state.copyWith(tickFrequency: newTickFrequency);
  }
}
