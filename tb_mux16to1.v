`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 03:05:04 PM
// Design Name: 
// Module Name: tb_mux16to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_mux16to1;

reg [15:0] D;
reg [3:0] S;
wire Y;

mux16to1 uut(D, S, Y);

integer i;

initial begin

    D = 16'b1010101010101010;

    for(i = 0; i < 16; i = i + 1) begin
        S = i;
        #10;
        $display("S = %b, Y = %b", S, Y);
    end

    D = 16'b1100110011001100;

    for(i = 0; i < 16; i = i + 1) begin
        S = i;
        #10;
        $display("S = %b, Y = %b", S, Y);
    end

    $finish;

end

endmodule
