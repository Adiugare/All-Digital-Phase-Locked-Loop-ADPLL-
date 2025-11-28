`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2025 15:06:39
// Design Name: Loop Filter
// Module Name: loop_filter
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


module loop_filter(
    input clk,
    input rst,
    input pd_in,
    output reg [31:0] ctrl_word
);

    reg signed [32:0] integrator;
    parameter signed [31:0] KP = 32'd1;
    parameter signed [31:0] KI = 32'd1;
    localparam [31:0] SEED = 32'hFFFF_FFFF;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            integrator <= 0;
            ctrl_word <= SEED;
        end else begin
            if (pd_in) integrator <= integrator + KI;
            else       integrator <= integrator - KI;

            if (pd_in) ctrl_word <= SEED + integrator + KP;
            else       ctrl_word <= SEED + integrator - KP;
        end
    end

endmodule


