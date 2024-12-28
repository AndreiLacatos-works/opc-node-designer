import 'package:waveform_designer/state/waveform/value_managers_rules/abstract_manager_rules.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

class TransitionValueRules extends AbstractManagerRules<Unit> {
  @override
  void ensureRulesFulfilled(
    WaveFormModel waveform,
    WaveFormValueModel<Unit> value,
  ) {
    if (value.tick == 0) {
      throw 'Can not add transition point on the first tick!';
    }
    if (value.tick == waveform.duration) {
      throw 'Can not add transition point on the last tick!';
    }
  }
}
