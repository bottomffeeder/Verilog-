module (
	input clk,
	input rst,
	input d,
	output reg q
);

always@(posedge clk or posedge rst)
	if (rst)
		q <= 0;
	else 
		q <= d;
	endmodule

