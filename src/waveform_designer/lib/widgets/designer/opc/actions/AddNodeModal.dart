import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/input/Dropdown.dart';
import 'package:opc_node_designer/widgets/shared/StringFormField.dart';
import 'package:opc_node_designer/widgets/shared/TextButton.dart';

class AddNodeModal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNodeModalState();
}

class _AddNodeModalState extends State {
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();
  var _nodeType = _optionTypeMap.keys.first;

  static const _optionTypeMap = {
    'Transitions': Transition,
    'Numeric values': DoubleValue,
  };

  void _handleAdd(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final node = OpcValueNodeModel(
        id: Uuid().v4(),
        label: _labelController.text,
        waveform: WaveFormModel(
          duration: 1000,
          tickFrequency: 50,
          values: [],
          type: _optionTypeMap[_nodeType]!,
        ),
      );
      Navigator.of(context).pop(node);
    }
  }

  void _handleCancel(BuildContext context) {
    Navigator.of(context).pop(null);
  }

  void _handleTypeChange(String type) {
    setState(() {
      _nodeType = type;
    });
  }

  @override
  void dispose() {
    _labelController.dispose();
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
                      "Add node",
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
                      "Label",
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppTheme.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  StringFormField(
                    controller: _labelController,
                    validator: (label) {
                      if (label?.isEmpty ?? true) {
                        return "Label is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox.square(dimension: 22),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      "Type",
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppTheme.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Dropdown(
                    items: _optionTypeMap.keys.toList(),
                    onChanged: _handleTypeChange,
                    selectedItem: _nodeType,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onClick: () {
                    _handleAdd(context);
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: AppTheme.brightGreen,
                  text: "Add",
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
