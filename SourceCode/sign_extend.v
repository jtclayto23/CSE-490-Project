`timescale 1ns / 1ps

module imm_sign_extend(
    input wire [3:0] imm_input,
    input wire [15:0] out
    );
    
    assign out = $signed(imm_input); // pads with most significant bit; I.E sign extension
endmodule