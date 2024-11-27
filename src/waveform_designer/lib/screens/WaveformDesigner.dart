import 'package:flutter/material.dart';
import 'package:waveform_designer/widgets/designer/DesignerChart.dart';
import 'package:waveform_designer/widgets/designer/FineTuner.dart';

class Waveformdesigner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [DesignerChart(), FineTuner()],
    );
  }
}
