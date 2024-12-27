import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.state.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';

mixin OpcContainerNodeState {
  bool isExpanded(WidgetRef ref, OpcContainerNodeModel node) =>
      ref.watch(opcDesignerStateProvider).expandedContainers.contains(node);
}
