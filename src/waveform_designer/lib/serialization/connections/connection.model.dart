import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:opc_node_designer/state/connection_management/connection.model.dart'
    as ConnectionModelState;

part 'connection.model.g.dart';

@JsonSerializable()
class ConnectionModel {
  final String id;
  final String name;
  final String host;
  final int port;

  ConnectionModel({
    required this.id,
    required this.name,
    required this.host,
    required this.port,
  });

  factory ConnectionModel.fromJson(Map<String, dynamic> json) =>
      _$ConnectionModelFromJson(json);

  factory ConnectionModel.fromState(
          ConnectionModelState.ConnectionModel state) =>
      ConnectionModel(
        id: state.id.toString(),
        name: state.name,
        host: state.host,
        port: state.port,
      );

  Map<String, dynamic> toJson() => _$ConnectionModelToJson(this);

  ConnectionModelState.ConnectionModel toState() =>
      ConnectionModelState.ConnectionModel(
        id: id,
        name: name,
        host: host,
        port: port,
      );
}
