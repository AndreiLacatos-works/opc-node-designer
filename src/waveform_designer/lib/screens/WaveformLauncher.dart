import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/screens/AppScreen.dart';
import 'package:waveform_designer/serialization/waveform/waveform.model.dart'
    as WaveformSerialization;
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/shared/TextButton.dart';

class WaveformLauncher extends ConsumerWidget {
  Future _handleOpenExisting(BuildContext context, WidgetRef ref) async {
    final pickResult = await FilePicker.platform.pickFiles(
      allowedExtensions: ['json'],
      dialogTitle: 'Choose waveform file',
      allowMultiple: false,
    );
    if (pickResult != null) {
      try {
        final projectPath = pickResult.files.single.path!;
        final waveformFile = File(projectPath);
        final waveformJson = await waveformFile.readAsString();
        final waveform = WaveformSerialization.WaveFormModel.fromJson(
            jsonDecode(waveformJson) as Map<String, dynamic>);
        ref.read(waveFormStateProvider.notifier).initialize(waveform.toState());
        ref.read(designerStateProvider.notifier).setProjectPath(projectPath);

        Navigator.of(context).pushNamed('/designer');
      } on Exception catch (e) {
        print(e.toString());
      }
    }
  }

  void _handleCreateNew(BuildContext context) {
    Navigator.of(context).pushNamed('/designer');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(waveFormStateProvider);
    ref.watch(designerStateProvider);
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
