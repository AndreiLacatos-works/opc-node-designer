import 'package:flutter/material.dart';
import 'package:waveform_designer/widgets/designer/chart/DesignerChart.dart';
import 'package:waveform_designer/widgets/fine_tuner/FineTuner.dart';

class WaveformDesigner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DesignerChart(),
        FineTuner(),
      ],
    );
  }
}
