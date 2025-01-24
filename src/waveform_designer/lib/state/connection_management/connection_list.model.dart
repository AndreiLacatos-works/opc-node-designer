import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opc_node_designer/state/connection_management/connection.model.dart';

part 'connection_list.model.freezed.dart';

@freezed
class ConnectionListModel with _$ConnectionListModel {
  factory ConnectionListModel({
    required List<ConnectionModel> connections,
  }) = _ConnectionListModel;
}
