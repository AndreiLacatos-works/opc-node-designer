# Diagram definition

A waveform diagram is defined by the following information:

- duration
- tick frequency
- transition points

The duration specifies the length of the waveform in milliseconds, while the tick frequency determines the maximum density of distinct transition points. A transition point represents the moment when the signal changes to a different value.

For defining the values of transition points refer to [transition point management](use%20cases/manage%20transition%20points.md).

## Constraints

The app supports durations ranging from 10 ms to 10^7 ms (~2h 45m). The tick duration can vary from 1 ms up to the full duration. The maximum number of transition points is determined by dividing the duration by the tick frequency. A transition point must intersect a tick.
