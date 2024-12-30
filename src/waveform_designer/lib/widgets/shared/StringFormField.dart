import 'package:flutter/widgets.dart';
import 'package:waveform_designer/theme/AppTheme.dart';

class StringFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode _focusNode = FocusNode();
  final String? Function(String?)? validator;
  // final FormFieldSetter<String>? onSaved;

  StringFormField({
    Key? key,
    required this.controller,
    this.validator,
    // this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (val) {
        return validator?.call(controller.text);
      },
      // onSaved: onSaved,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: state.hasError ? AppTheme.danger : AppTheme.textColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: EditableText(
                controller: controller,
                focusNode: _focusNode,
                style: const TextStyle(color: AppTheme.textColor, fontSize: 18),
                cursorColor: AppTheme.textColor,
                backgroundCursorColor: AppTheme.textColor,
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  state.errorText ?? "Invalid value",
                  style: const TextStyle(color: AppTheme.danger),
                ),
              ),
          ],
        );
      },
    );
  }
}
