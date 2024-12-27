import 'package:flutter/widgets.dart';

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
                  color: state.hasError
                      ? const Color(0xFFFF0000)
                      : const Color(0xFF000000),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: EditableText(
                controller: controller,
                focusNode: _focusNode,
                style: const TextStyle(color: Color(0xFF000000), fontSize: 18),
                cursorColor: const Color(0xFF000000),
                backgroundCursorColor: const Color(0xFF000000),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  state.errorText ?? "Invalid value",
                  style: const TextStyle(color: Color(0xFFFF0000)),
                ),
              ),
          ],
        );
      },
    );
  }
}
