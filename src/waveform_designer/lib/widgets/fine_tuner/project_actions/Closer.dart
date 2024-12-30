import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/shared/TextButton.dart';
import 'package:waveform_designer/widgets/shared/confirmation_dialog.dart';

class Closer extends ConsumerWidget {
  Future _handleClose(BuildContext context, WidgetRef ref) async {
    final confirmed = await showConfirmationDialog(
      context: context,
      prompt:
          "Are you sure you want to close the waveform? Unsaved changes will be lost",
    );
    if (confirmed) {
      ref.read(waveFormStateProvider.notifier).reset();
      ref.read(designerStateProvider.notifier).reset();
      Navigator.of(context).pushNamed("/launcher");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onClick: () => _handleClose(context, ref),
      text: "Close",
      color: AppTheme.danger,
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
    );
  }
}
