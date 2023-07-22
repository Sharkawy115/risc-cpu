module counter 
  #( 
  
  parameter integer WIDTH = 5
  )
  (
  input wire [4:0] cnt_in,
  input wire enab,
  input wire clk,
  input wire load,
  input wire rst,
  output reg cnt_out
  );
  
  always @(posedge clk)
  if (rst)
    cnt_out=0;
    
  else if (load) cnt_out = cnt_in;
  else if ( enab) cnt_out = cnt_out +1;
    
endmodule