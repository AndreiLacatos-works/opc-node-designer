mixin ValueRangeMapper {
  double mapValueToNewRange(double originalRangeStart, double originalRangeEnd,
      double value, double newRangeStart, double newRangeEnd) {
    double proportion =
        (value - originalRangeStart) / (originalRangeEnd - originalRangeStart);

    double mappedValue =
        newRangeStart + proportion * (newRangeEnd - newRangeStart);

    return mappedValue;
  }
}
