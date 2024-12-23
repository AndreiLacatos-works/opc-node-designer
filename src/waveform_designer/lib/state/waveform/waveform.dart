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
    if (newDuration < state.tickFrequency) {
      throw 'Durationg must be greater than tick frequency!';
    }
    var lastTransition = state.transitionPoints.lastOrNull ?? 0;
    if (newDuration < lastTransition) {
      throw 'Duration is too short to display all transition points!';
    }
    state = state.copyWith(duration: newDuration);
  }

  void updateTickFrequency(int newTickFrequency) {
    if (newTickFrequency > state.duration) {
      throw 'Tick frequency must be less than duration!';
    }
    var allTransitionPointsAligned =
        state.transitionPoints.every(_intersectsTicks);
    if (!allTransitionPointsAligned) {
      throw 'Some transition points do not intersect with the new tick frequency!';
    }
    state = state.copyWith(tickFrequency: newTickFrequency);
  }

  void updateTransitionPoint(int pointIndex, int newValue) {
    if (pointIndex < 0 || pointIndex >= state.transitionPoints.length) {
      return;
    }
    _ensureTransitionPointRulesFulfilled(newValue);
    var newPoints = [...state.transitionPoints];
    newPoints[pointIndex] = newValue;
    state = state.copyWith(transitionPoints: _sortAndUnique(newPoints));
  }

  void removeTransitionPoint(int pointIndex) {
    if (pointIndex < 0 || pointIndex >= state.transitionPoints.length) {
      return;
    }

    var newPoints = [...state.transitionPoints];
    newPoints.removeAt(pointIndex);
    state = state.copyWith(transitionPoints: _sortAndUnique(newPoints));
  }

  void addTransitionPoint(int value) {
    _ensureTransitionPointRulesFulfilled(value);
    var newPoints = [...state.transitionPoints, value];
    state = state.copyWith(transitionPoints: _sortAndUnique(newPoints));
  }

  List<int> _sortAndUnique(List<int> values) {
    values.sort();
    return values.toSet().toList();
  }

  bool _intersectsTicks(int point) {
    return point % state.tickFrequency == 0;
  }

  void _ensureTransitionPointRulesFulfilled(int value) {
    if (!_intersectsTicks(value)) {
      throw 'Transition point must intersect with a tick!';
    }
    if (value < 0 || value > state.duration) {
      throw 'Can not add transition point outside the duration window!';
    }
    if (value == 0) {
      throw 'Can not add transition point on the first tick!';
    }
    if (value == state.duration) {
      throw 'Can not add transition point on the last tick!';
    }
  }
}
