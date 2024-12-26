import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin InteractionState<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  late int? hoveredTransitionPointIndex;
  late bool isDraggingTransition;
  late int? tickToSnap;
  late double? dragStartXOffset;
  late double? currentDragOffset;
}
