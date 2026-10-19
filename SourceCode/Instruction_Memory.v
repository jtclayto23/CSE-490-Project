`timescale 1ns / 1ps
module Instruction_Memory(
    input wire [5:0] read_addr,
    output wire [15:0] instruction
    );
    
    reg [15:0] instr_mem [0:63];
    
    assign instruction = instr_mem[read_addr];
endmodule
