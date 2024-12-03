import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/TransitionPointControl.dart';

class TransitionPointsControl extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transitionPoints = ref.watch(waveFormStateProvider).transitionPoints;
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 12),
            width: double.infinity,
            child: Text(
              "Transition points",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transitionPoints.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: TransitionPointControl(
                  key: Key(
                    index.toString(),
                  ),
                  pointIndex: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
