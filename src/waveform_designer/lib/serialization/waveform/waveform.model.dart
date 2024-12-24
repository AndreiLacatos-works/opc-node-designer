import 'package:json_annotation/json_annotation.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart'
    as WaveFormState;

part 'waveform.model.g.dart';

@JsonSerializable()
class WaveFormModel {
  final int duration;
  final int tickFrequency;
  final List<int> transitionPoints;

  WaveFormModel({
    required this.duration,
    required this.tickFrequency,
    required this.transitionPoints,
  });

  factory WaveFormModel.fromJson(Map<String, dynamic> json) =>
      _$WaveFormModelFromJson(json);
  factory WaveFormModel.fromState(WaveFormState.WaveFormModel state) =>
      WaveFormModel(
        duration: state.duration,
        tickFrequency: state.tickFrequency,
        transitionPoints: state.transitionPoints,
      );
  Map<String, dynamic> toJson() => _$WaveFormModelToJson(this);
}
