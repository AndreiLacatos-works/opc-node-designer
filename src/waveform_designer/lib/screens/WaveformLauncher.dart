import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/screens/AppScreen.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.state.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.state.dart';
import 'package:waveform_designer/state/init/init_from_file.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/shared/TextButton.dart';

class WaveformLauncher extends ConsumerWidget with InitFromFile {
  Future? _handleOpenExisting(BuildContext context, WidgetRef ref) async {
    final pickResult = await FilePicker.platform.pickFiles(
      allowedExtensions: ['opcproj'],
      dialogTitle: 'Choose project file',
      allowMultiple: false,
    );
    if (pickResult != null) {
      return initStateFromFile(pickResult.files.single.path!, context, ref);
    }
  }

  void _handleCreateNew(BuildContext context) {
    Navigator.of(context).pushNamed('/designer');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(waveFormStateProvider);
    ref.watch(designerStateProvider);
    ref.watch(opcStructureStateProvider);
    ref.watch(opcDesignerStateProvider);
    return AppScreen(
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onClick: () => _handleOpenExisting(context, ref),
                  text: "Open existing",
                  size: Size(140, 140),
                  color: AppTheme.accentColor,
                ),
                SizedBox.fromSize(
                  size: Size(20, 0),
                ),
                TextButton(
                  onClick: () => _handleCreateNew(context),
                  text: "Create new",
                  size: Size(140, 140),
                  color: AppTheme.brightGreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
