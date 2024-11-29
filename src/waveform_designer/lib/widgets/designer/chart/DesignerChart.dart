import 'package:flutter/widgets.dart';
import 'package:waveform_designer/widgets/designer/chart/TickPainter.dart';
import 'package:waveform_designer/widgets/designer/chart/TransitionHoverDetector.dart';
import 'package:waveform_designer/widgets/designer/chart/WaveForm.dart';

class DesignerChart extends StatelessWidget {
  final duration = 100;
  final tickFrequency = 5;
  final transitionPoints = [10, 15, 30, 45, 55, 80];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Container(
          padding: EdgeInsets.all(35),
          color: Color.fromARGB(255, 255, 255, 255),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 2.7,
                child: CustomPaint(
                  painter: WaveFormPainter(
                    duration: duration,
                    transitionPoints: transitionPoints,
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 2.7,
                child: TransitionHoverDetector(
                  duration: duration,
                  tickFrequency: tickFrequency,
                  transitionPoints: transitionPoints,
                  child: CustomPaint(
                    painter: TickPainter(
                      duration: duration,
                      frequency: tickFrequency,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
