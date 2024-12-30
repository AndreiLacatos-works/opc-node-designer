import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/serialization/waveform/waveform.model.dart'
    as WaveformSerialization;

mixin InitFromFile {
  Future initStateFromFile(
    String projectPath,
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final waveformFile = File(projectPath);
      final waveformJson = await waveformFile.readAsString();
      final waveform = WaveformSerialization.WaveFormModel.fromJson(
          jsonDecode(waveformJson) as Map<String, dynamic>);
      ref.read(waveFormStateProvider.notifier).initialize(waveform.toState());
      ref.read(designerStateProvider.notifier).setProjectPath(projectPath);

      Navigator.of(context).pushNamed('/designer');
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
