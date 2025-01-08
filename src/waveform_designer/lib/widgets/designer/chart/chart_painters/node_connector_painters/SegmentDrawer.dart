import 'dart:ui';

import 'package:opc_node_designer/calc/ValueRangeMapper.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/VerticalOffsetCalculator.dart';

mixin SegmentDrawer on ValueRangeMapper, VerticalOffsetCalculator {
  void drawHorizontalSection(
    WaveFormValueModel previous,
    WaveFormValueModel current,
    int duration,
    List<WaveFormValueModel> values,
    Canvas canvas,
    Size size,
    Paint paint,
  ) {
    var from = Offset(
      mapValueToNewRange(
        0,
        duration.toDouble(),
        previous.tick.toDouble(),
        0,
        size.width,
      ),
      getVerticalOffset(values, previous, size),
    );
    var to = Offset(
      mapValueToNewRange(
        0,
        duration.toDouble(),
        current.tick.toDouble(),
        0,
        size.width,
      ),
      getVerticalOffset(values, previous, size),
    );
    canvas.drawLine(from, to, paint);
  }

  void drawVerticalSection(
    WaveFormValueModel previous,
    WaveFormValueModel current,
    int duration,
    List<WaveFormValueModel> values,
    Canvas canvas,
    Size size,
    Paint paint,
  ) {
    var from = Offset(
      mapValueToNewRange(
        0,
        duration.toDouble(),
        current.tick.toDouble(),
        0,
        size.width,
      ),
      getVerticalOffset(values, previous, size),
    );
    var to = Offset(
      mapValueToNewRange(
        0,
        duration.toDouble(),
        current.tick.toDouble(),
        0,
        size.width,
      ),
      getVerticalOffset(values, current, size),
    );
    canvas.drawLine(from, to, paint);
  }
}
