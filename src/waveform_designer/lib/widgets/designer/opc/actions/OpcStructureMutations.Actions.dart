import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/opc_designer/opc_designer.state.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.state.dart';
import 'package:opc_node_designer/widgets/designer/opc/actions/AddContainerModal.dart';
import 'package:opc_node_designer/widgets/designer/opc/actions/AddNodeModal.dart';
import 'package:opc_node_designer/widgets/shared/confirmation_dialog.dart';
import 'package:opc_node_designer/widgets/shared/custom_overlay.dart';

mixin OpcStructureMutationsActions {
  Future handleRemove(
    BuildContext context,
    WidgetRef ref,
    OpcStructureNodeModel? node,
  ) async {
    if (node == null) {
      return;
    }
    final confirmed = await showConfirmationDialog(
      context: context,
      prompt:
          "Are you sure you want to remove ${node.getLabel()}${node is OpcContainerNodeModel ? " and all its children" : ""}?",
    );
    if (confirmed) {
      ref.read(opcStructureStateProvider.notifier).removeNode(node);
    }
  }

  Future handleAddValueNode(
    BuildContext context,
    WidgetRef ref,
    OpcStructureNodeModel? node,
  ) async {
    final result = await showOverlay<OpcValueNodeModel?>(
      context: context,
      builder: (_) => AddNodeModal(),
    );
    if (result != null) {
      ref.read(opcStructureStateProvider.notifier).insertNode(
            result,
            node,
          );
      ref.read(opcDesignerStateProvider.notifier).selectNode(result);
    }
  }

  Future handleAddContainerNode(
    BuildContext context,
    WidgetRef ref,
    OpcStructureNodeModel? node,
  ) async {
    final result = await showOverlay<OpcContainerNodeModel?>(
      context: context,
      builder: (_) => AddContainerModal(),
    );
    if (result != null) {
      ref.read(opcStructureStateProvider.notifier).insertNode(
            result,
            node,
          );
      ref.read(opcDesignerStateProvider.notifier).selectNode(result);
    }
  }
}
