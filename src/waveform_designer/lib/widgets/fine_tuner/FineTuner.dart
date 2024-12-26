import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/DurationControl.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/TickFrequencyControl.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/TransitionPointsControl.dart';
import 'package:waveform_designer/widgets/fine_tuner/project_actions/Closer.dart';
import 'package:waveform_designer/widgets/fine_tuner/project_actions/Saver.dart';

class FineTuner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.accentColor,
      ),
      padding: const EdgeInsets.all(25),
      width: 320,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Saver(),
              SizedBox.fromSize(
                size: Size(20, 0),
              ),
              Closer(),
            ],
          ),
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
