`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 02:19:55 PM
// Design Name: 
// Module Name: CS25B024_session8_Q1
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


module mux2to1(
    input D0,
    input D1,
    input S,
    output Y
);
assign Y = S ? D1 : D0;
endmodule



module mux4to1(
    input [3:0] D,
    input [1:0] S,
    output Y
);

wire Y0, Y1;

mux2to1 m1(D[0], D[1], S[0], Y0);
mux2to1 m2(D[2], D[3], S[0], Y1);
mux2to1 m3(Y0, Y1, S[1], Y);

endmodule




module mux16to1(
    input [15:0] D,
    input [3:0] S,
    output Y
);

wire Y0, Y1, Y2, Y3;

mux4to1 m1(D[3:0],   S[1:0], Y0);
mux4to1 m2(D[7:4],   S[1:0], Y1);
mux4to1 m3(D[11:8],  S[1:0], Y2);
mux4to1 m4(D[15:12], S[1:0], Y3);

mux4to1 m5({Y3,Y2,Y1,Y0}, S[3:2], Y);

endmodule
