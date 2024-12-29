import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/numeric_value_controls/numeric_value_adder/NumericValueAdder.Actions.dart';
import 'package:waveform_designer/widgets/input/LabeledInput.dart';
import 'package:waveform_designer/widgets/shared/ErrorDisplay.dart';
import 'package:waveform_designer/widgets/shared/IconButton.dart';

class NumericValueAdder extends ConsumerStatefulWidget {
  final Function() onConfirmed;
  final Function() onCancel;
  NumericValueAdder({
    required this.onConfirmed,
    required this.onCancel,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NumericValueAdder();
}

class _NumericValueAdder extends ErrorConsumerState<NumericValueAdder>
    with NumericValueAdderActions {
  late int? _tick;
  late double? _value;

  @override
  void initState() {
    _tick = null;
    _value = null;
    super.initState();
  }

  void _handleTickChange(int? newValue) {
    setState(() {
      _tick = newValue;
    });
  }

  void _handleValueChange(double? newValue) {
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: LabeledInput(
                  label: "at",
                  width: 60,
                  value: _value?.toInt() ?? 0,
                  onChanged: (val) {
                    _handleValueChange(val?.toDouble());
                  },
                  onSubmitted: (val) {
                    _handleValueChange(val?.toDouble());
                  },
                  onFocus: clearError,
                ),
              ),
              LabeledInput(
                label: "ms",
                width: 80,
                value: _tick ?? 0,
                onChanged: _handleTickChange,
                onSubmitted: _handleTickChange,
                onFocus: clearError,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: IconButton(
                  onClick: () {
                    handleConfirm(widget.onConfirmed, _tick, _value, ref);
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
