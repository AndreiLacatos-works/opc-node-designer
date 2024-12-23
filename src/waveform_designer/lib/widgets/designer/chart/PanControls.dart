import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';

class PanControls extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void resetPan() {
      ref.read(designerStateProvider.notifier).resetPan();
    }

    void panLeft() {
      ref.read(designerStateProvider.notifier).panLeft();
    }

    void panRight() {
      ref.read(designerStateProvider.notifier).panRight();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: panLeft,
              child: FaIcon(
                FontAwesomeIcons.arrowLeft,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: panRight,
              child: FaIcon(
                FontAwesomeIcons.arrowRight,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: resetPan,
              child: FaIcon(
                FontAwesomeIcons.rotateRight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
