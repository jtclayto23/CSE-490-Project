`timescale 1ns / 1ps

module control (
input wire [3:0] opcode,

output reg [1:0] alu_op,

// Write to register or memory
output reg reg_write,
output reg mem_write,
output reg mem_read,
output reg ALUSrc, // 1 for imm, 0 for register
output reg branch,
output reg mem_to_reg,
output reg bne,
output reg jmp
);

always @(opcode) begin // Run every time there is a new opcode
    reg_write = 1'b0;
    mem_write = 1'b0; 
    mem_read = 1'b0; 
    alu_op = 2'b00; // 00 for r-type, 01 for i-type, 10 for J-type. 11 for branch (special case, requires subtraction)
    ALUSrc = 1'b0; 
    branch = 1'b0; 
    mem_to_reg = 1'b0; 
    bne = 1'b0; 
    jmp = 1'b0; 

    if (opcode == 4'b0000) begin // If R-type
        reg_write = 1'b1;
        // don't change alu_op
    end
    
    else if (opcode == 4'b0001) begin // lw
        reg_write = 1'b1;
        mem_read = 1'b1;
        mem_to_reg = 1'b1;
        alu_op = 2'b01;
        ALUSrc = 1'b1; // uses imm
    end
    else if (opcode == 4'b0010) begin // sw
        mem_write = 1'b1;
        alu_op = 2'b01;
        ALUSrc = 1'b1; // uses imm
    end
    else if (opcode == 4'b0011) begin // addi
        alu_op = 2'b01;
        ALUSrc = 1'b1; // uses imm
        reg_write = 1'b1;
    end
    else if (opcode == 4'b0100) begin // beq
        alu_op = 2'b11;
        branch = 1'b1;
    end
    else if (opcode == 4'b0101) begin // bne
        alu_op = 2'b11;
        branch = 1'b1;
        bne = 1'b1;
    end
    else if (opcode == 4'b0110) begin // jmp
        alu_op = 2'b10;
        jmp = 1'b1;
    end
    end
endmodule
