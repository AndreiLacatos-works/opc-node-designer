import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.state.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/shared/TextButton.dart';

class OpcStructureActions extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueNodeSelected =
        ref.watch(opcDesignerStateProvider).selectedNode is OpcValueNodeModel;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onClick: () {},
            text: "Add container",
            color: AppTheme.brightGreen,
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
          ),
          SizedBox.square(
            dimension: 12,
          ),
          TextButton(
            onClick: () {},
            text: "Add node",
            color: AppTheme.brightGreen,
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
          ),
          SizedBox.square(
            dimension: 12,
          ),
          TextButton(
            onClick: () {},
            text: "Remove",
            color: AppTheme.danger,
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
            disabled: !valueNodeSelected,
          ),
        ],
      ),
    );
  }
}
