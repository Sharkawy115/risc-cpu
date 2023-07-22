module memory
#(
  parameter integer AWIDTH=5,
  parameter integer DWIDTH=8
 )
 (
  input  wire              clk  ,
  input  wire              wr   ,
  input  wire              rd   ,
  input  wire [AWIDTH-1:0] addr ,
  inout  wire [DWIDTH-1:0] data  
 );
 reg [DWIDTH-1:0] mem_1 [2**AWIDTH-1 : 0];
 reg [DWIDTH-1:0] temperoarydata;
  always @(posedge clk)
    if (wr)
      mem_1[addr] = data;
  assign data = rd? mem_1[addr] : 'bz;
endmodule

