import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/TransitionPointAdder.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/TransitionPointControl.dart';
import 'package:waveform_designer/widgets/shared/SimpleButton.dart';

class TransitionPointsControl extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransitionPointsControlState();
}

class _TransitionPointsControlState
    extends ConsumerState<TransitionPointsControl> {
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
    void handleAddPoint(int value) {
      ref.read(waveFormStateProvider.notifier).addTransitionPoint(value);
      _cancelAddMode();
    }

    final transitionPoints =
        ref.watch(waveFormStateProvider).values.map((v) => v.tick).toList();
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
                ),
              ],
            ),
          ),
          if (_addMode)
            TransitionPointAdder(
              onConfirm: handleAddPoint,
              onCancel: _cancelAddMode,
            ),
          Expanded(
            child: ListView.builder(
              itemCount: transitionPoints.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: TransitionPointControl(
                  key: Key(
                    index.toString(),
                  ),
                  pointIndex: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
