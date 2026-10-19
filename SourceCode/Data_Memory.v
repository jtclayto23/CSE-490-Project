`timescale 1ns / 1ps

module Data_Memory(
    input wire clk,
    input wire mem_write,
    input wire mem_read,
    input wire [15:0] address, // 16-bit alu_output. Must be handled in two operations as memory is byte-addressable
    input wire [15:0] write_data,
    
    output wire [15:0] read_data
    );

    reg [7:0] mem [0:63];
    
    always @(posedge clk) begin
        if (mem_write) begin
            mem[address] <= write_data[7:0]; // least sigificant 8 bits
            mem[address + 1] <= write_data[15:8]; // most significant 8 bits
        end
    end
    
    assign read_data = (mem_read) ? ({mem[address+1], mem[address]}) : 16'hFFFF; // concat least and most sigificant 8 bits of memory at given address into one 16-bit read_data output. use FFFF as debug value
endmodule
