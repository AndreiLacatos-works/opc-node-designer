import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/shared/SimpleButton.dart';
import 'package:opc_node_designer/widgets/shared/custom_overlay.dart';

Future<bool> showConfirmationDialog({
  required BuildContext context,
  required String prompt,
  String confirmationText = "Yes",
  String cancelText = "No",
}) async {
  void handleConfirm() {
    Navigator.of(context).pop(true);
  }

  void handleCancel() {
    Navigator.of(context).pop(false);
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
              Text(
                prompt,
                style: TextStyle(
                  color: AppTheme.textColor,
                  fontSize: 16,
                ),
              ),
              SizedBox.square(dimension: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SimpleButton(
                    onClick: handleConfirm,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    color: AppTheme.danger,
                    content: Text(
                      confirmationText,
                    ),
                  ),
                  SizedBox.square(dimension: 6),
                  SimpleButton(
                    onClick: handleCancel,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    content: Text(
                      cancelText,
                    ),
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
