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

WaveformMetaModel _$WaveformMetaModelFromJson(Map<String, dynamic> json) =>
    WaveformMetaModel(
      smoothing: json['smoothing'] as String?,
    );

Map<String, dynamic> _$WaveformMetaModelToJson(WaveformMetaModel instance) =>
    <String, dynamic>{
      if (instance.smoothing case final value?) 'smoothing': value,
    };

WaveFormModel _$WaveFormModelFromJson(Map<String, dynamic> json) =>
    WaveFormModel(
      duration: (json['duration'] as num).toInt(),
      tickFrequency: (json['tickFrequency'] as num).toInt(),
      type: $enumDecode(_$WaveFormTypeEnumMap, json['type']),
      transitionPoints: (json['transitionPoints'] as List<dynamic>)
          .map((e) => WaveFormValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : WaveformMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WaveFormModelToJson(WaveFormModel instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'tickFrequency': instance.tickFrequency,
      'type': _$WaveFormTypeEnumMap[instance.type]!,
      'transitionPoints': instance.transitionPoints,
      if (instance.meta case final value?) 'meta': value,
    };

const _$WaveFormTypeEnumMap = {
  WaveFormType.transitions: 'transitions',
  WaveFormType.doubleValues: 'doubleValues',
};
