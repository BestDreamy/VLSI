module multiplier (
	input wire[3: 0] a,
	input wire[3: 0] b,
	output wire[7: 0] z
);
	wire[3: 0] co[2: 0], s[2: 0];

	assign z[0] = a[0] & b[0];
	assign z[7: 1] = {co[2][3], s[2][3], s[2][2], s[2][1], s[2][0], s[1][0], s[0][0]};

	half_adder ha_ins00 (
		a[0]&b[1], a[1]&b[0], s[0][0], co[0][0]	
	);
	full_adder fa_ins01 (
		a[2]&b[0], a[1]&b[1], co[0][0], s[0][1], co[0][1]
	);
	full_adder fa_ins02 (
		a[3]&b[0], a[2]&b[1], co[0][1], s[0][2], co[0][2]
	);
	half_adder ha_ins03 (
		a[3]&b[1], co[0][2], s[0][3], co[0][3]
	);

	half_adder ha_ins10 (
		s[0][1], a[0]&b[2], s[1][0], co[1][0]
	);
	full_adder fa_ins11 (
		s[0][2], a[1]&b[2], co[1][0], s[1][1], co[1][1]
	);
	full_adder fa_ins12 (
		s[0][3], a[2]&b[2], co[1][1], s[1][2], co[1][2]
	);
	full_adder fa_ins13 (
		co[0][3], a[3]&b[2], co[1][2], s[1][3], co[1][3]
	);

	half_adder ha_ins20 (
		s[1][1], a[0]&b[3], s[2][0], co[2][0]
	);
	full_adder fa_ins21 (
		s[1][2], a[1]&b[3], co[2][0], s[2][1], co[2][1]
	);
	full_adder fa_ins22 (
		s[1][3], a[2]&b[3], co[2][1], s[2][2], co[2][2]
	);
	full_adder fa_ins23 (
		co[1][3], a[3]&b[3], co[2][2], s[2][3], co[2][3]
	);
endmodule
