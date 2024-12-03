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

  void updateTransitionPoint(int pointIndex, int newValue) {
    if (pointIndex < 0 || pointIndex >= state.transitionPoints.length) {
      return;
    }

    var newPoints = [...state.transitionPoints];
    newPoints[pointIndex] = newValue;
    state = state.copyWith(transitionPoints: newPoints);
  }

  void removeTransitionPoint(int pointIndex) {
    if (pointIndex < 0 || pointIndex >= state.transitionPoints.length) {
      return;
    }

    var newPoints = [...state.transitionPoints];
    newPoints.removeAt(pointIndex);
    state = state.copyWith(transitionPoints: newPoints);
  }

  void addTransitionPoint(int value) {
    var newPoints = [...state.transitionPoints, value];
    newPoints.sort();
    state = state.copyWith(transitionPoints: newPoints);
  }
}
