import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/calc/PointTransformer.dart';
import 'package:waveform_designer/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/calc/TickOverlapCalculator.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/designer/chart/PanPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/SnapPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/InteractionMutations.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/InteractionState.dart';
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
        PointTransformer,
        NeighboringTickCalculator,
        TickOverlapCalculator,
        InteractionState<InteractionHandler>,
        InteractionMutations<InteractionHandler> {
  final GlobalKey _widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => updateWidgetSize(
        _widgetKey.currentContext?.findRenderObject() as RenderBox?,
      ),
    );
    windowManager.addListener(this);
    hoveredTransitionPointIndex = null;
    isDraggingTransition = false;
    tickToSnap = null;
    dragStartXOffset = null;
    currentDragOffset = null;
  }

  @override
  void onWindowResize() {
    updateWidgetSize(
      _widgetKey.currentContext?.findRenderObject() as RenderBox?,
    );
  }

  @override
  Widget build(BuildContext context) {
    void onClickUp(TapUpDetails details) {
      final neighbouringTick = getNeighboringTick(
        ScreenSpacePoint(
          dx: details.localPosition.dx,
        ),
      );
      ref
          .read(waveFormStateProvider.notifier)
          .addTransitionPoint(neighbouringTick);
    }

    waveForm = ref.watch(waveFormStateProvider);
    designer = ref.watch(designerStateProvider);

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
                  start: dragStartXOffset,
                  end: currentDragOffset,
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
            cursor: hoveredTransitionPointIndex != null
                ? SystemMouseCursors.resizeColumn
                : SystemMouseCursors.basic,
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
