import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:opc_node_designer/serialization/connections/connection.model.dart';
import 'package:opc_node_designer/state/connection_management/connection_list.model.dart'
    as ConnectionListStateModel;

part 'connection_list.model.g.dart';

@JsonSerializable()
class ConnectionListModel {
  final List<ConnectionModel>? connections;

  ConnectionListModel({
    this.connections = null,
  });

  factory ConnectionListModel.fromJson(Map<String, dynamic> json) =>
      _$ConnectionListModelFromJson(json);

  factory ConnectionListModel.fromState(
          ConnectionListStateModel.ConnectionListModel state) =>
      ConnectionListModel(
        connections: state.connections.map(ConnectionModel.fromState).toList(),
      );

  Map<String, dynamic> toJson() => _$ConnectionListModelToJson(this);

  ConnectionListStateModel.ConnectionListModel toState() =>
      ConnectionListStateModel.ConnectionListModel(
        connections: this.connections?.map((x) => x.toState()).toList() ?? [],
      );
}
