import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.state.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';

mixin OpcContainerNodeState {
  bool isExpanded(WidgetRef ref, OpcContainerNodeModel node) =>
      ref.watch(opcDesignerStateProvider).expandedContainers.contains(node);

  List<OpcStructureNodeModel> getOrderedChildren(OpcContainerNodeModel node) {
    final containerNodes =
        node.children.whereType<OpcContainerNodeModel>().toList();
    final valueNodes = node.children.whereType<OpcValueNodeModel>().toList();
    containerNodes.sort(_labelSorter);
    valueNodes.sort(_labelSorter);
    return [...containerNodes, ...valueNodes];
  }

  int _labelSorter(OpcStructureNodeModel one, OpcStructureNodeModel other) {
    return one
        .getLabel()
        .toLowerCase()
        .compareTo(other.getLabel().toLowerCase());
  }
}
