module half_adder (
	input wire a,
	input wire b,
	output wire s,
	output wire co	
);
	assign s = a ^ b;
	assign co = a & b;

endmodule
