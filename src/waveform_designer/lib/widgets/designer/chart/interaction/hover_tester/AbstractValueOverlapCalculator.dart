import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';

abstract class AbstractValueOverlapCalculator {
  WaveFormValueModel? getOverlappingWaveformValue(
    ScreenSpacePoint position,
    WaveFormModel waveForm,
    DesignerModel designer,
  );
}
