import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/calc/TickOverlapCalculator.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/waveform/waveform.dart';
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
  late bool _isDragConsidered;
  late int? _tickToSnap;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateWidgetSize());
    windowManager.addListener(this);
    _hoveredTransitionPointIndex = null;
    _isDragConsidered = false;
    _tickToSnap = null;
  }

  void _updateWidgetSize() {
    final renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      diagramWidth = renderBox.size.width;
    }
  }

  void _onHover(BuildContext context, PointerHoverEvent event) {
    setState(() {
      _hoveredTransitionPointIndex =
          getOverlappingTransitionPointIndex(event.localPosition.dx);
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() => _hoveredTransitionPointIndex = null);
  }

  void handleDrag(double position) {
    setState(() {
      _tickToSnap = getNeighboringTick(position);
    });
  }

  void _dragStart(DragStartDetails details) {
    setState(() {
      _isDragConsidered = _hoveredTransitionPointIndex != null;
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_isDragConsidered) {
      handleDrag(details.localPosition.dx);
    }
  }

  @override
  void onWindowResize() {
    _updateWidgetSize();
  }

  @override
  Widget build(BuildContext context) {
    void _dragEnd(DragEndDetails details) {
      if (_isDragConsidered) {
        ref.read(waveFormStateProvider.notifier).updateTransitionPoint(
              _hoveredTransitionPointIndex!,
              _tickToSnap!,
            );
      }
      setState(() {
        _tickToSnap = null;
      });
    }

    waveForm = ref.watch(waveFormStateProvider);

    return Stack(
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
