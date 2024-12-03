import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/widgets/input/LabeledInput.dart';

class TransitionPointAdder extends ConsumerStatefulWidget {
  final Function(int) onConfirm;
  final Function() onCancel;
  TransitionPointAdder({required this.onConfirm, required this.onCancel});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransitionPointAdderState();
}

class _TransitionPointAdderState extends ConsumerState<TransitionPointAdder> {
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
      widget.onConfirm(_value!);
    }
  }

  void _handleSubmit(int? val) {
    if (val != null) {
      widget.onConfirm(val);
    }
  }

  void _handleCancel() {
    widget.onCancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          LabeledInput(
            label: "ms",
            width: 80,
            value: _value ?? 0,
            onChanged: _handleValueChange,
            onSubmitted: _handleSubmit,
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
    );
  }
}
