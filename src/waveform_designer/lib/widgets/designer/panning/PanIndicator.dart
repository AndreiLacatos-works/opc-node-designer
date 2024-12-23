import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';

class PanIndicator extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var state = ref.watch(designerStateProvider);
        var widgetWidth = constraints.maxWidth;
        var width = state.sliceRatio * widgetWidth;
        var leftOffset = state.sliceOffset * widgetWidth;

        return Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              height: 18,
              width: widgetWidth,
              color: Color.fromARGB(255, 235, 235, 235),
            ),
            Transform.translate(
              offset: Offset(leftOffset, 0),
              child: Container(
                height: 18,
                width: width,
                color: Color.fromARGB(255, 171, 171, 171),
              ),
            ),
          ],
        );
      },
    );
  }
}
