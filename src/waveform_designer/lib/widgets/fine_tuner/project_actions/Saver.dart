import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/designer/designer.state.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.state.dart';
import 'package:opc_node_designer/serialization/ops_structure/opc_structure.model.dart'
    as OpcStructureSerialization;
import 'package:file_picker/file_picker.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/shared/TextButton.dart';

class Saver extends ConsumerWidget {
  Future _handleSave(WidgetRef ref) async {
    final opcStructure = ref.read(opcStructureStateProvider);
    var saveLocation = ref.read(designerStateProvider).projectPath;
    if (saveLocation == null) {
      saveLocation = await promptSaveLocation();
    }
    if (saveLocation != null) {
      await writeWaveform(opcStructure, saveLocation);
      ref.read(designerStateProvider.notifier).setProjectPath(saveLocation);
    }
  }

  Future<String?> promptSaveLocation() {
    return FilePicker.platform.saveFile(
      dialogTitle: 'Choose save file',
      fileName: 'my_project.opcproj',
      allowedExtensions: ['opcproj'],
    );
  }

  Future writeWaveform(
    OpcStructureModel opcStructureRoot,
    String saveLocation,
  ) async {
    final file = File(saveLocation);
    final serializationObject =
        OpcStructureSerialization.OpcStructureModel.fromState(opcStructureRoot);
    try {
      final jsonString =
          const JsonEncoder.withIndent('  ').convert(serializationObject);
      await file.writeAsString(jsonString);
    } on Exception catch (e) {
      print("Failed to save waveform: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onClick: () => _handleSave(ref),
      text: "Save",
      color: AppTheme.brightGreen,
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
    );
  }
}
