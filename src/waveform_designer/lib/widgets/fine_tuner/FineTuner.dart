import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/DurationControl.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/TickFrequencyControl.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/TransitionPointsControl.dart';
import 'package:waveform_designer/widgets/fine_tuner/save/Saver.dart';

class FineTuner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 74, 144, 226)),
      padding: const EdgeInsets.all(25),
      width: 320,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Saver(),
          SizedBox(height: 60),
          DurationControl(),
          SizedBox(height: 80),
          TickFrequencyControl(),
          SizedBox(height: 80),
          TransitionPointsControl(),
        ],
      ),
    );
  }
}
