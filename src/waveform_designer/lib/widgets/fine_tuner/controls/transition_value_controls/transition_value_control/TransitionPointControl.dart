import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/transition_value_controls/transition_value_control/TransitionPointControl.Actions.dart';
import 'package:opc_node_designer/widgets/input/LabeledInput.dart';
import 'package:opc_node_designer/widgets/shared/ErrorDisplay.dart';
import 'package:opc_node_designer/widgets/shared/IconButton.dart';

class TransitionPointControl extends ConsumerStatefulWidget {
  final WaveFormValueModel waveformValue;

  TransitionPointControl({
    required this.waveformValue,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransitionPointControlState();
}

class _TransitionPointControlState
    extends ErrorConsumerState<TransitionPointControl>
    with TransitionPointControlActions {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            LabeledInput<int>(
              label: "ms",
              width: 80,
              value: widget.waveformValue.tick,
              onFocusLost: (val) {
                handleTickChange(
                  widget.waveformValue,
                  val,
                  ref,
                );
              },
              onSubmitted: (val) {
                handleTickChange(
                  widget.waveformValue,
                  val,
                  ref,
                );
              },
              onFocus: clearError,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: IconButton(
                onClick: () {
                  moveLeft(
                    widget.waveformValue,
                    ref,
                  );
                },
                icon: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: AppTheme.brightGreen,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: IconButton(
                onClick: () {
                  moveRight(
                    widget.waveformValue,
                    ref,
                  );
                },
                icon: FaIcon(
                  FontAwesomeIcons.arrowRight,
                  color: AppTheme.brightGreen,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: IconButton(
                onClick: () {
                  handleRemove(
                    widget.waveformValue,
                    ref,
                  );
                },
                icon: FaIcon(
                  FontAwesomeIcons.solidTrashCan,
                  color: AppTheme.danger,
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
