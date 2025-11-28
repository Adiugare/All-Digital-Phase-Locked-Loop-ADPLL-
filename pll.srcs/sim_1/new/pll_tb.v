`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2025 16:44:45
// Design Name: Testbench
// Module Name: pll_tb
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

`timescale 1ns/1ps

module digital_pll_tb;

    reg clk = 0;
    reg rst = 1;
    reg ref_clk = 0;
    wire dpll_clk;

    always #5  clk = ~clk;      // 100 MHz
    always #20 ref_clk = ~ref_clk;  // 25 MHz

    digital_pll DUT(
        .clk(clk),
        .rst(rst),
        .ref_clk(ref_clk),
        .dpll_clk(dpll_clk)
    );

    initial begin
        $dumpfile("pll.vcd");
        $dumpvars(0, digital_pll_tb);
        #100 rst = 0;
        #2000000 $finish;
    end

endmodule


