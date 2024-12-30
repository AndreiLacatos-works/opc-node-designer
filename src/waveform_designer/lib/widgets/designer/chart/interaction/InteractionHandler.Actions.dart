import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/InteractionHandler.State.dart';

mixin InteractionHandlerActions<T extends ConsumerStatefulWidget>
    on
        InteractionHandlerState<T>,
        ValueRangeMapper,
        PointTransformer,
        NeighboringTickCalculator {
  void onHover(PointerHoverEvent event) {
    final waveForm = ref.read(waveFormStateProvider);
    final designer = ref.read(designerStateProvider);
    setState(() {
      hoveredValue = overlapDetector.getOverlappingWaveformValue(
        ScreenSpacePoint.fromOffset(event.localPosition),
        waveForm,
        designer,
      );
    });
  }

  void dragStart(DragStartDetails details) {
    setState(() {
      isDraggingValue = hoveredValue != null;
      dragStartOffset = details.localPosition;
    });
  }

  void onExit(PointerExitEvent event) {
    setState(() {
      hoveredValue = null;
      isDraggingValue = false;
      tickToSnap = null;
      dragStartOffset = null;
      currentDragOffset = null;
    });
  }

  void onDragUpdate(DragUpdateDetails details) {
    if (isDraggingValue) {
      final waveForm = ref.read(waveFormStateProvider);
      final designer = ref.read(designerStateProvider);
      setState(() {
        tickToSnap = getNeighboringTick(
          ScreenSpacePoint.fromOffset(details.localPosition),
          waveForm,
          designer,
        );
      });
    }
    setState(() {
      currentDragOffset = details.localPosition;
    });
  }

  void dragEnd(DragEndDetails details) {
    if (isDraggingValue) {
      if (tickToSnap != null && hoveredValue != null) {
        valueMoveHandler.handleMove(
          hoveredValue!,
          ScreenSpacePoint.fromOffset(details.localPosition),
          ref,
        );
      }
    } else {
      var delta =
          ((dragStartOffset?.dx ?? 0.0) - details.localPosition.dx).abs();
      // prevent zoom when selected area is really small (could be accidentally
      // 1 or 2 pixels when clicking)
      if (dragStartOffset != null && delta > 12) {
        ref
            .read(designerStateProvider.notifier)
            .updatePan(dragStartOffset!.dx, details.localPosition.dx);
      }
    }
    setState(() {
      tickToSnap = null;
      dragStartOffset = null;
      currentDragOffset = null;
    });
  }

  void onClickUp(TapUpDetails details) {
    valueAddHandler.addValueAtDesiredPosition(
      ScreenSpacePoint.fromOffset(details.localPosition),
      ref,
    );
  }

  void updateWidgetSize(RenderBox? renderBox) {
    if (renderBox != null) {
      ref
          .read(designerStateProvider.notifier)
          .updateDesignerSize(renderBox.size.width, renderBox.size.height);
    }
  }
}
