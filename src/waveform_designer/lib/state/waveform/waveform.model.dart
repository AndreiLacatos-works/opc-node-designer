import 'package:freezed_annotation/freezed_annotation.dart';

part 'waveform.model.freezed.dart';

@freezed
class WaveFormValue with _$WaveFormValue {
  factory WaveFormValue({
    required int tick,
    required double value,
  }) = _WaveFormValue;
}

@freezed
class WaveFormModel with _$WaveFormModel {
  factory WaveFormModel({
    required int duration,
    required int tickFrequency,
    required List<WaveFormValue> values,
  }) = _WaveFormModel;
}
