import 'package:flutter/services.dart' as DS;
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/NeighboringTickCalculator.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:opc_node_designer/calc/ValueRangeMapper.dart';
import 'package:opc_node_designer/state/designer/designer.state.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.state.dart';
import 'package:opc_node_designer/widgets/designer/chart/PanPainter.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/add_handler/AddHandlerFactory.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/move_preview_painters/MovePreviewPainterProvider.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/hover_tester/OverlapCalculatorFactory.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/InteractionHandler.Actions.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/InteractionHandler.State.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/move_handler/ValueMoveHandlerFactory.dart';
import 'package:window_manager/window_manager.dart';

class InteractionHandler extends ConsumerStatefulWidget {
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
        MovePreviewPainterProvider,
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
    valueMoveHandler = ValueMoveHandlerFactory.getMoveHandler(waveForm);
    valueAddHandler = AddHandlerFactory.getAddHandler(waveForm);
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
    ref.listen(waveFormStateProvider, (_, newWaveForm) {
      setState(() {
        overlapDetector =
            OverlapCalculatorFactory.getOverlapCalculator(newWaveForm);
        valueMoveHandler = ValueMoveHandlerFactory.getMoveHandler(newWaveForm);
        valueAddHandler = AddHandlerFactory.getAddHandler(newWaveForm);
      });
    });
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

    final interactionPainters = isDraggingValue
        ? providePainters(waveForm, designer, currentDragOffset)
            .map(
              (painter) => Container(
                width: double.infinity,
                height: double.infinity,
                child: CustomPaint(
                  painter: painter,
                ),
              ),
            )
            .toList()
        : [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: PanPainter(
                  start: dragStartOffset?.dx,
                  end: currentDragOffset?.dx,
                ),
              ),
            )
          ];

    return Stack(
      children: [
        Stack(
          children: interactionPainters,
        ),
        Container(
          child: MouseRegion(
            key: _widgetKey,
            onHover: onHover,
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
                color: AppTheme.foreground.withAlpha(0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
