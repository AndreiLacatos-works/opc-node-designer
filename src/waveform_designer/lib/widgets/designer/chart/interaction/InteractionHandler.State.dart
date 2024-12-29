import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/hover_tester/AbstractValueOverlapCalculator.dart';

mixin InteractionHandlerState<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  late WaveFormValueModel? hoveredValue;
  late bool isDraggingValue;
  late int? tickToSnap;
  late Offset? dragStartOffset;
  late Offset? currentDragOffset;
  late AbstractValueOverlapCalculator? overlapDetector;
}
