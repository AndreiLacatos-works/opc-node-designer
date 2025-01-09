import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/widgets/connections/OpcConnectionInfo.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/shared/StringFormField.dart';
import 'package:opc_node_designer/widgets/shared/TextButton.dart';

class ConnectionInfoModal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConnectionInfoModal();
}

class _ConnectionInfoModal extends State {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _portController = TextEditingController();

  void _handlePush(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final node = OpcConnectionInfo(
        address: _addressController.text,
        port: int.parse(_portController.text),
      );
      Navigator.of(context).pop(node);
    }
  }

  void _handleCancel(BuildContext context) {
    Navigator.of(context).pop(null);
  }

  @override
  void initState() {
    _addressController.text = "127.0.0.1";
    _portController.text = "39057";
    super.initState();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _portController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 470,
        height: 330,
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
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Push configuration to OPC server",
                      style: const TextStyle(
                        fontSize: 22,
                        color: AppTheme.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox.square(dimension: 32),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      "Server address",
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppTheme.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  StringFormField(
                    controller: _addressController,
                    validator: (address) {
                      if (address?.isEmpty ?? true) {
                        return "Server address is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox.square(dimension: 22),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      "Port",
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppTheme.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  StringFormField(
                    controller: _portController,
                    validator: (portString) {
                      if (portString?.isEmpty ?? true) {
                        return "Port is required";
                      }
                      if (int.tryParse(portString!) == null) {
                        return "Invalid port";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onClick: () {
                    _handlePush(context);
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: AppTheme.brightGreen,
                  text: "Push",
                ),
                SizedBox.square(dimension: 6),
                TextButton(
                  onClick: () {
                    _handleCancel(context);
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: AppTheme.danger,
                  text: "Cancel",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
