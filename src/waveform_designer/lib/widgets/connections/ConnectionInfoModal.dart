import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/connection_management/connection_list.state.dart';
import 'package:opc_node_designer/widgets/connections/OpcConnectionInfo.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/input/Dropdown.dart';
import 'package:opc_node_designer/widgets/shared/StringFormField.dart';
import 'package:opc_node_designer/widgets/shared/TextButton.dart';

class ConnectionInfoModal extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConnectionInfoModal> createState() => _ConnectionInfoModal();
}

class _ConnectionInfoModal extends ConsumerState<ConnectionInfoModal> {
  static const String defaultHost = "127.0.0.1";
  static const String defaultPort = "39057";
  static const String defaultSelection = "New connection";
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _portController = TextEditingController();
  final _nameController = TextEditingController();
  late String _selectedConnectionName;

  void _handlePush(BuildContext context) {
    final name = _nameController.text;
    final host = _addressController.text;
    final port = int.parse(_portController.text);
    final notifier = ref.read(connectionListStateProvider.notifier);
    final action = _selectedConnectionName == defaultSelection
        ? _nameController.text.isNotEmpty
            ? notifier.addConnection
            : null
        : notifier.updateConnection;
    action?.call(name, host, port);

    if (_formKey.currentState!.validate()) {
      final node = OpcConnectionInfo(
        address: host,
        port: port,
      );
      Navigator.of(context).pop(node);
    }
  }

  void _handleCancel(BuildContext context) {
    Navigator.of(context).pop(null);
  }

  @override
  void initState() {
    _addressController.text = defaultHost;
    _portController.text = defaultPort;
    _nameController.text = "";
    _selectedConnectionName = defaultSelection;
    super.initState();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _portController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _handleConnectionChange(String selectedConnectionName) {
    final connection = ref
        .read(connectionListStateProvider)
        .connections
        .where((con) => con.name == selectedConnectionName)
        .firstOrNull;

    setState(() {
      _nameController.text = "";
      _selectedConnectionName = selectedConnectionName;
      _addressController.text = connection?.host ?? defaultHost;
      _portController.text = connection?.port.toString() ?? defaultPort;
    });
  }

  List<String> get connectionOptions {
    return [
      defaultSelection,
      ...ref
          .read(connectionListStateProvider)
          .connections
          .map((con) => con.name)
    ];
  }

  @override
  Widget build(BuildContext context) {
    var nameInput = [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 4),
        child: const Text(
          "Name",
          style: TextStyle(
            fontSize: 18,
            color: AppTheme.textColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      StringFormField(
        controller: _nameController,
      ),
      SizedBox.square(dimension: 22),
    ];
    return Center(
      child: Container(
        width: 470,
        height: _selectedConnectionName == defaultSelection ? 460 : 390,
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
                      "Connection",
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppTheme.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Dropdown(
                    items: connectionOptions,
                    onChanged: _handleConnectionChange,
                    selectedItem: _selectedConnectionName,
                  ),
                  SizedBox.square(dimension: 22),
                  if (_selectedConnectionName == defaultSelection) ...nameInput,
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
