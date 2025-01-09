import 'dart:math';

import 'package:opc_node_designer/connection/models/connectionconfig.model.dart';
import 'package:opc_node_designer/connection/models/response.model.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart';

class SimulatorConnection {
  final ConnectionConfig _config;

  SimulatorConnection({
    required ConnectionConfig config,
  }) : _config = config;

  Future<ServerResponse> sendNewConfiguration(
    OpcStructureModel newStructure,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    final success = Random.secure().nextBool();
    return ServerResponse(
      success: success,
      errorReason: success ? null : "bambooooooo",
    );
  }
}
