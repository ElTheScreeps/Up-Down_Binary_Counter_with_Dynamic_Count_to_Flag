# Up/Down inary counter with dynamic count to flag

![DW03_BICTR_DCNTO](https://github.com/ElTheScreeps/Up-Down_Binary_Counter_with_Dynamic_Count_to_Flag/assets/115155585/47408a9d-0ae3-418a-ae82-fe82d4fbed65)

Description:
- DW03_bictr_dcnto is a general-purpose up/down counter with dynamic count-to logic.
- When the count value equals the value on the count_to pin, the signal tercnt (terminal count) is asserted (HIGH). tercnt can be connected to load through an inversion to synchronously reset the counter to a predefined value on the input pin of the data bus, data.
- The counter is width bits wide and has 2width states from “000...0” to “111...1”. The counter is clocked on the positive edge of clk.
- reset, active low, provides for an asynchronous reset of the counter to “000...0”. If the reset pin is connected to ‘1’, then the reset logic is not synthesized, resulting in a smaller and faster counter
- count_to is an input bus that ranges from 0 to width-1. When the counter output, count, equals count_to, tercnt goes HIGH for one clock cycle.
- The up_dn input controls whether the counter counts up (up_dn is HIGH) or down (up_dn is LOW), starting on the next positive edge of clk.
- The counter is loaded with data by asserting load (LOW) and applying data to data. The data load operation is synchronous with respect to the positive edge of clk.
- The count enable pin, cen, is active high. When cen is HIGH, the counter is active. When cen is LOW, the counter is disabled, and count remains at the same value

Table 1 - pin description:

| Pin Name  | Size     | Type   | Function                         |
|   :---:   |  :---:   |  :---: |     :---:                        |
| data      | width    | Input  | Counter load input               |
| count_to  | width    | Input  | Count compare input              |
| up_dn     | 1        | Input  | High for count up, low for count down |
| load      | 1        | Input  | Enable data load to counter, active low |
| cen       | 1        | Input  | Count enable, active high        |
| clk       | 1        | Input  | Clock                            |
| reset     | 1        | Input  | Counter reset, active low        |
| count     | width    | Output | Output count bus                 |
| tercnt    | 1        | Output | Terminal count flag, active high |


Table 2 - counter operation truth table:

| reset | load | cen | up_dn | Operation |
| :---: |:---: |:---:| :---: |   :---:   |
| 0     | X    | X   | X     | Reset     |
| 1     | 0    | X   | X     | Load      |
| 1     | 1    | 0   | X     | Standby   |
| 1     | 1    | 1   | 0     | Count down|
| 1     | 1    | 1   | 1     | Count up  |


How to use this files:

1. Downlaod the files;
2. Put them in a directory;
3. Open Modelsim;
4. Change directory to the directory who contain the files;
5. Create a project and add the files;
6. Compile the files and start stimulate.
