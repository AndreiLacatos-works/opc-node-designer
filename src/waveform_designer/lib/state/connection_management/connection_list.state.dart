import 'package:opc_node_designer/state/connection_management/connection_list.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
}
