import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/connection/SimulatorConnection.dart';
import 'package:opc_node_designer/connection/models/connectionconfig.model.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.state.dart';
import 'package:opc_node_designer/state/spinner/spinner.state.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/connections/ConnectionInfoModal.dart';
import 'package:opc_node_designer/widgets/connections/OpcConnectionInfo.dart';
import 'package:opc_node_designer/widgets/connections/configuration_failure_dialog.dart';
import 'package:opc_node_designer/widgets/connections/configuration_success_dialog.dart';
import 'package:opc_node_designer/widgets/shared/TextButton.dart';
import 'package:opc_node_designer/widgets/shared/custom_overlay.dart';

class Pusher extends ConsumerWidget {
  Future _handlePush(BuildContext context, WidgetRef ref) async {
    final result = await showOverlay<OpcConnectionInfo?>(
      context: context,
      builder: (_) => ConnectionInfoModal(),
    );

    if (result != null) {
      final connection = SimulatorConnection(
        config: ConnectionConfig(
          address: result.address,
          port: result.port,
        ),
      );
      final opcStructure = ref.read(opcStructureStateProvider);
      final spinner = ref.read(spinnerStateProvider.notifier);
      spinner.start();
      final response = await connection.sendNewConfiguration(opcStructure);
      spinner.stop();
      if (response.success) {
        showConfigurationSuccessDialog(context: context);
      } else {
        showConfigurationFailureDialog(
          context: context,
          reason: response.errorReason ?? "Unknown reason",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onClick: () {
        _handlePush(context, ref);
      },
      color: AppTheme.brightGreen,
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
      text: "Push",
    );
  }
}
