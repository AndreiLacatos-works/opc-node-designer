import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waveform_designer/state/waveform/value_managers_rules/abstract_manager_rules.dart';
import 'package:waveform_designer/state/waveform/value_managers_rules/null_rules.dart';
import 'package:waveform_designer/state/waveform/value_managers_rules/transition_value_rules.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

part 'waveform.state.g.dart';

@riverpod
class WaveFormState extends _$WaveFormState {
  AbstractManagerRules _ruleValidator = NullRules();
  static WaveFormModel _initialState = WaveFormModel(
    duration: 0,
    tickFrequency: 0,
    values: [],
    type: Unit,
  );

  @override
  WaveFormModel build() {
    return _initialState;
  }

  void initialize(WaveFormModel model) {
    state = model;
    _ruleValidator = switch (model.type) {
      Unit => TransitionValueRules(),
      _ => NullRules(),
    };
  }

  void updateDuration(int newDuration) {
    if (newDuration < state.tickFrequency) {
      throw 'Durationg must be greater than tick frequency!';
    }
    var lastTransition = state.values.lastOrNull?.tick ?? 0;
    if (newDuration < lastTransition) {
      throw 'Duration is too short to display all transition points!';
    }
    state = state.copyWith(duration: newDuration);
  }

  void updateTickFrequency(int newTickFrequency) {
    if (newTickFrequency > state.duration) {
      throw 'Tick frequency must be less than duration!';
    }
    var allTransitionPointsAligned = state.values
        .every((point) => _intersectsTicks(point, newTickFrequency));
    if (!allTransitionPointsAligned) {
      throw 'Some transition points do not intersect with the new tick frequency!';
    }
    state = state.copyWith(tickFrequency: newTickFrequency);
  }

  void moveToTick(WaveFormValueModel value, int newTick) {
    final updatedValue = value.copyWith(tick: newTick);
    updateWaveformValue(updatedValue);
    removeWaveformValue(value);
  }

  void updateWaveformValue(WaveFormValueModel updatedValue) {
    _ensureBaseRulesFulfilled(updatedValue);
    _ruleValidator.ensureRulesFulfilled(state, updatedValue);
    var newPoints = [...state.values];
    newPoints
      ..remove(updatedValue)
      ..add(updatedValue);
    state = state.copyWith(values: _sortAndUniqueByTick(newPoints));
  }

  void removeWaveformValue(WaveFormValueModel value) {
    var newPoints = [...state.values];
    newPoints.removeWhere((p) => p.tick == value.tick);
    state = state.copyWith(values: _sortAndUniqueByTick(newPoints));
  }

  void addWaveformValue(WaveFormValueModel value) {
    _ensureBaseRulesFulfilled(value);
    _ruleValidator.ensureRulesFulfilled(state, value);
    var newPoints = [
      ...state.values,
      value,
    ];
    state = state.copyWith(values: _sortAndUniqueByTick(newPoints));
  }

  void reset() {
    state = _initialState;
    _ruleValidator = NullRules();
  }

  List<WaveFormValueModel> _sortAndUniqueByTick(
    List<WaveFormValueModel> values,
  ) {
    values.sort((a, b) => a.tick < b.tick ? -1 : 1);
    return values.toSet().toList();
  }

  bool _intersectsTicks(WaveFormValueModel value, int tickFrequency) {
    return state.tickFrequency == 0 ? false : value.tick % tickFrequency == 0;
  }

  void _ensureBaseRulesFulfilled(WaveFormValueModel value) {
    if (!_intersectsTicks(value, state.tickFrequency)) {
      throw 'Transition point must intersect with a tick!';
    }
    if (value.tick < 0 || value.tick > state.duration) {
      throw 'Can not add transition point outside the duration window!';
    }
  }
}
