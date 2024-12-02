import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/widgets/fine_tuner/TransitionPointControl.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/DurationControl.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/TickFrequencyControl.dart';
import 'package:waveform_designer/widgets/input/MultiLabeledInput.dart';

class FineTuner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 74, 144, 226)),
      padding: const EdgeInsets.all(40),
      width: 320,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          DurationControl(),
          SizedBox(
            height: 80,
          ),
          TickFrequencyControl(),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
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
              itemCount: 0,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: TransitionPointControl(
                  key: Key(
                    index.toString(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
