import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';
import 'package:waveform_designer/widgets/input/LabeledInput.dart';
import 'package:waveform_designer/widgets/shared/ErrorDisplay.dart';

class TransitionPointAdder extends ConsumerStatefulWidget {
  final Function(int) onConfirm;
  final Function() onCancel;
  TransitionPointAdder({required this.onConfirm, required this.onCancel});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransitionPointAdderState();
}

class _TransitionPointAdderState
    extends ErrorConsumerState<TransitionPointAdder> {
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

  void _handleConfirm() {
    if (_value != null) {
      try {
        widget.onConfirm(_value!);
      } on String catch (e) {
        setError(e);
      }
    }
  }

  void _handleSubmit(int? val) {
    if (val != null) {
      try {
        widget.onConfirm(val);
      } on String catch (e) {
        setError(e);
      }
    }
  }

  void _handleCancel() {
    widget.onCancel();
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
                onSubmitted: _handleSubmit,
                onFocus: clearError,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 8, 0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _handleConfirm,
                    child: FaIcon(
                      FontAwesomeIcons.check,
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
                    onTap: _handleCancel,
                    child: FaIcon(
                      FontAwesomeIcons.xmark,
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
      ),
    );
  }
}
