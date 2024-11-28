import 'package:flutter/widgets.dart';
import 'package:waveform_designer/widgets/input/LabeledInput.dart';

class MultiLabeledInput extends StatelessWidget {
  final String mainLabel;
  final Function(int?) onChanged;
  final String secondaryLabel;
  final double width;

  const MultiLabeledInput({
    super.key,
    required this.onChanged,
    required this.mainLabel,
    required this.secondaryLabel,
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
          label: secondaryLabel,
          width: width,
        )
      ],
    );
  }
}
