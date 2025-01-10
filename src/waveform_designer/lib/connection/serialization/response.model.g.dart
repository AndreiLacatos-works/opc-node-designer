// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerResponseModel _$ServerResponseModelFromJson(Map<String, dynamic> json) =>
    ServerResponseModel(
      status: json['status'] as String,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$ServerResponseModelToJson(
        ServerResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reason': instance.reason,
    };
