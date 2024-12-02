import 'package:flutter/widgets.dart';
import 'package:waveform_designer/widgets/input/NumberInput.dart';

class LabeledInput extends StatelessWidget {
  final Function(int?)? onChanged;
  final double? width;
  final String label;
  final int value;
  final Function(int?)? onSubmitted;
  final Function(int?)? onFocusLost;

  const LabeledInput({
    required this.label,
    this.onFocusLost,
    this.onChanged,
    this.width,
    this.onSubmitted,
    this.value = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NumberInput(
          onChanged: onChanged,
          onFocusLost: onFocusLost,
          onSubmitted: onSubmitted,
          width: width,
          value: value,
        ),
        Padding(
          padding: EdgeInsets.only(left: 12),
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
