import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/shared/SimpleButton.dart';

class OpcValueNode extends StatelessWidget {
  final OpcValueNodeModel node;
  final int level;
  static const double offset = 26.0;

  OpcValueNode({
    required this.node,
    required this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: offset),
      child: SimpleButton(
        onClick: () {},
        color: AppTheme.transparent,
        padding: const EdgeInsets.only(top: 2, bottom: 2),
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
