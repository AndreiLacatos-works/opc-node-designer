// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opc_structure.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpcStructureNodeModel _$OpcStructureNodeModelFromJson(
        Map<String, dynamic> json) =>
    OpcStructureNodeModel(
      id: json['id'] as String,
      label: json['label'] as String,
      type: $enumDecode(_$OpcStructureTypeEnumMap, json['type']),
      children: (json['children'] as List<dynamic>?)
              ?.map((e) =>
                  OpcStructureNodeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      waveform: json['waveform'] == null
          ? null
          : WaveFormModel.fromJson(json['waveform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpcStructureNodeModelToJson(
        OpcStructureNodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': _$OpcStructureTypeEnumMap[instance.type]!,
      'children': instance.children,
      'waveform': instance.waveform,
    };

const _$OpcStructureTypeEnumMap = {
  OpcStructureType.unknown: 'unknown',
  OpcStructureType.container: 'container',
  OpcStructureType.value: 'value',
};

OpcStructureModel _$OpcStructureModelFromJson(Map<String, dynamic> json) =>
    OpcStructureModel(
      root:
          OpcStructureNodeModel.fromJson(json['root'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpcStructureModelToJson(OpcStructureModel instance) =>
    <String, dynamic>{
      'root': instance.root,
    };
