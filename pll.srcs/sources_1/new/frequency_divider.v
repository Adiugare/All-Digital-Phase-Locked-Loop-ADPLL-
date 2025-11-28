`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2025 16:06:35
// Design Name: Frequency Divider
// Module Name: frequency_divider
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


module divider #(parameter N = 5)(
    input clk,
    input rst,
    output reg div_clk
);

    reg [$clog2(N+1)-1:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            div_clk <= 0;
        end else begin
            if (count == (N-1)) begin
                count <= 0;
                div_clk <= ~div_clk;
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule

