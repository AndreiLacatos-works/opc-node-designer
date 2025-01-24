// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_list.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionListModel _$ConnectionListModelFromJson(Map<String, dynamic> json) =>
    ConnectionListModel(
      connections: (json['connections'] as List<dynamic>?)
              ?.map((e) => ConnectionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$ConnectionListModelToJson(
        ConnectionListModel instance) =>
    <String, dynamic>{
      'connections': instance.connections,
    };
