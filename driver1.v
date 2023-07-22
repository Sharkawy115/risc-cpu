module driver #(
  input wire [7:0] data_in,
  input wire data_en,
  output wire [7:0] data_out
  );
  always @* 
begin
  if (data_en == 1)
  data_out = data_in ;
  else
  data_out = 8'bz;
end 
endmodule


