import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/opc_designer/opc_designer.state.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.state.dart';
import 'package:opc_node_designer/widgets/designer/opc/opc_structure/opc_node/OpcContainerNode.dart';

class OpcStructureBrowser extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OpcStructureBrowserState();
}

class _OpcStructureBrowserState extends ConsumerState {
  @override
  void initState() {
    final rootContainer = ref.read(opcStructureStateProvider).root;
    Future(() =>
        ref.read(opcDesignerStateProvider.notifier).expandRoot(rootContainer));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
