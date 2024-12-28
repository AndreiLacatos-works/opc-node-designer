import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/opc/opc_structure/opc_node/OpcNode.Actions.dart';
import 'package:waveform_designer/widgets/designer/opc/opc_structure/opc_node/OpcNode.State.dart';
import 'package:waveform_designer/widgets/shared/SimpleButton.dart';

class OpcValueNode extends ConsumerWidget with OpcNodeState, OpcNodeActions {
  final OpcValueNodeModel node;
  final int level;
  static const double offset = 26.0;

  OpcValueNode({
    required this.node,
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(left: offset),
      child: SimpleButton(
        onClick: () {
          selectNode(
            ref,
            node,
          );
        },
        color: isSelected(ref, node)
            ? AppTheme.purple.withAlpha(71)
            : AppTheme.transparent,
        padding: const EdgeInsets.all(2),
        content: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: FaIcon(
                FontAwesomeIcons.database,
                color: AppTheme.purple,
                size: 20,
              ),
            ),
            SizedBox.square(
              dimension: 8,
            ),
            Text(
              node.label,
              style: TextStyle(
                color: AppTheme.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
