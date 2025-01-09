import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/connections/ConnectionInfoModal.dart';
import 'package:opc_node_designer/widgets/connections/OpcConnectionInfo.dart';
import 'package:opc_node_designer/widgets/shared/TextButton.dart';
import 'package:opc_node_designer/widgets/shared/custom_overlay.dart';

class Pusher extends ConsumerWidget {
  Future _handlePush(BuildContext context, WidgetRef ref) async {
    final result = await showOverlay<OpcConnectionInfo?>(
      context: context,
      builder: (_) => ConnectionInfoModal(),
    );
    if (result != null) {
      print(result.address);
      print(result.port);
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
