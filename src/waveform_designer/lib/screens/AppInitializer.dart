import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/screens/WaveformLauncher.dart';
import 'package:waveform_designer/state/init/init_from_file.dart';

class AppInitializer extends ConsumerWidget with InitFromFile {
  final String? starterFile;

  AppInitializer({
    super.key,
    required this.starterFile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (starterFile != null) {
      initStateFromFile(starterFile!, context, ref);
    }
    return WaveformLauncher();
  }
}
