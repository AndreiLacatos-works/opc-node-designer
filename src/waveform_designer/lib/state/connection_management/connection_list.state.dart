import 'package:opc_node_designer/state/connection_management/connection.model.dart';
import 'package:opc_node_designer/state/connection_management/connection_list.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'connection_list.state.g.dart';

@riverpod
class ConnectionListState extends _$ConnectionListState {
  static ConnectionListModel _initialState = ConnectionListModel(
    connections: [],
  );

  @override
  ConnectionListModel build() {
    return _initialState;
  }

  void initialize(ConnectionListModel newState) {
    state = newState;
  }

  void updateConnection(String name, String host, int port) {
    final con = state.connections.where((c) => c.name == name).firstOrNull;
    if (con == null) {
      return;
    }

    state = state.copyWith(
      connections: [
        ...state.connections.where((con) => con.name != name),
        con.copyWith(
          host: host,
          port: port,
        ),
      ],
    );
  }

  void addConnection(String name, String host, int port) {
    state = state.copyWith(
      connections: [
        ...state.connections,
        ConnectionModel(
          id: Uuid().v4(),
          name: name,
          host: host,
          port: port,
        ),
      ],
    );
  }
}
