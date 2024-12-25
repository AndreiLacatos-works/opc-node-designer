# Rules for changing tick frequency

When the tick frequency is changed the following conditions must be fulfilled:

- is in the supported range
- new tick frequency is less than the duration
- all transition points align with the new ticks defined by the new frequency

The absolute coordinates of the transition points remain unchanged. For example, with a tick frequency of 20ms and transition points at 40ms, 100ms, and 120ms, changing the tick frequency to 10ms will not alter the positions of these transition points.
