import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.state.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/chart/PanControls.dart';
import 'package:waveform_designer/widgets/designer/chart/TickPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/ChartPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/InteractionHandler.dart';
import 'package:waveform_designer/widgets/designer/panning/PanIndicator.dart';

class DesignerChart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waveformState = ref.watch(waveFormStateProvider);
    final panningState = ref.watch(designerStateProvider);
    final valueNodeSelected =
        ref.watch(opcDesignerStateProvider).selectedNode is OpcValueNodeModel;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppTheme.foreground,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 30),
                    child: Column(
                      children: [
                        PanControls(),
                        SizedBox.square(dimension: 12),
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 3.2,
                              child: ChartPainter(
                                waveform: waveformState,
                                panning: panningState,
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 3.2,
                              child: CustomPaint(
                                painter: TickPainter(
                                  waveform: waveformState,
                                  panning: panningState,
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 3.2,
                              child: InteractionHandler(),
                            ),
                          ],
                        ),
                        SizedBox.square(dimension: 36),
                        PanIndicator(),
                      ],
                    ),
                  ),
                  if (!valueNodeSelected)
                    Positioned.fill(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 3,
                            sigmaY: 3,
                          ),
                          child: Container(
                            color: AppTheme.lightShade.withAlpha(170),
                            child: Center(
                              child: Text(
                                "Select a node",
                                style: TextStyle(
                                  color: AppTheme.textColor,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
