`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 03:05:42 PM
// Design Name: 
// Module Name: tb_railway_controller
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


module tb_railway_controller;

reg E;
reg W;
reg P1_BUSY;
reg P2_BUSY;
reg P3_BUSY;
reg PRI;


wire E_GREEN;
wire E_RED;
wire W_GREEN;
wire W_RED;


wire E_P1;
wire E_P2;
wire E_P3;


wire W_P1;
wire W_P2;
wire W_P3;


wire P1_FREE;
wire P2_FREE;
wire P3_FREE;


wire P1_BUSY_LED;
wire P2_BUSY_LED;
wire P3_BUSY_LED;

railway_controller uut(
    E, W,
    P1_BUSY, P2_BUSY, P3_BUSY,
    PRI,
    E_GREEN, E_RED,
    W_GREEN, W_RED,
    E_P1, E_P2, E_P3,
    W_P1, W_P2, W_P3,
    P1_FREE, P2_FREE, P3_FREE,
    P1_BUSY_LED, P2_BUSY_LED, P3_BUSY_LED
);

initial begin

    E = 0;
    W = 0;
    P1_BUSY = 0;
    P2_BUSY = 0;
    P3_BUSY = 0;
    PRI = 0;
    #10;

    E = 1;
    W = 0;
    P1_BUSY = 0;
    P2_BUSY = 0;
    P3_BUSY = 0;
    #10;

    E = 0;
    W = 1;
    #10;

    E = 1;
    W = 0;
    P1_BUSY = 1;
    P2_BUSY = 0;
    P3_BUSY = 0;
    #10;

    E = 0;
    W = 1;
    P1_BUSY = 1;
    P2_BUSY = 1;
    P3_BUSY = 0;
    #10;

    E = 1;
    W = 1;
    P1_BUSY = 1;
    P2_BUSY = 1;
    P3_BUSY = 0;
    PRI = 0;
    #10;

    E = 1;
    W = 1;
    P1_BUSY = 1;
    P2_BUSY = 1;
    P3_BUSY = 0;
    PRI = 1;
    #10;

    E = 1;
    W = 1;
    P1_BUSY = 0;
    P2_BUSY = 0;
    P3_BUSY = 1;
    #10;

    E = 1;
    W = 1;
    P1_BUSY = 1;
    P2_BUSY = 0;
    P3_BUSY = 0;
    #10;

    E = 1;
    W = 1;
    P1_BUSY = 1;
    P2_BUSY = 1;
    P3_BUSY = 1;
    #10;

    $finish;

end

endmodule
