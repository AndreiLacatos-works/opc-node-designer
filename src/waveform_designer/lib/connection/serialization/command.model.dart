import 'package:json_annotation/json_annotation.dart';
import 'package:opc_node_designer/serialization/ops_structure/opc_structure.model.dart';

part 'command.model.g.dart';

@JsonSerializable()
class ServerCommandModel {
  final String command;
  final OpcStructureModel payload;

  ServerCommandModel({
    required this.command,
    required this.payload,
  });

  factory ServerCommandModel.fromJson(Map<String, dynamic> json) =>
      _$ServerCommandModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServerCommandModelToJson(this);
}
