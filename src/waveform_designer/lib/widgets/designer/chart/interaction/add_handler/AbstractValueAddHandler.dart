import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';

abstract class AbstractValueAddHandler {
  void addValue(
    ScreenSpacePoint desiredPosition,
    WidgetRef ref,
  );
}
