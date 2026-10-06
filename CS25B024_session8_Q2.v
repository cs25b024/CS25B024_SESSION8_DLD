`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 02:20:13 PM
// Design Name: 
// Module Name: CS25B024_session8_Q2
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


module demux1to4(
    input D,
    input S1,
    input S0,
    output Y0,
    output Y1,
    output Y2,
    output Y3
);

assign Y0 = D & ~S1 & ~S0;
assign Y1 = D & ~S1 & S0;
assign Y2 = D & S1 & ~S0;
assign Y3 = D & S1 & S0;

endmodule
