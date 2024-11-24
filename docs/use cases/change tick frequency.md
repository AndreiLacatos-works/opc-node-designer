# Rules for changing tick frequency

When the tick frequency is changed the following conditions must be fulfilled:

- is in the supported range
- new tick frequency is elss than the duration

The absolute coordinates of the transition points remain unchanged. For example, with a tick frequency of 20ms and transition points at 40ms, 100ms, and 120ms, changing the tick frequency to 10ms will not alter the positions of these transition points.

If a transition point no longer aligns with the new ticks, it is discarded. For instance, if the tick frequency is changed from 20ms to 40ms, the transition point at 100ms, which no longer aligns with the new ticks, will be discarded.
