import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

mixin InteractionState<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  late WaveFormValueModel? hoveredTransitionPointIndex;
  late bool isDraggingTransition;
  late int? tickToSnap;
  late double? dragStartXOffset;
  late double? currentDragOffset;
}
