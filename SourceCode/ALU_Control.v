`timescale 1ns / 1ps

module ALU_Control(
    input wire [3:0] alu_input,
    input wire [1:0] alu_op,
    
    output reg [3:0] alu_output
    );
    
    always @(alu_op, alu_input) begin
        if (alu_op == 2'b00) begin // R-type
            alu_output = alu_input; // Set to func code
        end
         else if (alu_op == 2'b01) begin // I-type
            alu_output = 4'b0000; // Add. Immediates always require addition
         end
         else if (alu_op == 2'b11) begin // BEQ/BNE, requires subtraction
           alu_output = 4'b0001; // Sub
         end
         else begin
         alu_output = 4'b1111; // Debug code, this case will only trigger when ALU isn't needed (like on a JMP or any future instructions)
         end
    end
endmodule
