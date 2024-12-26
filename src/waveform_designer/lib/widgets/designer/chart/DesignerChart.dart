import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/chart/PanControls.dart';
import 'package:waveform_designer/widgets/designer/chart/TickPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/InteractionHandler.dart';
import 'package:waveform_designer/widgets/designer/chart/WaveFormPainter.dart';
import 'package:waveform_designer/widgets/designer/panning/PanIndicator.dart';

class DesignerChart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waveformState = ref.watch(waveFormStateProvider);
    final panningState = ref.watch(designerStateProvider);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(35, 12, 35, 12),
              color: AppTheme.foreground,
              child: PanControls(),
            ),
            Transform.translate(
              offset: Offset(0, -1),
              child: Container(
                padding: EdgeInsets.all(35),
                color: AppTheme.foreground,
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 3.2,
                      child: CustomPaint(
                        painter: WaveFormPainter(
                          duration: waveformState.duration,
                          transitionPoints:
                              waveformState.values.map((v) => v.tick).toList(),
                          slice: panningState.sliceRatio,
                          offset: panningState.sliceOffset,
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 3.2,
                      child: InteractionHandler(
                        child: CustomPaint(
                          painter: TickPainter(
                            duration: waveformState.duration,
                            frequency: waveformState.tickFrequency,
                            slice: panningState.sliceRatio,
                            offset: panningState.sliceOffset,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -2),
              child: Container(
                padding: EdgeInsets.fromLTRB(35, 12, 35, 12),
                color: AppTheme.foreground,
                child: PanIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
