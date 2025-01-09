// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerCommandModel _$ServerCommandModelFromJson(Map<String, dynamic> json) =>
    ServerCommandModel(
      command: json['command'] as String,
      payload:
          OpcStructureModel.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServerCommandModelToJson(ServerCommandModel instance) =>
    <String, dynamic>{
      'command': instance.command,
      'payload': instance.payload,
    };
