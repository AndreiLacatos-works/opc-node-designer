import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/designer/chart/TickPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/InteractionHandler.dart';
import 'package:waveform_designer/widgets/designer/chart/WaveForm.dart';
import 'package:waveform_designer/widgets/designer/panning/PanIndicator.dart';

class DesignerChart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waveformState = ref.watch(waveFormStateProvider);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(35),
              color: Color.fromARGB(255, 255, 255, 255),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 2.7,
                    child: CustomPaint(
                      painter: WaveFormPainter(
                        duration: waveformState.duration,
                        transitionPoints: waveformState.transitionPoints,
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 2.7,
                    child: InteractionHandler(
                      child: CustomPaint(
                        painter: TickPainter(
                          duration: waveformState.duration,
                          frequency: waveformState.tickFrequency,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 12, 35, 12),
              color: Color.fromARGB(255, 255, 255, 255),
              child: PanIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
