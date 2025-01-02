import 'package:opc_node_designer/state/waveform/value_managers_rules/abstract_manager_rules.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';

class NullRules extends AbstractManagerRules {
  @override
  void ensureRulesFulfilled(
    WaveFormModel waveform,
    WaveFormValueModel<WaveformPointValue> value,
  ) {
    return;
  }
}
