module top();

reg 	   clk;
reg 	   reset;
reg 	   load;
reg 	   cen;
reg 	   up_dn;
reg  [3:0] count_to;
reg  [3:0] data;

wire 	   tercnt;
wire [3:0] count;

always #5 clk <= ~clk;

initial begin
clk   	 = 0;
reset 	 = 1;
load  	 = 1;
cen   	 = 0;
up_dn 	 = 1;
data 	 = 0;
count_to = 4'b0100;
repeat(1) @(posedge clk);
reset 	 = 0;
repeat(1) @(posedge clk);
reset 	 = 1;
load  	 = 0;
repeat(3) @(posedge clk);
reset 	 = 1;
load  	 = 1;
repeat(2) @(posedge clk);
cen   	 = 1;
repeat(15) @(posedge clk);
end

DW03_bictr_dcnto #(8) U1 (.data(data), .count_to(count_to), .up_dn(up_dn), .load(load), .cen(cen), .clk(clk), .reset(reset), .count(count), .tercnt(tercnt));

endmodule