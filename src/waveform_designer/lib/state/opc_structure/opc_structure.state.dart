import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

part 'opc_structure.state.g.dart';

@riverpod
class OpcStructureState extends _$OpcStructureState {
  static OpcStructureModel _initialState = OpcStructureModel(
    root: OpcContainerNodeModel(
      children: [],
      id: Uuid().v4(),
      label: "Application root",
    ),
  );

  @override
  OpcStructureModel build() {
    return _initialState;
  }

  void initialize(OpcStructureModel newState) {
    state = newState;
  }

  void reset() {
    state = _initialState;
  }

  void removeNode(OpcStructureNodeModel node) {
    final parent = _getParent(state.root, node);
    if (parent == null) {
      return;
    }

    final updatedChildren = [...parent.children];
    updatedChildren.remove(node);
    final updatedParent = parent.copyWith(children: updatedChildren);

    state = state.copyWith(root: _replaceNode(state.root, updatedParent));
  }

  void insertNode(
    OpcStructureNodeModel newNode,
    OpcStructureNodeModel? insertionPoint,
  ) {
    OpcContainerNodeModel? parent = null;
    switch (insertionPoint) {
      case OpcContainerNodeModel():
        parent = insertionPoint;
        break;
      case OpcValueNodeModel():
        parent = _getParent(state.root, insertionPoint);
        break;
    }
    var updatedParent = (parent ?? state.root);
    updatedParent = updatedParent.copyWith(
      children: [...updatedParent.children, newNode],
    );
    state = state.copyWith(root: _replaceNode(state.root, updatedParent));
  }

  void updateWaveform(OpcValueNodeModel node, WaveFormModel newWaveform) {
    final updatedNode = node.copyWith(
      waveform: newWaveform,
    );
    state = state.copyWith(root: _replaceNode(state.root, updatedNode));
  }

  OpcContainerNodeModel? _getParent(
    OpcContainerNodeModel root,
    OpcStructureNodeModel target,
  ) {
    if (root.children.isEmpty) {
      return null;
    }

    for (final child in root.children) {
      if (child == target) {
        return root;
      }
    }

    for (final child in root.children.whereType<OpcContainerNodeModel>()) {
      final parent = _getParent(child, target);
      if (parent != null) {
        return parent;
      }
    }

    return null;
  }

  OpcContainerNodeModel _replaceNode(
    OpcContainerNodeModel root,
    OpcStructureNodeModel nodeToReplace,
  ) {
    if (root.getId() == nodeToReplace.getId() &&
        nodeToReplace is OpcContainerNodeModel) {
      return nodeToReplace;
    }

    final newChildren = <OpcStructureNodeModel>[];
    for (final child in root.children) {
      if (child.getId() == nodeToReplace.getId()) {
        newChildren.add(nodeToReplace);
      } else {
        switch (child) {
          case OpcContainerNodeModel():
            newChildren.add(_replaceNode(child, nodeToReplace));
            break;
          case OpcValueNodeModel():
            newChildren.add(child.copyWith());
            break;
        }
      }
    }
    final newRoot = root.copyWith(children: newChildren);
    return newRoot;
  }
}
