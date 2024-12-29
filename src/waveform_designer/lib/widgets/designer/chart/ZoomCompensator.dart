mixin ZoomCompensator {
  double compensateZoom(double value, double sliceRatio) {
    final zoomRatio = 1.0 / sliceRatio;
    return value / zoomRatio;
  }
}
