import 'dart:convert';
import 'dart:io';

import 'package:opc_node_designer/connection/models/connectionconfig.model.dart';
import 'package:opc_node_designer/connection/models/response.model.dart';
import 'package:opc_node_designer/connection/serialization/command.model.dart';
import 'package:opc_node_designer/connection/serialization/response.model.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart';
import 'package:opc_node_designer/serialization/ops_structure/opc_structure.model.dart'
    as OpcStructureSerialization;

class SimulatorConnection {
  final ConnectionConfig _config;

  SimulatorConnection({
    required ConnectionConfig config,
  }) : _config = config;

  Future<ServerResponse> sendNewConfiguration(
    OpcStructureModel newStructure,
  ) async {
    try {
      final serializationObject = ServerCommandModel(
        command: "configure nodes",
        payload:
            OpcStructureSerialization.OpcStructureModel.fromState(newStructure),
      );
      final jsonString = const JsonEncoder().convert(serializationObject);

      final socket = await Socket.connect(_config.address, _config.port);
      socket.write(jsonString);
      socket.write("\n");

      final receiveBuffer = StringBuffer();

      await for (var data in socket) {
        receiveBuffer.write(String.fromCharCodes(data));
      }

      socket.destroy();

      final rawResponse = receiveBuffer.toString();
      final response = ServerResponseModel.fromJson(
          jsonDecode(rawResponse) as Map<String, dynamic>);
      return ServerResponse.fromModel(response);
    } catch (e) {
      return ServerResponse.failure("Unhandled client error: $e");
    }
  }
}
