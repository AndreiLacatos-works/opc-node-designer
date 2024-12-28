import 'package:flutter/widgets.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/opc/actions/OpcStructureMutations.dart';
import 'package:waveform_designer/widgets/designer/opc/opc_structure/OpcStructureBrowser.dart';

class OpcStructureDesigner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppTheme.accentColor,
            style: BorderStyle.solid,
            width: 12,
          ),
        ),
        color: AppTheme.foreground,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OpcStructureBrowser(),
          OpcStructureMutations(),
        ],
      ),
    );
  }
}
