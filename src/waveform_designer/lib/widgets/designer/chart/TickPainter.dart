import 'package:flutter/widgets.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/designer/chart/PanningBehavior.dart';
import 'package:waveform_designer/widgets/designer/chart/ZoomCompensator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';

class TickPainter extends CustomPainter
    with
        ValueRangeMapper,
        PanningBehavior,
        ZoomCompensator,
        RangeRestrictorMapper,
        WaveformMinMaxer {
  final WaveFormModel _waveform;
  final DesignerModel _panning;

  TickPainter({
    required WaveFormModel waveform,
    required DesignerModel panning,
  })  : _waveform = waveform,
        _panning = panning;

  @override
  void paint(Canvas canvas, Size size) {
    final clipSize = Size(size.width + 40, size.height + 40);
    zoomAndPan(
        canvas, size, _panning.sliceRatio, _panning.sliceOffset, clipSize);

    // show roughly 20 ticks in the visible viewport
    final frequency = _waveform.tickFrequency;
    final duration = _waveform.duration;
    final maxTicksToShow = 20 ~/ _panning.sliceRatio;
    final alternativeStep =
        _calculateAlternativeStepSize(duration, maxTicksToShow, frequency);
    final ticksToShow =
        List.generate(maxTicksToShow, (i) => i * alternativeStep);
    final totalTickCount = duration == 0 || frequency == 0
        ? 0
        : (duration / frequency + 1).toInt();
    for (var i = 0; i < totalTickCount; i++) {
      final tick = i * frequency;
      if (ticksToShow.contains(tick)) {
        final horizontalOffset = mapValueToNewRange(
            0, duration.toDouble(), i * frequency.toDouble(), 0, size.width);
        _drawTickAtOffset(canvas, size, horizontalOffset, tick);
      }
    }

    // in case the last tick does not align with the duration, draw an extra tick
    if (_waveform.tickFrequency != 0 &&
        _waveform.duration % _waveform.tickFrequency != 0) {
      _drawTickAtOffset(canvas, size, size.width, _waveform.duration);
    }

    // draw left marks
    if (_waveform.type == DoubleValue) {
      _drawMarks(duration, frequency, canvas, size);
    }
  }

  void _drawTickAtOffset(
    Canvas canvas,
    Size size,
    double horizontalOffset,
    int tickIndex,
  ) {
    var dashHeight = 4, dashSpace = 6, startY = 0.0;
    final paint = Paint()
      ..color = AppTheme.textColor.withAlpha(107)
      ..strokeWidth = compensateZoom(2.0, _panning.sliceRatio)
      ..style = PaintingStyle.stroke;
    final bottomOffset = Offset(horizontalOffset, size.height);

    // draw small vertical dashed segments that add up to a dashed line
    startY = 0;
    while (startY < bottomOffset.dy) {
      canvas.drawLine(Offset(horizontalOffset, startY),
          Offset(horizontalOffset, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }

    _drawText(
        canvas,
        size,
        Offset(horizontalOffset / _panning.sliceRatio, size.height)
            .translate(0, 5),
        tickIndex.toString());
  }

  void _drawText(
    Canvas canvas,
    Size size,
    Offset offset,
    // int tickIndex,
    String text, {
    bool horizontalCenter = true,
    bool verticalCenter = false,
  }) {
    canvas.save();

    // apply an inverse canvas transformation to avoid stretching text
    canvas.transform(
      Matrix4.identity()
          .scaled(compensateZoom(1, _panning.sliceRatio), 1.0)
          .storage,
    );

    // draw tick text
    const textStyle = TextStyle(
      color: AppTheme.textColor,
      fontSize: 14,
    );
    var textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    textPainter.paint(
        canvas,
        offset.translate(
          horizontalCenter ? textPainter.width / 2 * -1 : 0,
          verticalCenter ? textPainter.height / 2 * -1 : 0,
        ));
    canvas.restore();
  }

  int _calculateAlternativeStepSize(
    int duration,
    int targetItemCount,
    int stepOriginal,
  ) {
    final stepAlternative = duration / targetItemCount;
    return stepAlternative <= stepOriginal
        ? stepOriginal
        : (stepAlternative / stepOriginal).ceil() * stepOriginal;
  }

  void _drawMarks(
    int duration,
    int frequency,
    Canvas canvas,
    Size size,
  ) {
    // draw left hand marks
    final paint = Paint()
      ..color = AppTheme.textColor
      ..strokeWidth = compensateZoom(2.0, _panning.sliceRatio)
      ..style = PaintingStyle.stroke;
    final from = Offset(
        _panning.sliceOffset * size.width - 20 * _panning.sliceRatio, 0.0);
    final to = Offset(
        _panning.sliceOffset * size.width - 20 * _panning.sliceRatio,
        size.height);
    canvas.drawLine(from, to, paint);
    paint.strokeWidth = 2.0;

    final markLength = 8;
    final markCount = 4;
    final [min, max] = getWaveformMinMaxValues(_waveform.values);
    for (var i = 0; i <= markCount; i++) {
      final verticalOffset = size.height * availableAreaRatio / markCount * i +
          size.height * ((1 - availableAreaRatio) / 2);
      final baseOffset =
          _panning.sliceOffset * size.width - 20 * _panning.sliceRatio;
      final markStart =
          Offset(baseOffset - markLength * _panning.sliceRatio, verticalOffset);
      final markEnd =
          Offset(baseOffset + markLength * _panning.sliceRatio, verticalOffset);
      canvas.drawLine(markStart, markEnd, paint);

      _drawText(
        canvas,
        size,
        Offset((markEnd.dx / _panning.sliceRatio) + 20, markEnd.dy),
        mapValueToNewRange(
          0.0,
          markCount.toDouble(),
          i.toDouble(),
          max,
          min,
        ).toStringAsFixed(1),
        verticalCenter: true,
        horizontalCenter: false,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
