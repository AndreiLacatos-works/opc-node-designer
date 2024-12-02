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
  bool _isHovering = false;
  bool _isDragConsidered = false;
  int? _tickToSnap;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateWidgetSize());
    windowManager.addListener(this);
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
      _isHovering = isOverlapping(event.localPosition.dx);
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() => _isHovering = false);
  }

  void handleDrag(double position) {
    setState(() {
      _tickToSnap = getNeighboringTick(position);
    });
  }

  void _dragStart(DragStartDetails details) {
    setState(() {
      _isDragConsidered = _isHovering;
    });
  }

  void _dragEnd(DragEndDetails details) {
    setState(() {
      _tickToSnap = null;
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
            cursor: _isHovering
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
