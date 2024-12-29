import 'dart:ui';

class ScreenSpacePoint {
  final double dx;
  final double dy;

  const ScreenSpacePoint({
    required this.dx,
    required this.dy,
  });

  factory ScreenSpacePoint.fromOffset(Offset offset) {
    return ScreenSpacePoint(dx: offset.dx, dy: offset.dy);
  }
}
