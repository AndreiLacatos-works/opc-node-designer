import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/connection_management/connection_list.state.dart';
import 'package:opc_node_designer/state/designer/designer.state.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.state.dart';
import 'package:opc_node_designer/serialization/ops_structure/opc_structure.model.dart'
    as OpcStructureSerialization;
import 'package:opc_node_designer/serialization/connections/connection_list.model.dart'
    as ConnectionListSerialization;

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
      final connectionList =
          ConnectionListSerialization.ConnectionListModel.fromJson(
              jsonDecode(opcStructureJson) as Map<String, dynamic>);
      ref
          .read(opcStructureStateProvider.notifier)
          .initialize(opcStructure.toState());
      ref
          .read(connectionListStateProvider.notifier)
          .initialize(connectionList.toState());
      ref.read(designerStateProvider.notifier).setProjectPath(projectPath);

      Navigator.of(context).pushNamed('/designer');
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
