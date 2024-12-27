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
      _preserveSelection(newState.root);
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

  void _preserveSelection(OpcContainerNodeModel newRoot) {
    final currentSelection = state.selectedNode?.getId();
    final treeItems = _flattenTree(newRoot);
    final newSelection =
        treeItems.where((n) => n.getId() == currentSelection).firstOrNull;
    state = state.copyWith(selectedNode: newSelection);
  }

  List<OpcContainerNodeModel> _listChildContainersRecursively(
      OpcContainerNodeModel root) {
    return _flattenTree(root).whereType<OpcContainerNodeModel>().toList();
  }

  List<OpcStructureNodeModel> _flattenTree(OpcContainerNodeModel root) {
    final nonEmptyChildren = root.children
        .whereType<OpcContainerNodeModel>()
        .where((container) => container.children.length > 0)
        .toList();
    final items = root.children
        .whereType<OpcValueNodeModel>()
        .cast<OpcStructureNodeModel>()
        .toList();
    for (final child in nonEmptyChildren) {
      items.addAll(_flattenTree(child));
    }
    return [root, ...items];
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
