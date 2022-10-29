Up/Down inary counter with dynamic count to flag

![image](https://user-images.githubusercontent.com/115155585/197960945-d305a25e-e109-4e43-aec7-924c38f893eb.png)


Description:
- DW03_bictr_dcnto is a general-purpose up/ down counter with dynamic count-to logic.
- When the count value equals the value on the count_to pin, the signal tercnt (terminal count) is asserted (HIGH). tercnt can be connected to load through an inversion to synchronously reset the counter to a predefined value on the input pin of the data bus, data.
- The counter is width bits wide and has 2width states from “000...0” to “111...1”. The counter is clocked on the positive edge of clk.
- reset, active low, provides for an asynchronous reset of the counter to “000...0”. If the reset pin is connected to ‘1’, then the reset logic is not synthesized, resulting in a smaller and faster counter
- count_to is an input bus that ranges from 0 to width-1. When the counter output, count, equals count_to, tercnt goes HIGH for one clock cycle.
- The up_dn input controls whether the counter counts up (up_dn is HIGH) or down (up_dn is LOW), starting on the next positive edge of clk.
- The counter is loaded with data by asserting load (LOW) and applying data to data. The data load operation is synchronous with respect to the positive edge of clk.
- The count enable pin, cen, is active high. When cen is HIGH, the counter is active. When cen is LOW, the counter is disabled, and count remains at the same value

Table 1 - pin description:

![image](https://user-images.githubusercontent.com/115155585/197960040-59b63932-5d9f-4044-bdda-b61886a9ca05.png)

Table 2 - counter operation truth table:

![image](https://user-images.githubusercontent.com/115155585/197960113-09c1e882-f010-4d67-aa78-4653ff9c3475.png)

How to use this files:

1. Downlaod the files;
2. Put them in a directory;
3. Open Modelsim;
4. Change directory to the directory who contain the files;
5. Create a project and add the files;
6. Compile the files and start stimulate.
