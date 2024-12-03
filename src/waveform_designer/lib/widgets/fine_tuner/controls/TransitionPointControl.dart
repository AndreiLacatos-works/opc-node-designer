import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/state/waveform/waveform.dart';
import 'package:waveform_designer/widgets/input/LabeledInput.dart';

class TransitionPointControl extends ConsumerWidget {
  final int pointIndex;

  TransitionPointControl({required this.pointIndex, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleMove(int? newValue) {
      if (newValue == null) {
        return;
      }

      ref
          .read(waveFormStateProvider.notifier)
          .updateTransitionPoint(pointIndex, newValue);
    }

    void moveLeft() {
      final waveform = ref.read(waveFormStateProvider);
      handleMove(
          waveform.transitionPoints[pointIndex] - waveform.tickFrequency);
    }

    void moveRight() {
      final waveform = ref.read(waveFormStateProvider);
      handleMove(
          waveform.transitionPoints[pointIndex] + waveform.tickFrequency);
    }

    void handleRemove() {
      ref
          .read(waveFormStateProvider.notifier)
          .removeTransitionPoint(pointIndex);
    }

    final transitionPoints = ref.watch(waveFormStateProvider).transitionPoints;
    if (pointIndex >= transitionPoints.length) {
      return SizedBox.shrink();
    }

    final point = transitionPoints[pointIndex];

    return Row(
      children: [
        LabeledInput(
          label: "ms",
          width: 80,
          value: point,
          onFocusLost: handleMove,
          onSubmitted: handleMove,
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
    );
  }
}
