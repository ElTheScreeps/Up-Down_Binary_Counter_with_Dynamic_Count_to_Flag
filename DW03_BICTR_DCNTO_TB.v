module DW03_BICTR_DCNTO_TB();

parameter width = 4;

reg 	         clk;
reg 	         rst;
reg 	         load;
reg 	         cen;
reg 	         up_dn;
reg  [width-1:0] count_to;
reg  [width-1:0] data;

wire 	         tercnt;
wire [width-1:0] count;

always #5 clk <= ~clk;

initial begin
clk   	 = 0;
rst 	 = 1;
load  	 = 1;
cen   	 = 0;
up_dn 	 = 1;
data 	 = 4'b1010;
count_to = 4'b0100;
repeat(1) @(posedge clk);
rst 	 = 0;
repeat(1) @(posedge clk);
rst 	 = 1;
load  	 = 0;
repeat(5) @(posedge clk);
cen   	 = 1;
load     = 1;
repeat(15) @(posedge clk);
up_dn    = 0;
repeat(15) @(posedge clk);
up_dn    = 1;
load     = 0;
repeat(15) @(posedge clk);
end

DW03_bictr_dcnto #(width) T (.clk, .rst, .load, .cen, .up_dn, .data, .count_to, .count, .tercnt);

endmodule
