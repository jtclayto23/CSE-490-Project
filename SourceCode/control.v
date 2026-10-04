module control (
input wire [3:0] opcode,
input wire [3:0] func
);

output wire rt, // 1 if RT is left operand, 0 otherwise
output wire rs, // 1 if RS is left operand, 0 otherwise.

output wire [1:0] alu, // Operand for the ALU. 00: add, 01: sub, 10: sll, 11: and

// Write to register or memory
output wire reg_write,
output wire mem_write,
output wire mem_read, // read from memory

reg reg_write, mem_write, mem_read, rt, rs;
reg [1:0] alu;

always @(opcode, func) begin // Run every time there is a new opcode
    reg_write = 1'b0; mem_write = 1'b0; mem_read = 1'b0;
    rt = 1'b0; rs = 1'b0; alu = 2'b00;

    if (opcode == 4'b0000) begin // If R-type
        reg_write = 1'b1;
        case (func)
            4'b0000: begin alu=2'b00; rt=1'b0; rs=1'b1; end // ADD
            4'b0001: begin alu=2'b01; rt=1'b0; rs=1'b1; end // SUB
            4'b0010: begin alu=2'b10; rt=1'b1; rs=1'b0; end // SLL
            4'b0011: begin alu=2'b11; rt=1'b1; rs=1'b0; end // AND
        endcase
    end
    // TODO: Implement the other types
endmodule
