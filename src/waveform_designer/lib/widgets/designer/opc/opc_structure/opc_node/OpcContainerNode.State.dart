import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.state.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';

mixin OpcContainerNodeState {
  bool isExpanded(WidgetRef ref, OpcContainerNodeModel node) =>
      ref.watch(opcDesignerStateProvider).expandedContainers.contains(node);

  List<OpcStructureNodeModel> getOrderedChildren(OpcContainerNodeModel node) {
    final children = [...node.children];
    children.sort(_opcNodeSorter);
    return children;
  }

  int _opcNodeSorter(OpcStructureNodeModel one, OpcStructureNodeModel other) {
    // containers before values
    if (one is OpcValueNodeModel && other is OpcContainerNodeModel) {
      return 1;
    }

    return one.getLabel().compareTo(other.getLabel());
  }
}
