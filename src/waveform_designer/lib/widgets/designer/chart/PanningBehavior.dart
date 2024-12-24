import 'package:flutter/widgets.dart';

mixin PanningBehavior {
  void zoomAndPan(
    Canvas canvas,
    Size originalSize,
    double zoomedSliceWidth,
    double zoomedSliceOffset, [
    Size? clippingSize,
  ]) {
    final clip = clippingSize ?? originalSize;
    // prevent rendering outside of the original canvas size
    final delta = Size(
      (clip.width - originalSize.width).abs() / 2,
      (clip.height - originalSize.height).abs() / 2,
    );
    canvas.clipRect(Rect.fromLTWH(
      delta.width * -1,
      delta.height * -1,
      originalSize.width + delta.width * 2,
      originalSize.height + delta.height * 2,
    ));

    // create a zoom effect by horizontally scaling the canvas
    final zoomRatio = 1.0 / zoomedSliceWidth;
    canvas.transform(Matrix4.identity().scaled(zoomRatio, 1.0).storage);

    // move it to the left such that the beginning of the zoomed area aligns
    // witht the beginning of the "physical" canvas
    canvas.translate(originalSize.width * zoomedSliceOffset * -1, 0.0);
  }
}
