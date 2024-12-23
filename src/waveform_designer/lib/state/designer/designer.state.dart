import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';

part 'designer.state.g.dart';

@riverpod
class DesignerState extends _$DesignerState {
  @override
  DesignerModel build() {
    return DesignerModel(designerWidth: 0, sliceOffset: 0, sliceRatio: 1.0);
  }

  void updateDesignerWidth(double width) {
    state = state.copyWith(designerWidth: width);
  }

  void updatePan(double start, double end) {
    var normalizedStart = min(start, end);
    state = state.copyWith(
      sliceRatio: (start - end).abs() / state.designerWidth,
      sliceOffset: normalizedStart / state.designerWidth,
    );
  }

  void updatePanOffset(double delta) {
    var newOffset = state.sliceOffset + delta;
    newOffset = min(newOffset, 1 - state.sliceRatio);
    newOffset = max(newOffset, 0);
    state = state.copyWith(sliceOffset: newOffset);
  }
}
