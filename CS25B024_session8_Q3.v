`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 02:20:34 PM
// Design Name: 
// Module Name: CS25B024_session8_Q3
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


module railway_controller(
    input E,
    input W,
    input P1_BUSY,
    input P2_BUSY,
    input P3_BUSY,
    input PRI,

    output reg E_GREEN,
    output reg E_RED,
    output reg W_GREEN,
    output reg W_RED,

    output reg E_P1,
    output reg E_P2,
    output reg E_P3,

    output reg W_P1,
    output reg W_P2,
    output reg W_P3,

    output P1_FREE,
    output P2_FREE,
    output P3_FREE,

    output P1_BUSY_LED,
    output P2_BUSY_LED,
    output P3_BUSY_LED
);

assign P1_FREE = ~P1_BUSY;
assign P2_FREE = ~P2_BUSY;
assign P3_FREE = ~P3_BUSY;

assign P1_BUSY_LED = P1_BUSY;
assign P2_BUSY_LED = P2_BUSY;
assign P3_BUSY_LED = P3_BUSY;

always @(*) begin

    E_GREEN = 0;
    E_RED = 1;
    W_GREEN = 0;
    W_RED = 1;

    E_P1 = 0;
    E_P2 = 0;
    E_P3 = 0;

    W_P1 = 0;
    W_P2 = 0;
    W_P3 = 0;

    if(E == 1 && W == 0) begin

        if(P1_BUSY == 0) begin
            E_GREEN = 1;
            E_RED = 0;
            E_P1 = 1;
        end
        

        else if(P2_BUSY == 0) begin
            E_GREEN = 1;
            E_RED = 0;
            E_P2 = 1;
        end

        else if(P3_BUSY == 0) begin
            E_GREEN = 1;
            E_RED = 0;
            E_P3 = 1;
        end

    end

    else if(E == 0 && W == 1) begin

        if(P1_BUSY == 0) begin
            W_GREEN = 1;
            W_RED = 0;
            W_P1 = 1;
        end

        else if(P2_BUSY == 0) begin
            W_GREEN = 1;
            W_RED = 0;
            W_P2 = 1;
        end

        else if(P3_BUSY == 0) begin
            W_GREEN = 1;
            W_RED = 0;
            W_P3 = 1;
        end

    end
    

    else if(E == 1 && W == 1) begin

        if(P1_BUSY + P2_BUSY + P3_BUSY == 1) begin

            if(PRI == 0) begin

                if(P1_BUSY == 0) begin
                    E_GREEN = 1;
                    E_RED = 0;
                    E_P1 = 1;
                end

                else if(P2_BUSY == 0) begin
                    E_GREEN = 1;
                    E_RED = 0;
                    E_P2 = 1;
                end

                else begin
                    E_GREEN = 1;
                    E_RED = 0;
                    E_P3 = 1;
                end

            end

            else begin

                if(P1_BUSY == 0) begin
                    W_GREEN = 1;
                    W_RED = 0;
                    W_P1 = 1;
                end

                else if(P2_BUSY == 0) begin
                    W_GREEN = 1;
                    W_RED = 0;
                    W_P2 = 1;
                end

                else begin
                    W_GREEN = 1;
                    W_RED = 0;
                    W_P3 = 1;
                end

            end

        end

        else if(P1_BUSY + P2_BUSY + P3_BUSY <= 1) begin

            if(P1_BUSY == 0) begin
                E_GREEN = 1;
                E_RED = 0;
                E_P1 = 1;

                if(P2_BUSY == 0) begin
                    W_GREEN = 1;
                    W_RED = 0;
                    W_P2 = 1;
                end
                else begin
                    W_GREEN = 1;
                    W_RED = 0;
                    W_P3 = 1;
                end
            end

            else begin
                E_GREEN = 1;
                E_RED = 0;
                E_P2 = 1;

                W_GREEN = 1;
                W_RED = 0;
                W_P3 = 1;
            end

        end

    end

end

endmodule
