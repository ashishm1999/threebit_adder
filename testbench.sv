`timescale 1ns/1ns
module threebittb();
	reg [2:0] a = 3'd0;
	reg [2:0] b = 3'd0;
	wire [2:0]sum;
	wire cout;
	
  threebit thrbit(.a(a), .b(b), .s(sum), .cout(cout));

  initial begin
		$dumpfile("dump.vcd");
		$dumpvars(1,threebittb);
		a=6;
		b=1;
		#10
		$display("a = %d, b = %d, sum = %d, cout = %d",a,b,sum,cout);
    a=2;
    b=3;
    #10
    $display("a = %d, b = %d, sum = %d, cout = %d",a,b,sum,cout);
    a=5;
    b=4;
    #10
    $display("a = %d, b = %d, sum = %d, cout = %d",a,b,sum,cout);
    $finish;
	end
endmodule
