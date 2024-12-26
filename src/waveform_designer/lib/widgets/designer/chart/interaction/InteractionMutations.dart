import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/calc/PointTransformer.dart';
import 'package:waveform_designer/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/calc/TickOverlapCalculator.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/InteractionState.dart';

mixin InteractionMutations<T extends ConsumerStatefulWidget>
    on
        InteractionState<T>,
        ValueRangeMapper,
        PointTransformer,
        NeighboringTickCalculator,
        TickOverlapCalculator {
  void onHover(BuildContext context, PointerHoverEvent event) {
    setState(() {
      hoveredTransitionPointIndex = getOverlappingTransitionPointIndex(
        ScreenSpacePoint(
          dx: event.localPosition.dx,
        ),
      );
    });
  }

  void dragStart(DragStartDetails details) {
    setState(() {
      isDraggingTransition = hoveredTransitionPointIndex != null;
      dragStartXOffset = details.localPosition.dx;
    });
  }

  void onExit(PointerExitEvent event) {
    setState(() {
      hoveredTransitionPointIndex = null;
      isDraggingTransition = false;
      tickToSnap = null;
      dragStartXOffset = null;
      currentDragOffset = null;
    });
  }

  void onDragUpdate(DragUpdateDetails details) {
    if (isDraggingTransition) {
      setState(() {
        tickToSnap = getNeighboringTick(
          ScreenSpacePoint(
            dx: details.localPosition.dx,
          ),
        );
      });
    } else {
      setState(() {
        currentDragOffset = details.localPosition.dx;
      });
    }
  }

  void dragEnd(DragEndDetails details) {
    if (isDraggingTransition) {
      if (tickToSnap != null && hoveredTransitionPointIndex != null) {
        ref.read(waveFormStateProvider.notifier).updateTransitionPoint(
              hoveredTransitionPointIndex!,
              tickToSnap!,
            );
      }
    } else {
      var delta = ((dragStartXOffset ?? 0.0) - details.localPosition.dx).abs();
      // prevent zoom when selected area is really small (could be accidentally
      // 1 or 2 pixels when clicking)
      if (dragStartXOffset != null && delta > 12) {
        ref
            .read(designerStateProvider.notifier)
            .updatePan(dragStartXOffset!, details.localPosition.dx);
      }
    }
    setState(() {
      tickToSnap = null;
      dragStartXOffset = null;
      currentDragOffset = null;
    });
  }

  void updateWidgetSize(RenderBox? renderBox) {
    if (renderBox != null) {
      ref
          .read(designerStateProvider.notifier)
          .updateDesignerWidth(renderBox.size.width);
    }
  }
}
