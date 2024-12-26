import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';
import 'package:waveform_designer/widgets/input/LabeledInput.dart';
import 'package:waveform_designer/widgets/shared/ErrorDisplay.dart';

class TransitionPointControl extends ConsumerStatefulWidget {
  final int pointIndex;

  TransitionPointControl({
    required this.pointIndex,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransitionPointControlState();
}

class _TransitionPointControlState
    extends ErrorConsumerState<TransitionPointControl> {
  @override
  Widget build(BuildContext context) {
    void handleMove(int? newValue) {
      if (newValue == null) {
        return;
      }

      try {
        ref
            .read(waveFormStateProvider.notifier)
            .updateTransitionPoint(widget.pointIndex, newValue);
        clearError();
      } on String catch (e) {
        setError(e);
      }
    }

    void moveLeft() {
      final waveform = ref.read(waveFormStateProvider);
      handleMove(waveform.transitionPoints[widget.pointIndex] -
          waveform.tickFrequency);
    }

    void moveRight() {
      final waveform = ref.read(waveFormStateProvider);
      handleMove(waveform.transitionPoints[widget.pointIndex] +
          waveform.tickFrequency);
    }

    void handleRemove() {
      try {
        ref
            .read(waveFormStateProvider.notifier)
            .removeTransitionPoint(widget.pointIndex);
        clearError();
      } on String catch (e) {
        setError(e);
      }
    }

    final transitionPoints = ref.watch(waveFormStateProvider).transitionPoints;
    if (widget.pointIndex >= transitionPoints.length) {
      return SizedBox.shrink();
    }

    final point = transitionPoints[widget.pointIndex];

    return Column(
      children: [
        Row(
          children: [
            LabeledInput(
              label: "ms",
              width: 80,
              value: point,
              onFocusLost: handleMove,
              onSubmitted: handleMove,
              onFocus: clearError,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 8, 0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: moveLeft,
                  child: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Color.fromARGB(255, 87, 237, 67),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: moveRight,
                  child: FaIcon(
                    FontAwesomeIcons.arrowRight,
                    color: Color.fromARGB(255, 87, 237, 67),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: handleRemove,
                  child: FaIcon(
                    FontAwesomeIcons.solidTrashCan,
                    color: Color.fromARGB(255, 239, 73, 31),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox.fromSize(
          size: Size.fromHeight(6),
        ),
        ErrorDisplay(error: error),
      ],
    );
  }
}
