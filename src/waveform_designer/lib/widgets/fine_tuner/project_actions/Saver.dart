import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/serialization/waveform/waveform.model.dart'
    as WaveFormSerialization;
import 'package:file_picker/file_picker.dart';

class Saver extends ConsumerWidget {
  Future _handleSave(WidgetRef ref) async {
    final waveform = ref.read(waveFormStateProvider);
    var saveLocation = ref.read(designerStateProvider).projectPath;
    if (saveLocation == null) {
      saveLocation = await promptSaveLocation();
    }
    if (saveLocation != null) {
      await writeWaveform(waveform, saveLocation);
      ref.read(designerStateProvider.notifier).setProjectPath(saveLocation);
    }
  }

  Future<String?> promptSaveLocation() {
    return FilePicker.platform.saveFile(
      dialogTitle: 'Choose save file',
      fileName: 'waveform.json',
      allowedExtensions: ['json'],
    );
  }

  Future writeWaveform(WaveFormModel waveform, String saveLocation) async {
    final file = File(saveLocation);
    final serializationObject =
        WaveFormSerialization.WaveFormModel.fromState(waveform);
    try {
      await file.writeAsString(jsonEncode(serializationObject));
    } on Exception catch (e) {
      print("Failed to save waveform: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _handleSave(ref);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 126, 211, 33),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'Save',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
