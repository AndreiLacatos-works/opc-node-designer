import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/opc_designer/opc_designer.state.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
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
    final isVoidState = waveformState.type == Void;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Center(
          child: Stack(
            children: [
              Column(
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
                        children: isVoidState
                            ? [
                                AspectRatio(
                                  aspectRatio: 3.2,
                                  child: SizedBox.expand(),
                                ),
                              ]
                            : [
                                AspectRatio(
                                  aspectRatio: 3.2,
                                  child: ChartPainter(
                                    waveform: waveformState,
                                    panning: panningState,
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
      ),
    );
  }
}
