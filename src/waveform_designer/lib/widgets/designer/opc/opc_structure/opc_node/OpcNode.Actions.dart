import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.state.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';

mixin OpcNodeActions {
  void selectNode(WidgetRef ref, OpcStructureNodeModel node) {
    ref.read(opcDesignerStateProvider.notifier).selectNode(node);
    var waveformNotifier = ref.read(waveFormStateProvider.notifier);
    if (node is OpcValueNodeModel) {
      waveformNotifier.initialize(node.waveform);
    } else {
      waveformNotifier.reset();
    }
  }
}
