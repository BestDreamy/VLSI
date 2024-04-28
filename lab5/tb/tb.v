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
#15
a_en = 1; b_en = 0; data = 1;
#5
a_en = 0; b_en = 1; data = 2;

#5
a_en = 1; b_en = 0; data = 1;
#5
a_en = 0; b_en = 1; data = 3;

#5
a_en = 1; b_en = 0; data = 1;
#5
a_en = 0; b_en = 1; data = 4;

#5
a_en = 1; b_en = 0; data = 1;
#5
a_en = 0; b_en = 1; data = 5;

#5
a_en = 1; b_en = 0; data = 1;
#5
a_en = 0; b_en = 1; data = 6;

#5
a_en = 1; b_en = 0; data = 1;
#5
a_en = 0; b_en = 1; data = 7;

#5
a_en = 1; b_en = 0; data = 1;
#5
a_en = 0; b_en = 1; data = 8;

#5
a_en = 1; b_en = 0; data = 1;
#5
a_en = 0; b_en = 1; data = 9;

#5
a_en = 1; b_en = 0; data = 2;
#5
a_en = 0; b_en = 1; data = 2;
$finish;
end

initial begin
	$sdf_annotate("./syn/dc/multiplier.sdf", multiplier_tb);
end

multiplier_tb multiplier_tb_ins(
	clk, rst, a_en, b_en, data, z
);
endmodule
