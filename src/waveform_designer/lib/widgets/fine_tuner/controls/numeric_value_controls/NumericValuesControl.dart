import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opc_node_designer/state/waveform/waveform.state.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/numeric_value_controls/numeric_value_adder/NumericValueAdder.dart';
import 'package:opc_node_designer/widgets/fine_tuner/controls/numeric_value_controls/numeric_value_control/NumericValueControl.dart';
import 'package:opc_node_designer/widgets/shared/SimpleButton.dart';
import 'package:opc_node_designer/state/opc_designer/opc_designer.state.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart';

class NumericValuesControl extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NumericValuesControlState();
}

class _NumericValuesControlState extends ConsumerState<NumericValuesControl> {
  late bool _addMode;

  @override
  void initState() {
    super.initState();
    _addMode = false;
  }

  void _triggerAddMode() {
    setState(() {
      _addMode = true;
    });
  }

  void _cancelAddMode() {
    setState(() {
      _addMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transitionPoints = ref.watch(waveFormStateProvider).values;
    final valueNodeSelected =
        ref.watch(opcDesignerStateProvider).selectedNode is OpcValueNodeModel;
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      "Transition points",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SimpleButton(
                  onClick: _triggerAddMode,
                  color: AppTheme.brightGreen,
                  padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                  content: FaIcon(
                    FontAwesomeIcons.plus,
                    size: 20,
                    color: AppTheme.foreground,
                  ),
                  disabled: !valueNodeSelected,
                ),
              ],
            ),
          ),
          if (_addMode)
            NumericValueAdder(
              onConfirmed: _cancelAddMode,
              onCancel: _cancelAddMode,
            ),
          Expanded(
            child: ListView.builder(
              itemCount: transitionPoints.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: NumericValueControl(
                  key: Key(
                    index.toString(),
                  ),
                  waveformValue: transitionPoints[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
