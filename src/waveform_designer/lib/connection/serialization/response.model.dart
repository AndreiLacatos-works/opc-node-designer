import 'package:json_annotation/json_annotation.dart';

part 'response.model.g.dart';

@JsonSerializable()
class ServerResponseModel {
  final String status;
  final String? reason;

  ServerResponseModel({
    required this.status,
    required this.reason,
  });

  factory ServerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServerResponseModelToJson(this);
}
