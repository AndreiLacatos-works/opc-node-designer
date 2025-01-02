import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/designer/designer.state.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.state.dart';
import 'package:opc_node_designer/serialization/ops_structure/opc_structure.model.dart'
    as OpcStructureSerialization;

mixin InitFromFile {
  Future initStateFromFile(
    String projectPath,
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final projectFile = File(projectPath);
      final opcStructureJson = await projectFile.readAsString();
      final opcStructure = OpcStructureSerialization.OpcStructureModel.fromJson(
          jsonDecode(opcStructureJson) as Map<String, dynamic>);
      ref
          .read(opcStructureStateProvider.notifier)
          .initialize(opcStructure.toState());
      ref.read(designerStateProvider.notifier).setProjectPath(projectPath);

      Navigator.of(context).pushNamed('/designer');
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
