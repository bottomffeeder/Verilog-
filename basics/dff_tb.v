`timescale 1ns/1ps

module dff_tb;
reg clk, rst, d;
wire q;

dff uut (
	.clk(clk),
	.rst(rst),
	.d(d),
	.q(q)
);

initial begin
	$dumpfile("dff.vcd");
	$dumpvars(0, dff_tb);
end

initial clk = 0;
always #10 clk = ~clk;

initial begin 
	rst = 1; d = 0;
	#25;
	rst = 0;

	d = 1; #20;
	d = 0; #20;
	d = 1; #20;
	d = 1; #20;
	d = 0; #20;

	$finish;
	
end

initial begin
	$monitor ("time = %0t | clk = %b rst = %b d = %b | q = %b",
		$time, clk, rst, d, q);
end

endmodule
