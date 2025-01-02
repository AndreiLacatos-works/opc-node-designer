import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/opc_designer/opc_designer.state.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart';

mixin OpcNodeActions {
  void selectNode(WidgetRef ref, OpcStructureNodeModel node) {
    ref.read(opcDesignerStateProvider.notifier).selectNode(node);
  }
}
