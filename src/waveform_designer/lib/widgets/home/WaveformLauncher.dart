import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/serialization/waveform/waveform.model.dart'
    as WaveformSerialization;
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';

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
    return Container(
      color: Color.fromARGB(255, 45, 45, 45),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _handleOpenExisting(context, ref),
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 74, 144, 226),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: const Text(
                          'Open existing',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox.fromSize(
                  size: Size(20, 0),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _handleCreateNew(context),
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 126, 211, 33),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: const Text(
                          'Create new',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
