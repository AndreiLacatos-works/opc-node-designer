import 'package:opc_node_designer/connection/serialization/response.model.dart';

class ServerResponse {
  final bool success;
  final String? errorReason;

  ServerResponse({
    required this.success,
    required this.errorReason,
  });

  factory ServerResponse.fromModel(ServerResponseModel model) => ServerResponse(
        success: model.status.toLowerCase() == "success",
        errorReason: model.reason,
      );

  factory ServerResponse.failure(String reason) => ServerResponse(
        success: false,
        errorReason: reason,
      );
}
