import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/waveform/waveform.state.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/numeric_meta_controls/SmoothingStrategyControl.Actions.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/numeric_meta_controls/SmoothingStrategyControl.State.dart';
import 'package:opc_node_designer/widgets/input/Dropdown.dart';

class SmoothingStrategyControl extends ConsumerWidget
    with SmoothingStrategyControlState, SmoothingStrategyControlActions {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meta = ref.watch(waveFormStateProvider).meta;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            "Smoothing strategy",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Dropdown(
          items: options,
          onChanged: (newStrategy) {
            handleChange(newStrategy, ref);
          },
          selectedItem: getSelectedItem(meta),
          border: false,
        ),
      ],
    );
  }
}
