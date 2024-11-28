import 'package:flutter/widgets.dart';
import 'package:waveform_designer/widgets/input/NumberInput.dart';

class LabeledInput extends StatelessWidget {
  final Function(int?) onChanged;
  final double? width;
  final String label;

  const LabeledInput({
    required this.onChanged,
    required this.label,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NumberInput(
          onChanged: onChanged,
          width: width,
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
