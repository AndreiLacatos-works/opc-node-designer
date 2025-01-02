import 'package:opc_node_designer/state/waveform/waveform.model.dart';

abstract class AbstractManagerRules {
  void ensureRulesFulfilled(
    WaveFormModel waveform,
    WaveFormValueModel value,
  );
}
