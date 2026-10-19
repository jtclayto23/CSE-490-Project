`timescale 1ns / 1ps

module xor_gate(
    input wire [15:0] a,
    input wire [15:0] b,
    output wire [15:0] out
    );
    
    assign out = a ^ b;
endmodule
