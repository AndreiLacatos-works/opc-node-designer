// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waveform.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaveFormModel _$WaveFormModelFromJson(Map<String, dynamic> json) =>
    WaveFormModel(
      duration: (json['duration'] as num).toInt(),
      tickFrequency: (json['tickFrequency'] as num).toInt(),
      transitionPoints: (json['transitionPoints'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$WaveFormModelToJson(WaveFormModel instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'tickFrequency': instance.tickFrequency,
      'transitionPoints': instance.transitionPoints,
    };
