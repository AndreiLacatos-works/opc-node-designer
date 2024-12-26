import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/shared/IconButton.dart';

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
          child: IconButton(
            onClick: panLeft,
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: AppTheme.textColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: IconButton(
            onClick: panRight,
            icon: FaIcon(
              FontAwesomeIcons.arrowRight,
              color: AppTheme.textColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: IconButton(
            onClick: resetPan,
            icon: FaIcon(
              FontAwesomeIcons.rotateRight,
              color: AppTheme.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
