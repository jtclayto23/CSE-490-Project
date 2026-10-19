`timescale 1ns / 1ps

module Add(
    input wire [15:0] data_a,
    input wire [15:0] data_b,
    output wire [15:0] out
    );
    
    assign out = data_a + data_b;
endmodule
