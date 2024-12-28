import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/opc/opc_structure/opc_node/OpcContainerNode.State.dart';
import 'package:waveform_designer/widgets/designer/opc/opc_structure/opc_node/OpcNode.Actions.dart';
import 'package:waveform_designer/widgets/designer/opc/opc_structure/opc_node/OpcNode.State.dart';
import 'package:waveform_designer/widgets/designer/opc/opc_structure/opc_node/OpcValueNode.dart';
import 'package:waveform_designer/widgets/shared/SimpleButton.dart';

class OpcContainerNode extends ConsumerWidget
    with OpcNodeState, OpcContainerNodeState, OpcNodeActions {
  final OpcContainerNodeModel node;
  final int level;
  static const double offset = 26.0;

  OpcContainerNode({
    required this.node,
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expanded = isExpanded(ref, node);
    return Padding(
      padding: const EdgeInsets.only(left: offset),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: SimpleButton(
              onClick: () {
                selectNode(
                  ref,
                  node,
                );
              },
              color: isSelected(ref, node)
                  ? AppTheme.amber.withAlpha(71)
                  : AppTheme.transparent,
              padding: const EdgeInsets.all(2),
              content: Row(
                children: [
                  FaIcon(
                    expanded
                        ? FontAwesomeIcons.folderOpen
                        : FontAwesomeIcons.solidFolder,
                    color: AppTheme.amber,
                    size: 20,
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
          ),
          if (expanded && node.children.length == 0)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(offset, 8, 0, 8),
              child: Text(
                "There are no nodes!",
                style: TextStyle(
                  color: AppTheme.textColor,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          if (expanded)
            ...getOrderedChildren(node).map((node) {
              switch (node) {
                case OpcValueNodeModel():
                  return IntrinsicWidth(
                    child: OpcValueNode(
                      node: node,
                      level: level,
                    ),
                  );
                case OpcContainerNodeModel():
                  return OpcContainerNode(
                    node: node,
                    level: level + 1,
                  );
                default:
                  return SizedBox.shrink();
              }
            }),
        ],
      ),
    );
  }
}
