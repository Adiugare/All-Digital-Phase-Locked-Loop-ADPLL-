`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2025 15:39:42
// Design Name: DCO
// Module Name: digital_controlled_oscillator
// Project Name: Phase Lock Loop
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


module dco(
    input clk,
    input rst,
    input [31:0] ctrl_word,
    output reg dco_clk
);

    reg [31:0] phase_acc;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            phase_acc <= 0;
            dco_clk <= 0;
        end else begin
            phase_acc <= phase_acc + ctrl_word;
            dco_clk <= phase_acc[31];
        end
    end

endmodule


