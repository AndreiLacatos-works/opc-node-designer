import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';

part 'opc_structure.state.g.dart';

@riverpod
class OpcStructureState extends _$OpcStructureState {
  static OpcStructureModel _initialState = OpcStructureModel(
    root: OpcContainerNodeModel(
      children: [],
      label: "",
    ),
  );

  @override
  OpcStructureModel build() {
    return _initialState;
  }
}
