`timescale 1ns/1ps

module counter_tb;

reg clk, rst;

wire [3:0] count;
counter uut (
	.clk(clk),
	.rst(rst),
	.count(count)
);

initial begin
	$dumpfile("counter.vcd");
	$dumpvars(0, counter_tb);
end

initial clk = 0;

always #10 clk = ~clk;

initial begin

	rst = 1;
	#25;
	rst = 0;
	#400;
	$finish;
end

initial begin
$monitor("time = %t | clk = %b rssdt = %b | count = %d", $time, clk, rst, count);
end

endmodule

