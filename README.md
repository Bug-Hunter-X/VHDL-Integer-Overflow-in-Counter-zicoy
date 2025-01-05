# VHDL Integer Overflow Bug

This repository demonstrates a common error in VHDL: integer overflow in a counter.  The `buggy_counter.vhd` file contains a counter that uses a standard integer type. When the counter reaches its maximum value, it can cause an unexpected wrap around or other unforeseen issues depending on the synthesis tool.  The `fixed_counter.vhd` file provides a corrected version that uses `unsigned` to prevent integer overflow and clarifies the potential issues that could arise.

## How to reproduce the bug
1. Simulate `buggy_counter.vhd` using a VHDL simulator.
2. Observe that when the counter reaches 15 it wraps back to 0 without explicitly being reset.

## Solution
The solution is to use an unsigned type instead of an integer, providing clear control over the potential value range and avoiding integer overflow. The corrected code is in `fixed_counter.vhd`. Note that the choice of unsigned type could depend on your project's requirements, you could use other types like std_logic_vector too but these need careful considerations during the assignment to prevent implicit type conversion and potential errors.

##  Learning points
- Always be mindful of data type ranges in VHDL, especially when dealing with counters or other variables that increment/decrement values.
- Prefer unsigned types for counters to prevent overflow and ensure predictable behaviour.