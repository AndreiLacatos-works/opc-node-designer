import 'package:waveform_designer/state/waveform/waveform.model.dart';

abstract class AbstractManagerRules {
  void ensureRulesFulfilled(
    WaveFormModel waveform,
    WaveFormValueModel value,
  );
}
