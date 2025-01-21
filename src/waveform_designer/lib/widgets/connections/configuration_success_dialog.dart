import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/shared/SimpleButton.dart';
import 'package:opc_node_designer/widgets/shared/custom_overlay.dart';

Future<bool> showConfigurationSuccessDialog({
  required BuildContext context,
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
          height: 180,
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
                FontAwesomeIcons.circleCheck,
                color: AppTheme.brightGreen,
                size: 48,
              ),
              Text(
                "The new configuration has been successfully applied!",
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
