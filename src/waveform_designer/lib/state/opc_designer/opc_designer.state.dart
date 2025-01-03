import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:opc_node_designer/state/designer/designer.state.dart';
import 'package:opc_node_designer/state/opc_designer/opc_designer.model.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.state.dart';
import 'package:opc_node_designer/state/waveform/waveform.state.dart';

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
    ref.listen(waveFormStateProvider, (_, newWaveform) {
      final selectedValueNode = state.selectedNode;
      if (selectedValueNode is OpcValueNodeModel) {
        // update the waveform of the selected value node on waveform store state change
        ref
            .read(opcStructureStateProvider.notifier)
            .updateWaveform(selectedValueNode, newWaveform);
      }
    });
    return _initialState;
  }

  void reset() {
    state = _initialState;
  }

  void selectNode(OpcStructureNodeModel? node) {
    var expandedContainers = state.expandedContainers;
    final previousSelection = state.selectedNode;
    final selectionChanged = node != previousSelection;
    if (node is OpcContainerNodeModel) {
      expandedContainers = _toggleExpansion(expandedContainers, node);
    }
    // expand containers to the selected node
    if (node != null && selectionChanged) {
      final root = ref.read(opcStructureStateProvider).root;
      expandedContainers =
          [...expandedContainers, ..._getPath(root, node)].toSet().toList();
    }

    state = state.copyWith(
      selectedNode: node,
      expandedContainers: expandedContainers,
    );

    // update the waveform diagram state to show the waveform of the selected node
    var waveformNotifier = ref.read(waveFormStateProvider.notifier);
    if (node is OpcValueNodeModel) {
      waveformNotifier.initialize(node.waveform);
    } else {
      waveformNotifier.reset();
    }
    ref.read(designerStateProvider.notifier).resetPan();
  }

  void expandRoot(OpcContainerNodeModel container) {
    final children = _listChildContainersRecursively(container)
        .where((container) => container.children.length > 0);
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
    // update the waveform diagram state to show the waveform of the selected node
    var waveformNotifier = ref.read(waveFormStateProvider.notifier);
    if (newSelection is OpcValueNodeModel) {
      waveformNotifier.initialize(newSelection.waveform);
    } else {
      waveformNotifier.reset();
    }
  }

  List<OpcContainerNodeModel> _listChildContainersRecursively(
      OpcContainerNodeModel root) {
    return _flattenTree(root).whereType<OpcContainerNodeModel>().toList();
  }

  List<OpcStructureNodeModel> _flattenTree(OpcContainerNodeModel root) {
    final nonEmptyChildren =
        root.children.whereType<OpcContainerNodeModel>().toList();
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
    final isExpanded = newState.any((n) => n.getId() == container.getId());
    if (isExpanded) {
      newState.removeWhere((n) => n.getId() == container.getId());
    } else {
      newState.add(container);
    }
    return newState;
  }

  List<OpcContainerNodeModel> _getPath(
    OpcContainerNodeModel root,
    OpcStructureNodeModel target,
  ) {
    List<OpcContainerNodeModel> path = [root];

    switch (target) {
      case OpcContainerNodeModel():
        if (root.getId() == target.getId()) {
          return path;
        }
        break;
      case OpcValueNodeModel():
        if (root.children.any((n) => n.getId() == target.getId())) {
          return path;
        }
        break;
    }

    for (final child in root.children.whereType<OpcContainerNodeModel>()) {
      final childPath = _getPath(child, target);

      if (childPath.isNotEmpty) {
        return path + childPath;
      }
    }

    return [];
  }
}
