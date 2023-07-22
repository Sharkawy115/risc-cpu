module controller (
  input wire [2:0] opcode,
  input wire [2:0] phase,
  input wire zero, // accumulator is zero
  output reg sel, // select instruction address to memory
  output reg rd, // enable memory output onto data bus
  output reg ld_ir, // load instruction register
  output reg inc_pc, // increment program counter
  output reg halt, // halt machine
  output reg ld_pc, // load program counter
  output reg data_e, // enable accumulator output onto data bus
  output reg ld_ac, // load accumulator from data bus
  output reg wr // write data bus to memory
);

  localparam integer HLT = 3'b000, SKZ = 3'b001, ADD = 3'b010, AND = 3'b011, XOR = 3'b100, LDA = 3'b101, STO = 3'b110, JMP = 3'b111;

  reg H, A, Z, J, S;

  always @* begin
    H = (opcode == HLT);
    A = (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA);
    Z = (opcode == SKZ && zero);
    J = (opcode == JMP);
    S = (opcode == STO);

    case (phase)
      3'b000: begin sel = 1; rd = 0; ld_ir = 0; inc_pc = 0; halt = 0; ld_pc = 0; data_e = 0; ld_ac = 0; wr = 0; end
      3'b001: begin sel = 1; rd = 1; ld_ir = 0; inc_pc = 0; halt = 0; ld_pc = 0; data_e = 0; ld_ac = 0; wr = 0; end
      3'b010: begin sel = 1; rd = 1; ld_ir = 1; inc_pc = 0; halt = 0; ld_pc = 0; data_e = 0; ld_ac = 0; wr = 0; end
      3'b011: begin sel = 1; rd = 1; ld_ir = 1; inc_pc = 0; halt = 0; ld_pc = 0; data_e = 0; ld_ac = 0; wr = 0; end
      3'b100: begin sel = 0; rd = 0; ld_ir = 0; inc_pc = 1; halt = H; ld_pc = 0; data_e = 0; ld_ac = 0; wr = 0; end
      3'b101: begin sel = 0; rd = A; ld_ir = 0; inc_pc = 0; halt = 0; ld_pc = 0; data_e = 0; ld_ac = 0; wr = 0; end
      3'b110: begin sel = 0; rd = A; ld_ir = 0; inc_pc = Z; halt = 0; ld_pc = J; data_e = S; ld_ac = 0; wr = 0; end
      3'b111: begin sel = 0; rd = A; ld_ir = 0; inc_pc = 0; halt = 0; ld_pc = J; data_e = S; ld_ac = A; wr = S; end
    endcase
  end
endmodule
