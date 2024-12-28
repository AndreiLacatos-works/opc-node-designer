import 'package:json_annotation/json_annotation.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart'
    as WaveFormState;

part 'waveform.model.g.dart';

@JsonSerializable()
class WaveFormValueModel {
  final int tick;
  final double value;

  WaveFormValueModel({
    required this.tick,
    required this.value,
  });

  factory WaveFormValueModel.fromJson(Map<String, dynamic> json) =>
      _$WaveFormValueModelFromJson(json);

  factory WaveFormValueModel.fromState(
          WaveFormState.WaveFormValueModel state) =>
      WaveFormValueModel(
        tick: state.tick,
        value: state.value,
      );

  Map<String, dynamic> toJson() => _$WaveFormValueModelToJson(this);

  WaveFormState.WaveFormValueModel toState() =>
      WaveFormState.WaveFormValueModel(
        tick: this.tick,
        value: this.value,
      );
}

@JsonSerializable()
class WaveFormModel {
  final int duration;
  final int tickFrequency;
  final List<WaveFormValueModel> transitionPoints;

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
        transitionPoints:
            state.values.map((n) => WaveFormValueModel.fromState(n)).toList(),
      );

  Map<String, dynamic> toJson() => _$WaveFormModelToJson(this);

  WaveFormState.WaveFormModel toState() => WaveFormState.WaveFormModel(
        duration: this.duration,
        tickFrequency: this.tickFrequency,
        values: this
            .transitionPoints
            .map(
              (v) => v.toState(),
            )
            .toList(),
      );
}
