import 'package:flutter/widgets.dart';
import 'package:waveform_designer/widgets/input/LabeledInput.dart';

class MultiLabeledInput extends StatelessWidget {
  final String mainLabel;
  final String secondaryLabel;
  final double width;
  final int value;
  final Function(int?)? onChanged;
  final Function(int?)? onSubmitted;
  final Function(int?)? onFocusLost;

  const MultiLabeledInput({
    super.key,
    required this.mainLabel,
    required this.secondaryLabel,
    this.onChanged,
    this.onSubmitted,
    this.onFocusLost,
    this.value = 0,
    this.width = 160,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            mainLabel,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        LabeledInput(
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onFocusLost: onFocusLost,
          label: secondaryLabel,
          width: width,
          value: value,
        )
      ],
    );
  }
}
