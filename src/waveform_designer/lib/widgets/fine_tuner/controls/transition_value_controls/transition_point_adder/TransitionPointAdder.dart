import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/transition_value_controls/transition_point_adder/TransitionPointAdder.Actions.dart';
import 'package:waveform_designer/widgets/input/LabeledInput.dart';
import 'package:waveform_designer/widgets/shared/ErrorDisplay.dart';
import 'package:waveform_designer/widgets/shared/IconButton.dart';

class TransitionPointAdder extends ConsumerStatefulWidget {
  final Function() onConfirmed;
  final Function() onCancel;
  TransitionPointAdder({
    required this.onConfirmed,
    required this.onCancel,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransitionPointAdderState();
}

class _TransitionPointAdderState
    extends ErrorConsumerState<TransitionPointAdder>
    with TransitionPointAdderActions {
  late int? _value;

  @override
  void initState() {
    _value = null;
    super.initState();
  }

  void _handleValueChange(int? newValue) {
    setState(() {
      _value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Column(
        children: [
          Row(
            children: [
              LabeledInput(
                label: "ms",
                width: 80,
                value: _value ?? 0,
                onChanged: _handleValueChange,
                onSubmitted: (val) {
                  handleConfirm(widget.onConfirmed, val, ref);
                },
                onFocus: clearError,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: IconButton(
                  onClick: () {
                    handleConfirm(widget.onConfirmed, _value, ref);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.check,
                    color: AppTheme.brightGreen,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: IconButton(
                  onClick: widget.onCancel,
                  icon: FaIcon(
                    FontAwesomeIcons.xmark,
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
      ),
    );
  }
}
