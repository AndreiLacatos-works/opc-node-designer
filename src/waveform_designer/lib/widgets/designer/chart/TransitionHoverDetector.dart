import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.dart';
import 'package:waveform_designer/widgets/designer/chart/SnapPainter.dart';
import 'package:window_manager/window_manager.dart';

class TransitionHoverDetector extends ConsumerStatefulWidget {
  final Widget child;

  TransitionHoverDetector({
    required this.child,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransitionHoverDetectorState();
}

class _TransitionHoverDetectorState
    extends ConsumerState<TransitionHoverDetector> with WindowListener {
  bool _isHovering = false;
  bool isDragConsidered = false;
  final GlobalKey _widgetKey = GlobalKey();
  Size? _widgetSize;
  int? tickToSnap;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getWidgetSize());
    windowManager.addListener(this);
    tickToSnap = null;
  }

  void _getWidgetSize() {
    final renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        _widgetSize = renderBox.size;
      });
    }
  }

  void _onHover(BuildContext context, PointerHoverEvent event) {
    double tolerancePixels = 6.0;

    if (_widgetSize == null) {
      setState(() => _isHovering = false);
      return;
    }

    final mapped = mapValueToNewRange(
        0,
        _widgetSize!.width,
        event.localPosition.dx,
        0,
        ref.read(waveFormStateProvider).duration.toDouble());
    final mappedTolerance = mapValueToNewRange(
        0,
        _widgetSize!.width,
        tolerancePixels,
        0,
        ref.read(waveFormStateProvider).duration.toDouble());

    for (var i = 0;
        i < ref.read(waveFormStateProvider).transitionPoints.length;
        i++) {
      final point = ref.read(waveFormStateProvider).transitionPoints[i];
      if ((point - mapped).abs() <= mappedTolerance) {
        setState(() => _isHovering = true);
        return;
      }
    }

    setState(() {
      _isHovering = false;
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() => _isHovering = false);
  }

  double mapValueToNewRange(double originalRangeStart, double originalRangeEnd,
      double value, double newRangeStart, double newRangeEnd) {
    double proportion =
        (value - originalRangeStart) / (originalRangeEnd - originalRangeStart);

    double mappedValue =
        newRangeStart + proportion * (newRangeEnd - newRangeStart);

    return mappedValue;
  }

  void snapToTick(double position) {
    final mapped = mapValueToNewRange(0, _widgetSize!.width, position, 0,
            ref.read(waveFormStateProvider).duration.toDouble())
        .toInt();

    // determine the closest tick
    final tickCount = ref.read(waveFormStateProvider).duration ~/
            ref.read(waveFormStateProvider).tickFrequency +
        1;
    final ticks = List.generate(
            tickCount, (i) => i * ref.read(waveFormStateProvider).tickFrequency)
        .toList();
    final closestTick =
        ticks.reduce((a, b) => (a - mapped).abs() < (b - mapped).abs() ? a : b);
    setState(() {
      tickToSnap = closestTick;
    });
  }

  void _dragStart(DragStartDetails details) {
    setState(() {
      isDragConsidered = _isHovering;
    });
  }

  void _dragEnd(DragEndDetails details) {
    setState(() {
      tickToSnap = null;
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (isDragConsidered) {
      snapToTick(details.localPosition.dx);
    }
  }

  @override
  void onWindowResize() {
    _getWidgetSize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: SnapPainter(
              tick: tickToSnap,
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
