module full_adder (
	input wire a,
	input wire b,
	input wire ci,
	output wire s,
	output wire co
);
	wire co1, co0, s0;
	half_adder ha_ins0 (
		a, b, s0, co0
	);
	half_adder ha_ins1 (
		ci, s0, s, co1
	);
	assign co = co1 | co0;

endmodule
