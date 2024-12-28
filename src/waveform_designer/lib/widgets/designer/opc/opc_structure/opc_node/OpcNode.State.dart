import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.state.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';

mixin OpcNodeState {
  bool isSelected(WidgetRef ref, OpcStructureNodeModel node) =>
      ref.watch(opcDesignerStateProvider).selectedNode?.getId() == node.getId();
}
