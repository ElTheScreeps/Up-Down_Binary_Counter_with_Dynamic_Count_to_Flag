module DW03_BICTR_DCNTO(clk, rst, load, cen, up_dn, data, count_to, count, tercnt);

parameter width = 4;

input 	           clk;
input 	           rst;
input 	           load;
input 	           cen;
input 	           up_dn;
input  [width-1:0] data;
input  [width-1:0] count_to;
output [width-1:0] count;
output 	           tercnt;

reg    [width-1:0] count_intern;

always @(posedge(clk) or negedge(rst))
begin
	if (~rst) count_intern <= 'b0;
	else if (rst & load == 0) count_intern <= data;
	else if (cen == 0 & load == 1) count_intern <= count_intern;
	else if (cen == 1 & load == 1)
	begin
		if (up_dn) count_intern <= count_intern + 1;
		else count_intern <= count_intern - 1;
	end
end
		
assign count = count_intern;

assign tercnt = (count_to == count_intern)? 1 : 0;

endmodule
