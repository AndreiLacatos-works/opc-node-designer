import 'package:flutter/widgets.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/shared/TextButton.dart';

class OpcStructureActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          ),
        ],
      ),
    );
  }
}
