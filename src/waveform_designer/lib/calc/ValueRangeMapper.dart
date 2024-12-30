mixin class ValueRangeMapper {
  double mapValueToNewRange(
    double originalRangeStart,
    double originalRangeEnd,
    double value,
    double newRangeStart,
    double newRangeEnd,
  ) {
    final originalDelta = originalRangeEnd - originalRangeStart;
    if (originalDelta == 0) {
      return 0.0;
    }
    double proportion = (value - originalRangeStart) / originalDelta;

    double mappedValue =
        newRangeStart + proportion * (newRangeEnd - newRangeStart);

    return mappedValue;
  }
}
