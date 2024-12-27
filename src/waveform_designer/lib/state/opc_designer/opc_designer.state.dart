import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.model.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';

part 'opc_designer.state.g.dart';

@riverpod
class OpcDesignerState extends _$OpcDesignerState {
  static OpcDesignerModel _initialState = OpcDesignerModel(
    selectedNode: null,
    expandedContainers: [],
  );

  @override
  OpcDesignerModel build() {
    return _initialState;
  }

  void selectNode(OpcStructureNodeModel? node) {
    switch (node) {
      case OpcContainerNodeModel():
        print("Container");
        break;
      case OpcValueNodeModel():
        print("Value");
        break;
    }
    state = state.copyWith(selectedNode: node);
  }
}
