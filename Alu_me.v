module alu
#(
  parameter WIDTH=8
 )
 (
  input  wire [WIDTH-1:0] in_a,
  input wire [WIDTH-1:0] in_b,
  input wire [2:0] opcode,
  output reg [WIDTH-1:0] alu_out,
  output reg  [WIDTH-1:0] a_is_zero
  
 );
  always @* 
  begin 
    if (opcode == 000)
      alu_out = in_a;
    else if (opcode == 001)
    alu_out = in_a;
    else if (opcode == 010)
      alu_out = in_a + in_b;
      else if (opcode == 011)
        alu_out = in_a & in_b;
        else if (opcode == 100)
          alu_out = in_a ^ in_b;
          else if (opcode == 101)
            alu_out = in_b;
            else if (opcode == 110)
              alu_out = in_a;
              else if (opcode == 111)
                alu_out = in_a;
    end
endmodule

