import 'package:freezed_annotation/freezed_annotation.dart';

part 'waveform.model.freezed.dart';

@freezed
class WaveFormModel with _$WaveFormModel {
  factory WaveFormModel({
    required int duration,
    required int tickFrequency,
    required List<int> transitionPoints,
  }) = _WaveFormModel;
}
