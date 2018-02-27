module FullAdder(x, y, s, ci, co);
	input x, y, ci;
	output s, co;
	assign s=x^y^ci;
	assign co=x&y|x&ci|y&ci;
	
	
endmodule 

module Adder(
	input [3:0] x,
	input [3:0] y,
	output [3:0] s,
	output c
	);
	
	wire carry[4:0];
	assign carry[0] = 0;
	genvar i;
	generate
		for(i=0; i<4; i = i + 1)
		begin:addbit
			FullAdder fOne(x[i],y[i],s[i], carry[i], carry[i+1]);
		end
	endgenerate 
	assign c = carry[3];
endmodule 

//module subtractor(
//	input [3:0] A,
//	input [3:0] B,
//	output [3:0] out
//	);
//	
//	genvar i;
//	for(i=0; i<4; i=i+1)
//	begin:subbit
//		if (B[i]==0)
//		begin
//			B[i]=1;
//		end
//		else
//		begin
//			B[i]=0;
//		end
//	end
//	assign B = B+1;
//	FullAdder(A, B, out)
//endmodule
	
module mult_2(in, out, carry);
	input [7:0] in;
	output [7:0] out;
	output carry;
	
	wire [8:0] c;
	reg o;
	
	assign c = in << 1;
	
	always @(in)
	begin
		//assign carry=0;
		if (in[7] == 1)
			begin
				//assign carry = 1;
				o = 1;
			end
		else
			begin
				//assign carry = 0;
				o = 0;
			end
	end
	assign out = c;
	assign carry = o;
	
endmodule
	
module div_2(in, out, remain);
	input [7:0] in;
	output [7:0] out;
	output remain;
	
	wire [8:0] c;
	reg o;
	
	assign c = in >> 1;
	
	always @(in)
	begin
		if (in[0] == 1)
			begin
				o = 1;
			end
		else 
			begin 
				o = 0;
			end
	end
	assign out = c;
	assign remain = o;
endmodule
