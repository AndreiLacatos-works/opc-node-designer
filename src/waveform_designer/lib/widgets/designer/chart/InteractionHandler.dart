import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/calc/TickOverlapCalculator.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/designer/chart/PanPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/SnapPainter.dart';
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
        NeighboringTickCalculator,
        TickOverlapCalculator {
  final GlobalKey _widgetKey = GlobalKey();
  late int? _hoveredTransitionPointIndex;
  late bool _isDraggingTransition;
  late int? _tickToSnap;
  late double? _dragStartXOffset;
  late double? _currentDragOffset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateWidgetSize());
    windowManager.addListener(this);
    _hoveredTransitionPointIndex = null;
    _isDraggingTransition = false;
    _tickToSnap = null;
    _dragStartXOffset = null;
    _currentDragOffset = null;
  }

  void _updateWidgetSize() {
    final renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      diagramWidth = renderBox.size.width;
      ref
          .read(designerStateProvider.notifier)
          .updateDesignerWidth(diagramWidth);
    }
  }

  void _onHover(BuildContext context, PointerHoverEvent event) {
    setState(() {
      _hoveredTransitionPointIndex =
          getOverlappingTransitionPointIndex(event.localPosition.dx);
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() {
      _hoveredTransitionPointIndex = null;
      _isDraggingTransition = false;
      _tickToSnap = null;
      _dragStartXOffset = null;
      _currentDragOffset = null;
    });
  }

  void _dragStart(DragStartDetails details) {
    setState(() {
      _isDraggingTransition = _hoveredTransitionPointIndex != null;
      _dragStartXOffset = details.localPosition.dx;
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_isDraggingTransition) {
      setState(() {
        _tickToSnap = getNeighboringTick(details.localPosition.dx);
      });
    } else {
      setState(() {
        _currentDragOffset = details.localPosition.dx;
      });
    }
  }

  void _dragEnd(DragEndDetails details) {
    if (_isDraggingTransition) {
      if (_tickToSnap != null && _hoveredTransitionPointIndex != null) {
        ref.read(waveFormStateProvider.notifier).updateTransitionPoint(
              _hoveredTransitionPointIndex!,
              _tickToSnap!,
            );
      }
    } else {
      var delta = (_dragStartXOffset ?? 0.0 - details.localPosition.dx).abs();
      // prevent zoom when selected area is really small (could be accidentally
      // 1 or 2 pixels when clicking)
      if (_dragStartXOffset != null && delta > 12) {
        ref
            .read(designerStateProvider.notifier)
            .updatePan(_dragStartXOffset!, details.localPosition.dx);
      }
    }
    setState(() {
      _tickToSnap = null;
      _dragStartXOffset = null;
      _currentDragOffset = null;
    });
  }

  @override
  void onWindowResize() {
    _updateWidgetSize();
  }

  @override
  Widget build(BuildContext context) {
    void onClickUp(TapUpDetails details) {
      final neighbouringTick = getNeighboringTick(details.localPosition.dx);
      ref
          .read(waveFormStateProvider.notifier)
          .addTransitionPoint(neighbouringTick);
    }

    waveForm = ref.watch(waveFormStateProvider);

    return Stack(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: SnapPainter(
                  tick: _tickToSnap,
                  duration: ref.read(waveFormStateProvider).duration,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: PanPainter(
                  start: _dragStartXOffset,
                  end: _currentDragOffset,
                ),
              ),
            ),
          ],
        ),
        Container(
          child: MouseRegion(
            key: _widgetKey,
            onHover: (e) {
              _onHover(context, e);
            },
            onExit: _onExit,
            cursor: _hoveredTransitionPointIndex != null
                ? SystemMouseCursors.resizeColumn
                : SystemMouseCursors.basic,
            child: GestureDetector(
              onPanStart: _dragStart,
              onPanEnd: _dragEnd,
              onPanUpdate: _onDragUpdate,
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
