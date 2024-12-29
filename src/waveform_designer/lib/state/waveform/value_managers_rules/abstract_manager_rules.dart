import 'package:waveform_designer/state/waveform/waveform.model.dart';

abstract class AbstractManagerRules<T extends WaveformPointValue> {
  void ensureRulesFulfilled(
    WaveFormModel waveform,
    WaveFormValueModel<T> value,
  );
}
