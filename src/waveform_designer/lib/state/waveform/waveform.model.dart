import 'package:freezed_annotation/freezed_annotation.dart';

part 'waveform.model.freezed.dart';

@freezed
class WaveFormValueModel with _$WaveFormValueModel {
  factory WaveFormValueModel({
    required int tick,
    required double value,
  }) = _WaveFormValue;
}

@freezed
class WaveFormModel with _$WaveFormModel {
  factory WaveFormModel({
    required int duration,
    required int tickFrequency,
    required List<WaveFormValueModel> values,
  }) = _WaveFormModel;
}
