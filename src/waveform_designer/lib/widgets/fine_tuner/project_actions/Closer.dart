import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';

class Closer extends ConsumerWidget {
  void _handleClose(BuildContext context, WidgetRef ref) {
    ref.read(waveFormStateProvider.notifier).reset();
    ref.read(designerStateProvider.notifier).reset();
    Navigator.of(context).pushNamed("/");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _handleClose(context, ref);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 239, 73, 31),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'Close',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
