import 'package:flutter/services.dart' as DS;
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/designer/chart/PanPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/SnapPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/hover_tester/OverlapCalculatorFactory.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/InteractionHandler.Actions.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/InteractionHandler.State.dart';
import 'package:window_manager/window_manager.dart';

class InteractionHandler extends ConsumerStatefulWidget {
  final Widget child;

  InteractionHandler({
    required this.child,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InteractionHandler();
}

class _InteractionHandler extends ConsumerState<InteractionHandler>
    with
        WindowListener,
        ValueRangeMapper,
        WaveformMinMaxer,
        RangeRestrictorMapper,
        PointTransformer,
        NeighboringTickCalculator,
        InteractionHandlerState<InteractionHandler>,
        InteractionHandlerActions<InteractionHandler> {
  final GlobalKey _widgetKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => updateWidgetSize(
        _widgetKey.currentContext?.findRenderObject() as RenderBox?,
      ),
    );
    final waveForm = ref.read(waveFormStateProvider);
    overlapDetector = OverlapCalculatorFactory.getOverlapCalculator(waveForm);
    windowManager.addListener(this);
    hoveredValue = null;
    isDraggingValue = false;
    tickToSnap = null;
    dragStartOffset = null;
    currentDragOffset = null;
    super.initState();
  }

  @override
  void onWindowResize() {
    updateWidgetSize(
      _widgetKey.currentContext?.findRenderObject() as RenderBox?,
    );
  }

  @override
  Widget build(BuildContext context) {
    final waveForm = ref.watch(waveFormStateProvider);
    final designer = ref.watch(designerStateProvider);

    void onClickUp(TapUpDetails details) {
      final neighbouringTick = getNeighboringTick(
        ScreenSpacePoint.fromOffset(details.localPosition),
        waveForm,
        designer,
      );
      ref
          .read(waveFormStateProvider.notifier)
          .addWaveformValue(WaveFormValueModel(
            tick: neighbouringTick,
            value: Transition(),
          ));
    }

    DS.SystemMouseCursor getHoverCursor() {
      if (hoveredValue == null) {
        return SystemMouseCursors.basic;
      }

      return switch (waveForm.type) {
        Transition => SystemMouseCursors.resizeColumn,
        DoubleValue => SystemMouseCursors.move,
        _ => SystemMouseCursors.basic,
      };
    }

    return Stack(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: SnapPainter(
                  tick: tickToSnap,
                  duration: ref.read(waveFormStateProvider).duration,
                  offset: designer.sliceOffset,
                  slice: designer.sliceRatio,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: PanPainter(
                  start: dragStartOffset?.dx,
                  end: currentDragOffset?.dx,
                ),
              ),
            ),
          ],
        ),
        Container(
          child: MouseRegion(
            key: _widgetKey,
            onHover: (e) {
              onHover(context, e);
            },
            onExit: onExit,
            cursor: getHoverCursor(),
            child: GestureDetector(
              onPanStart: dragStart,
              onPanEnd: dragEnd,
              onPanUpdate: onDragUpdate,
              onTapUp: onClickUp,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: widget.child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
