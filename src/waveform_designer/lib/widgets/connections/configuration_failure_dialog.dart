import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/shared/SimpleButton.dart';
import 'package:opc_node_designer/widgets/shared/custom_overlay.dart';

Future<bool> showConfigurationFailureDialog({
  required BuildContext context,
  required String reason,
}) async {
  void _handleClose() {
    Navigator.of(context).pop();
  }

  final result = await showOverlay<bool>(
    context: context,
    builder: (_) {
      return Center(
        child: Container(
          width: 380,
          height: 260,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            color: AppTheme.foreground,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FaIcon(
                FontAwesomeIcons.circleXmark,
                color: AppTheme.danger,
                size: 48,
              ),
              Text(
                "Could not apply new configuration!",
                style: TextStyle(
                  color: AppTheme.textColor,
                  fontSize: 16,
                ),
              ),
              Text(
                reason,
                style: TextStyle(
                  color: AppTheme.textColor,
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SimpleButton(
                    onClick: _handleClose,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    content: Text("Ok"),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
  return result ?? false;
}
