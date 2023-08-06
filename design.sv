`timescale 1ns/1ns
module halfadder(
  input a, b,
  output reg sum, cout);
  always @ (*) begin
  sum = a ^ b;
  cout = a & b;
  end
endmodule

module fulladder(
  input a, b, c,
  output reg s, cout);
  always @ (*) begin
  s = a ^ (b ^ c);
  cout = (a & b) | (c & (a ^ b));
  end
endmodule

module threebit(
  input [2:0] a, b, 
  output reg [2:0] s, 
  output reg cout); 
  reg c0, c1;
  always @ (a, b) begin 
  halfadder ha1(.a(a[0]), .b(b[0]), .sum(s[0]), .cout(c0)); 		
  fulladder fa1(.a(a[1]), .b(b[1]), .ci(c0), .s(s[1]), .co(c1)); 	   
  fulladder fa2(.a(a[2]), .b(b[2]), .ci(c1), .s(s[2]), .co(cout)); 
  end 
endmodule
