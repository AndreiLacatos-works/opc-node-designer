import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/opc/opc_structure/OpcValueNode.dart';
import 'package:waveform_designer/widgets/shared/SimpleButton.dart';

class OpcContainerNode extends StatelessWidget {
  final OpcContainerNodeModel node;
  final int level;
  static const double offset = 26.0;

  OpcContainerNode({
    required this.node,
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: offset),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: SimpleButton(
              onClick: () {},
              color: AppTheme.transparent,
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              content: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.folderOpen,
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
          if (node.children.length == 0)
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
          ...node.children.map((node) {
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
