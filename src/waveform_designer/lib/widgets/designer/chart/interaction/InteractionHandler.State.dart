import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/add_handler/AbstractValueAddHandler.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/hover_tester/AbstractValueOverlapCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/move_handler/AbstractMoveHandler.dart';

mixin InteractionHandlerState<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  late WaveFormValueModel? hoveredValue;
  late bool isDraggingValue;
  late int? tickToSnap;
  late Offset? dragStartOffset;
  late Offset? currentDragOffset;
  late AbstractValueOverlapCalculator overlapDetector;
  late AbstractMoveHandler valueMoveHandler;
  late AbstractValueAddHandler valueAddHandler;
}
