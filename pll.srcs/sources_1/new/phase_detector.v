`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2025 23:58:20
// Design Name: Phase Detector
// Module Name: phase_detector
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

module phase_detector(
    input clk,
    input ref_clk,
    input fb_clk,
    output reg pd_out
);

    reg ref_d1, fb_d1;

    always @(posedge clk) begin
        ref_d1 <= ref_clk;
        fb_d1  <= fb_clk;
        pd_out <= ref_d1 ^ fb_d1;
    end

endmodule
