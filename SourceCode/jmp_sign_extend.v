`timescale 1ns / 1ps

module jmp_sign_extend(
    input wire [12:0] inpt,
    output wire [15:0] out
    );
    
    assign out = $signed(inpt);
endmodule
