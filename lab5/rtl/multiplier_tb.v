`timescale 1ns / 1ps

module multiplier_tb(
    input wire clk,
    input wire rst,
    input wire a_en,
    input wire b_en,
    input wire[3: 0] data,
    output wire[7: 0] z
);

reg[3: 0] a, b;

multiplier multiplier_ins(
	a, b, z
);

always@(posedge clk) begin
    if (rst) begin
        a <= 0;
        b <= 0;
    end
    if (a_en) a <= data;
    if (b_en) b <= data;
end

endmodule
