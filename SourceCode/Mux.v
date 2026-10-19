`timescale 1ns / 1ps

// 2-1 MUX

module Mux(
    input wire [15:0] data_a,
    input wire [15:0] data_b,
    
    input wire signal,
    
    output wire [15:0] out
    );
    
    assign out = (signal) ? (data_a) : (data_b);
    
endmodule
