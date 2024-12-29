import 'package:flutter/widgets.dart';
import 'package:waveform_designer/widgets/input/LabeledInput.dart';

class MultiLabeledInput<T extends num> extends StatelessWidget {
  final String mainLabel;
  final String secondaryLabel;
  final double width;
  final T value;
  final Function(T?)? onChanged;
  final Function(T?)? onSubmitted;
  final Function(T?)? onFocusLost;
  final Function()? onFocus;

  const MultiLabeledInput({
    required this.mainLabel,
    required this.secondaryLabel,
    required this.value,
    this.onChanged,
    this.onSubmitted,
    this.onFocusLost,
    this.onFocus,
    this.width = 160,
    super.key,
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
        LabeledInput<T>(
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onFocusLost: onFocusLost,
          onFocus: onFocus,
          label: secondaryLabel,
          width: width,
          value: value,
        )
      ],
    );
  }
}
