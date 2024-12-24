import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';

part 'designer.state.g.dart';

@riverpod
class DesignerState extends _$DesignerState with ValueRangeMapper {
  static DesignerModel _initialState = DesignerModel(
    designerWidth: 0.0,
    sliceOffset: 0.0,
    sliceRatio: 1.0,
    projectPath: null,
  );

  @override
  DesignerModel build() {
    return _initialState;
  }

  void setProjectPath(String? path) {
    state = state.copyWith(projectPath: path);
  }

  void updateDesignerWidth(double width) {
    state = state.copyWith(designerWidth: width);
  }

  void updatePan(double start, double end) {
    // map the input start and end positions from screen space
    // to duration space values to account for zooming,
    // especially when already zoomed in
    final mappedStart = mapValueToNewRange(
      0,
      state.designerWidth,
      start,
      state.designerWidth * state.sliceOffset,
      state.designerWidth * state.sliceOffset +
          state.designerWidth * state.sliceRatio,
    );
    final mappedEnd = mapValueToNewRange(
      0,
      state.designerWidth,
      end,
      state.designerWidth * state.sliceOffset,
      state.designerWidth * state.sliceOffset +
          state.designerWidth * state.sliceRatio,
    );
    final normalizedStart = min(mappedStart, mappedEnd);
    state = state.copyWith(
      sliceRatio: (mappedStart - mappedEnd).abs() / state.designerWidth,
      sliceOffset: normalizedStart / state.designerWidth,
    );
  }

  void updatePanOffset(double delta) {
    var newOffset = state.sliceOffset + delta;
    state = state.copyWith(sliceOffset: _clampOffset(newOffset));
  }

  void resetPan() {
    state = state.copyWith(sliceOffset: 0.0, sliceRatio: 1.0);
  }

  void panLeft() {
    state = state.copyWith(
        sliceOffset: _clampOffset(state.sliceOffset - _getTickDelta()));
  }

  void panRight() {
    state = state.copyWith(
        sliceOffset: _clampOffset(state.sliceOffset + _getTickDelta()));
  }

  void reset() {
    state = _initialState;
  }

  double _getTickDelta() {
    var waveformState = ref.read(waveFormStateProvider);
    var tickCount = waveformState.duration / waveformState.tickFrequency;
    return 1 / tickCount;
  }

  double _clampOffset(double offset) {
    var newOffset = min(offset, 1 - state.sliceRatio);
    return max(newOffset, 0);
  }
}
