import 'package:opc_node_designer/state/spinner/spinner.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spinner.state.g.dart';

@riverpod
class SpinnerState extends _$SpinnerState {
  @override
  SpinnerModel build() {
    return SpinnerModel(
      active: false,
    );
  }

  void start() {
    state = state.copyWith(active: true);
  }

  void stop() {
    state = state.copyWith(active: false);
  }
}
