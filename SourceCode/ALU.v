`timescale 1ns / 1ps


module ALU(
    input wire clk,
    input wire [15:0] data_a, // rt/rd or IMM
    input wire [15:0] data_b, // RS
    input wire [3:0] alu_ctrl,
    
    output wire [15:0] result,
    output wire zero
    );
    
    assign result = (alu_ctrl == 4'b0000) ? (data_a + data_b) :  // add
        (alu_ctrl == 4'b0001) ? (data_b - data_a) :  // sub
        (alu_ctrl == 4'b0010) ? (data_a << data_b) : // sll
        (alu_ctrl == 4'b0011) ? (data_a & data_b) : // and
        16'h0000; // default
    
    assign zero = (result == 16'h0000); // 1 if 0
endmodule
