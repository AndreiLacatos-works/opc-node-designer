import 'package:flutter/widgets.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/PainterProvider.dart';

class ChartPainter extends StatelessWidget with PainterProvider {
  final WaveFormModel waveform;
  final DesignerModel panning;

  ChartPainter({
    required this.waveform,
    required this.panning,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...providePainters(
          waveform,
          panning,
        ).map(
          (painter) => Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: painter,
            ),
          ),
        ),
      ],
    );
  }
}
