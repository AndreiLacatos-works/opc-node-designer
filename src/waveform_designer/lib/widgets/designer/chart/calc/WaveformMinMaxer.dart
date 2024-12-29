import 'package:waveform_designer/state/waveform/waveform.model.dart';

mixin WaveformMinMaxer {
  List<double> getWaveformMinMaxValues(List<WaveFormValueModel> values) {
    if (values.isEmpty) {
      return [0, 0];
    }

    var minValue = values[0].value.getValue();
    var maxValue = values[0].value.getValue();

    for (final value in values.sublist(1)) {
      final num = value.value.getValue();
      if (num < minValue) {
        minValue = num;
      }
      if (num > maxValue) {
        maxValue = num;
      }
    }

    return [minValue, maxValue];
  }
}
