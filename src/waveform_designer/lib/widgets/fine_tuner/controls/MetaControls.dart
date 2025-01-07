import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.state.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/numeric_meta_controls/SmoothingStrategyControl.dart';

class MetaControls extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(waveFormStateProvider).type;
    return switch (type) {
      DoubleValue => SmoothingStrategyControl(),
      _ => SizedBox.shrink(),
    };
  }
}
