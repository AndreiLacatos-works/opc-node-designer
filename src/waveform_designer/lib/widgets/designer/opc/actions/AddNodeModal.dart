import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/shared/StringFormField.dart';
import 'package:waveform_designer/widgets/shared/TextButton.dart';

class AddNodeModal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNodeModalState();
}

class _AddNodeModalState extends State {
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();

  void _handleAdd(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final node = OpcValueNodeModel(
        id: Uuid().v4(),
        label: _labelController.text,
        waveform: WaveFormModel(
          duration: 1000,
          tickFrequency: 50,
          values: [],
        ),
      );
      Navigator.of(context).pop(node);
    }
  }

  void _handleCancel(BuildContext context) {
    Navigator.of(context).pop(null);
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
        height: 260,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
          color: AppTheme.foreground,
        ),
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox.square(dimension: 24),
              Container(
                width: double.infinity,
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
      ),
    );
  }
}
