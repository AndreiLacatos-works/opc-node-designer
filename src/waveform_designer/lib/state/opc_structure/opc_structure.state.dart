import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

part 'opc_structure.state.g.dart';

@riverpod
class OpcStructureState extends _$OpcStructureState {
  static OpcStructureModel _makeInitialState() {
    final uuid = Uuid();
    return OpcStructureModel(
      root: OpcContainerNodeModel(
        id: uuid.v4(),
        children: [
          OpcContainerNodeModel(
            id: uuid.v4(),
            children: [
              OpcContainerNodeModel(
                id: uuid.v4(),
                children: [
                  OpcValueNodeModel(
                    id: uuid.v4(),
                    label: "Value 7",
                    waveform: WaveFormModel(
                      duration: 1700,
                      tickFrequency: 50,
                      values: [
                        WaveFormValue(
                          tick: 0,
                          value: 21.0,
                        ),
                        WaveFormValue(
                          tick: 350,
                          value: 171.7,
                        ),
                        WaveFormValue(
                          tick: 500,
                          value: 27.0,
                        ),
                        WaveFormValue(
                          tick: 950,
                          value: 37.7,
                        ),
                        WaveFormValue(
                          tick: 1400,
                          value: 9.0,
                        ),
                        WaveFormValue(
                          tick: 1550,
                          value: 156.7,
                        ),
                      ],
                    ),
                  ),
                  OpcContainerNodeModel(
                    id: uuid.v4(),
                    children: [],
                    label: "Container 4",
                  ),
                  OpcValueNodeModel(
                    id: uuid.v4(),
                    label: "Value 3",
                    waveform: WaveFormModel(
                      duration: 800,
                      tickFrequency: 50,
                      values: [
                        WaveFormValue(
                          tick: 50,
                          value: 9.0,
                        ),
                        WaveFormValue(
                          tick: 350,
                          value: 21.0,
                        ),
                        WaveFormValue(
                          tick: 500,
                          value: 27.0,
                        ),
                        WaveFormValue(
                          tick: 550,
                          value: 156.7,
                        ),
                        WaveFormValue(
                          tick: 600,
                          value: 171.7,
                        ),
                        WaveFormValue(
                          tick: 750,
                          value: 37.7,
                        ),
                      ],
                    ),
                  ),
                ],
                label: "Container 3",
              ),
            ],
            label: "Container 1",
          ),
          OpcContainerNodeModel(
            id: uuid.v4(),
            children: [],
            label: "Container 2",
          ),
          OpcValueNodeModel(
            id: uuid.v4(),
            label: "Value 1",
            waveform: WaveFormModel(
              duration: 1000,
              tickFrequency: 100,
              values: [
                WaveFormValue(
                  tick: 400,
                  value: 83.0,
                ),
                WaveFormValue(
                  tick: 600,
                  value: 171.7,
                ),
              ],
            ),
          ),
        ],
        label: "Root",
      ),
    );
  }

  @override
  OpcStructureModel build() {
    return _makeInitialState();
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
