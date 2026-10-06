`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 03:02:18 PM
// Design Name: 
// Module Name: tb_demux1to4
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


module tb_demux1to4;

reg D;
reg S1;
reg S0;

wire Y0;
wire Y1;
wire Y2;
wire Y3;

demux1to4 uut(D, S1, S0, Y0, Y1, Y2, Y3);

integer i;

initial begin

    D = 0;

    for(i = 0; i < 4; i = i + 1) begin
        {S1,S0} = i;
        #10;
        $display("D=%b S1S0=%b Y=%b%b%b%b",
                 D, {S1,S0}, Y3,Y2,Y1,Y0);
    end

    D = 1;

    for(i = 0; i < 4; i = i + 1) begin
        {S1,S0} = i;
        #10;
        $display("D=%b S1S0=%b Y=%b%b%b%b",
                 D, {S1,S0}, Y3,Y2,Y1,Y0);
    end

    $finish;

end
endmodule
