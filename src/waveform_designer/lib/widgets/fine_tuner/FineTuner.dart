import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/DurationControl.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/MetaControls.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/TickFrequencyControl.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/WaveformValuesControl.dart';
import 'package:opc_node_designer/widgets/fine_tuner/project_actions/Closer.dart';
import 'package:opc_node_designer/widgets/fine_tuner/project_actions/Pusher.dart';
import 'package:opc_node_designer/widgets/fine_tuner/project_actions/Saver.dart';

class FineTuner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.accentColor,
      ),
      padding: const EdgeInsets.all(25),
      width: 370,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Saver(),
              SizedBox.fromSize(
                size: Size(16, 0),
              ),
              Pusher(),
              SizedBox.fromSize(
                size: Size(16, 0),
              ),
              Closer(),
            ],
          ),
          SizedBox(height: 60),
          DurationControl(),
          SizedBox(height: 60),
          TickFrequencyControl(),
          SizedBox(height: 30),
          MetaControls(),
          SizedBox(height: 30),
          WaveformValuesControl(),
        ],
      ),
    );
  }
}
