import 'package:waveform_designer/calc/ValueRangeMapper.dart';

mixin RangeRestrictorMapper on ValueRangeMapper {
  late double availableAreaRatio = .9;

  // similar to mapValueToNewRange, additionally it adds a restriction to
  // the new range, such that the value is mapped onto the middle percentage
  // area defined by availableAreaRation. E.g. availableAreaRation = .5 and
  // desired range start = 0 & end = 10, any value will be in range [2.5, 7.5]
  double mapValueToRestrictedRange(
    double originalRangeStart,
    double originalRangeEnd,
    double value,
    double newRangeStart,
    double newRangeEnd,
  ) {
    return mapValueToNewRange(
      originalRangeStart,
      originalRangeEnd,
      value,
      newRangeStart * ((1 - availableAreaRatio) / 2),
      newRangeEnd * ((1 + availableAreaRatio) / 2),
    );
  }
}
