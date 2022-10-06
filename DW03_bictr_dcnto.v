module DW03_bictr_dcnto(data, up_dn, load, cen, clk, reset, count_to, count, tercnt);

parameter width = 8;

input  [3:0] data;
input 	     up_dn;
input 	     load;
input 	     cen;
input 	     clk;
input 	     reset;
input  [3:0] count_to;
output [3:0] count;
output 	     tercnt;

reg    [3:0] count_intern;

always @(posedge(clk) or negedge(reset))
begin
	if (~reset) count_intern <= 'b0;
	else if (cen == 0) count_intern <= count_intern;
	else if (cen == 1)
	begin
		if (up_dn) count_intern <= count_intern +1;
		else count_intern <= count_intern - 1;
	end
end
		
assign count = count_intern;

assign tercnt = (count_to == count_intern)? 1 : 0;

endmodule
