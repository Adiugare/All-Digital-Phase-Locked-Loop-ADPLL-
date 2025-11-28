`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2025 16:17:38
// Design Name: 
// Module Name: top_module
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


module digital_pll(
    input clk,
    input rst,
    input ref_clk,
    output dpll_clk
);

    wire fb_clk;
    wire pd_out;
    wire [31:0] ctrl_word;

    phase_detector PD(
        .clk(clk),
        .ref_clk(ref_clk),
        .fb_clk(fb_clk),
        .pd_out(pd_out)
    );

    loop_filter LF(
        .clk(clk),
        .rst(rst),
        .pd_in(pd_out),
        .ctrl_word(ctrl_word)
    );

    dco DCO(
        .clk(clk),
        .rst(rst),
        .ctrl_word(ctrl_word),
        .dco_clk(dpll_clk)
    );

    divider #(4) DIV(
        .clk(dpll_clk),
        .rst(rst),
        .div_clk(fb_clk)
    );

endmodule
