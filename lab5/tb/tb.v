module tb;

initial begin
	$fsdbDumpfile("sim.fsdb");
	$fsdbDumpvars();
end

reg clk, rst, a_en, b_en;
reg[3: 0] data;
wire[7: 0] z;

always #2 clk = ~clk;

initial begin
clk = 0;
rst = 1;
#15
rst = 0;
end

initial begin
end

initial begin
	$sdf_annotate("./syn/post/multiplier.sdf", multiplier);
end

multiplier_tb multiplier_tb_ins(
	clk, rst, a_en, b_en, data, z
);
endmodule
