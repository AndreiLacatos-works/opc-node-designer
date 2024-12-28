// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waveform.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaveFormValueModel _$WaveFormValueModelFromJson(Map<String, dynamic> json) =>
    WaveFormValueModel(
      tick: (json['tick'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$WaveFormValueModelToJson(WaveFormValueModel instance) =>
    <String, dynamic>{
      'tick': instance.tick,
      'value': instance.value,
    };

WaveFormModel _$WaveFormModelFromJson(Map<String, dynamic> json) =>
    WaveFormModel(
      duration: (json['duration'] as num).toInt(),
      tickFrequency: (json['tickFrequency'] as num).toInt(),
      transitionPoints: (json['transitionPoints'] as List<dynamic>)
          .map((e) => WaveFormValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WaveFormModelToJson(WaveFormModel instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'tickFrequency': instance.tickFrequency,
      'transitionPoints': instance.transitionPoints,
    };
