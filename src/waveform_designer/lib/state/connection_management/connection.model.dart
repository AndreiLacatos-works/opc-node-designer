import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection.model.freezed.dart';

@freezed
class ConnectionModel with _$ConnectionModel {
  factory ConnectionModel({
    required String id,
    required String name,
    required String host,
    required int port,
  }) = _ConnectionModel;
}
