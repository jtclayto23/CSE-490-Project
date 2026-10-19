`timescale 1ns / 1ps

module And(
    input wire [15:0] data_a,
    input wire [15:0] data_b,
    
    output wire out
    );
    
    assign out = (data_a & data_b) ? 1 : 0;
endmodule
