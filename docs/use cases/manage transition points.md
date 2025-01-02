# Manage transition points

## For Boolean nodes

A transition point can be added at any position within the duration range, provided it aligns with the ticks (defined by the frequency). When a new transition point is added, all subsequent transition edges are flipped — rising edges become falling edges and vice versa. The same effect occurs when a transition point is removed.

## For Numeric nodes

A transition point can be added at any position within the duration range, provided it aligns with the ticks (defined by the frequency). The value for a transition point must be provided, it defaults to 0. When adding a point by clicking the plot, the value is computed from the position of the cursor.
