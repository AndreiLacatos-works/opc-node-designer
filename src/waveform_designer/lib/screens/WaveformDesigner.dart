import 'package:flutter/widgets.dart';
import 'package:waveform_designer/screens/AppScreen.dart';
import 'package:waveform_designer/widgets/designer/chart/DesignerChart.dart';
import 'package:waveform_designer/widgets/designer/opc/OpcStructureDesigner.dart';
import 'package:waveform_designer/widgets/fine_tuner/FineTuner.dart';

class WaveformDesigner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                OpcStructureDesigner(),
                DesignerChart(),
              ],
            ),
          ),
          FineTuner(),
        ],
      ),
    );
  }
}
