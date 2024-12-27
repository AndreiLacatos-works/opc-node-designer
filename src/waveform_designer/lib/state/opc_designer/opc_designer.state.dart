import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.model.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.state.dart';

part 'opc_designer.state.g.dart';

@riverpod
class OpcDesignerState extends _$OpcDesignerState {
  static OpcDesignerModel _initialState = OpcDesignerModel(
    selectedNode: null,
    expandedContainers: [],
  );

  @override
  OpcDesignerModel build() {
    ref.listen(opcStructureStateProvider, (_, newState) {
      _preserveExpansion(newState.root);
    });
    return _initialState;
  }

  void selectNode(OpcStructureNodeModel? node) {
    var expandedContainers = state.expandedContainers;
    if (node is OpcContainerNodeModel) {
      expandedContainers = _toggleExpansion(expandedContainers, node);
    }
    state = state.copyWith(
      selectedNode: node,
      expandedContainers: expandedContainers,
    );
  }

  void expandRoot(OpcContainerNodeModel container) {
    final children = _listChildContainersRecursively(container);
    state = state.copyWith(
      expandedContainers:
          [...state.expandedContainers, ...children].toSet().toList(),
    );
  }

  void _preserveExpansion(OpcContainerNodeModel newRoot) {
    final newContainers = _listChildContainersRecursively(newRoot);
    final previousExpansion = state.expandedContainers;
    final newExpansion = <OpcContainerNodeModel>[];
    for (final container in newContainers) {
      if (previousExpansion.any((node) => node.id == container.id)) {
        newExpansion.add(container);
      }
    }
    state = state.copyWith(expandedContainers: newExpansion);
  }

  List<OpcContainerNodeModel> _listChildContainersRecursively(
      OpcContainerNodeModel root) {
    final nonEmptyChildren = root.children
        .whereType<OpcContainerNodeModel>()
        .where((container) => container.children.length > 0)
        .toList();
    final descendants = <OpcContainerNodeModel>[];
    for (final child in nonEmptyChildren) {
      descendants.addAll(_listChildContainersRecursively(child));
    }
    return [root, ...descendants];
  }

  List<OpcContainerNodeModel> _toggleExpansion(
      List<OpcContainerNodeModel> expandedContainers,
      OpcContainerNodeModel container) {
    final newState = [...expandedContainers];
    final removed = newState.remove(container);
    if (!removed) {
      newState.add(container);
    }
    return newState;
  }
}
