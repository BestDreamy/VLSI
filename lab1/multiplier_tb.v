`timescale 1ns / 1ps

module multiplier_tb();

reg[3: 0] a, b;
wire[7: 0] z;

multiplier multiplier_ins(
	a, b, z
);

initial begin
	$fsdbDumpfile("sim.fsdb");
	$fsdbDumpvars();
end

initial begin
	a = 4'b0001;
	b = 4'b1111;
#10
	a = 4'b0010;
	b = 4'b0010;
#10
	a = 4'b0010;
	b = 4'b0110;
#10
	a = 4'b0010;
	b = 4'b0111;
#10
	a = 4'b0110;
	b = 4'b0010;
#10
	a = 4'b0110;
	b = 4'b0110;
#10
	a = 4'b0110;
	b = 4'b1110;
#10
	a = 4'b0100;
	b = 4'b0010;
#10
	a = 4'b0100;
	b = 4'b0110;
#10
	a = 4'b0100;
	b = 4'b0001;
#10
	a = 4'b0100;
	b = 4'b0011;
end
endmodule
