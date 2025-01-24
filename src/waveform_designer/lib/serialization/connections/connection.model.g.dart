// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionModel _$ConnectionModelFromJson(Map<String, dynamic> json) =>
    ConnectionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      host: json['host'] as String,
      port: (json['port'] as num).toInt(),
    );

Map<String, dynamic> _$ConnectionModelToJson(ConnectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'host': instance.host,
      'port': instance.port,
    };
