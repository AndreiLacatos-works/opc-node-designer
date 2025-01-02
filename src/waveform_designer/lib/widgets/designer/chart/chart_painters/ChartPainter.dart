import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/ChartPainterProvider.dart';

class ChartPainter extends StatelessWidget with ChartPainterProvider {
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
