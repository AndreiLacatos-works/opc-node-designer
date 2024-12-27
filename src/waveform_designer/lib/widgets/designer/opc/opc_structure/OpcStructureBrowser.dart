import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.state.dart';
import 'package:waveform_designer/widgets/designer/opc/opc_structure/opc_node/OpcContainerNode.dart';

class OpcStructureBrowser extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootContainer = ref.watch(opcStructureStateProvider).root;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: SingleChildScrollView(
          child: OpcContainerNode(
            node: rootContainer,
            level: 0,
          ),
        ),
      ),
    );
  }
}
