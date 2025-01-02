import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/widgets/input/NumberInput.dart';

class LabeledInput<T extends num> extends StatelessWidget {
  final Function(T?)? onChanged;
  final double? width;
  final String label;
  final T value;
  final Function(T?)? onSubmitted;
  final Function(T?)? onFocusLost;
  final Function()? onFocus;

  const LabeledInput({
    required this.label,
    required this.value,
    this.onFocusLost,
    this.onFocus,
    this.onChanged,
    this.width,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NumberInput<T>(
          onChanged: onChanged,
          onFocusLost: onFocusLost,
          onSubmitted: onSubmitted,
          onFocus: onFocus,
          width: width,
          value: value,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
