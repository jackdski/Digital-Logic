//module Master C


module Equalmod(
	input [3:0] x,
	input [3:0] y,
	//output [3:0] out
	output out
	);
	
	reg equal;
	
	always @(x | y)
	begin
		if (x==y)
		begin
			equal =1;
		end
		else 
		begin
			equal =0;
		end
	end
	//assign out[0]=equal;
	assign out = equal;
endmodule 



module GreaterMod(
	input [3:0] x,
	input [3:0] y,
	output [3:0] out
	);
	
	reg equal;
	always @(x or y)
	begin
		if (x>y)
		begin
			equal = 1;
		end
		else 
		begin
			equal = 0;
		end
	end
	assign out[0]=equal;
endmodule 

module LessThanMod(
	input [3:0] x,
	input [3:0] y,
	output [3:0] out
	);
	
	reg equal;
	always @(x | y)
	begin
		if (x<y)
		begin
			equal =1;
		end
		else 
		begin
			equal =0;
		end
	end
	assign out[0]=equal;
endmodule 



module MaxMod(
	input [3:0] x,
	input [3:0] y,
	output reg [3:0] out
	//output out
	);
	//reg [3:0] truth;
	reg truth;
	//wire [3:0] equal;
	//reg [3:0] equal;
	reg equal;
	
	always @(*)
	begin
		case(x)
//			4'b0000 : assign truth = y[3] | y[2] | y[1] | y[0];
//			4'b0001 : assign truth = y[3] | y[2] | y[1];
//			4'b0010 : assign truth = y[3] | y[2] | (y[1]&y[0]);
//			4'b0011 : assign truth = y[3] | y[2];
//			4'b0100 : assign truth = y[3] | (y[2]&y[1]) | (y[2]&y[0]);
//			4'b0101 : assign truth = y[3] | (y[2]&y[1]);
//			4'b0110 : assign truth = y[3] | (y[2]&y[1]&y[0]);
//			4'b0111 : assign truth = y[3];
//			4'b1000 : assign truth = (y[3] & y[2]) | (y[3]&y[1]) | (y[3]&y[0]);
//			4'b1001 : assign truth = (y[3] & y[2]) | (y[3]&y[1]);
//			4'b1010 : assign truth = (y[3] & y[2]) | (y[3]&y[1]&y[0]);
//			4'b1011 : assign truth = (y[3] & y[2]);
//			4'b1100 : assign truth = (y[3] & y[2] & y[0]) | (y[3]&y[2]&y[1]);
//			4'b1101 : assign truth = (y[3] & y[2] & y[1]);
//			4'b1110 : assign truth = (y[3] & y[2] & y[1] & y[0]);
//			4'b1111 : assign truth = 0;


			4'b0000 : truth <= y[3] | y[2] | y[1] | y[0];
			4'b0001 : truth <= y[3] | y[2] | y[1];
			4'b0010 : truth <= y[3] | y[2] | (y[1]&y[0]);
			4'b0011 : truth <= y[3] | y[2];
			4'b0100 : truth <= y[3] | (y[2]&y[1]) | (y[2]&y[0]);
			4'b0101 : truth <= y[3] | (y[2]&y[1]);
			4'b0110 : truth <= y[3] | (y[2]&y[1]&y[0]);
			4'b0111 : truth <= y[3];
			4'b1000 : truth <= (y[3] & y[2]) | (y[3]&y[1]) | (y[3]&y[0]);
			4'b1001 : truth <= (y[3] & y[2]) | (y[3]&y[1]);
			4'b1010 : truth <= (y[3] & y[2]) | (y[3]&y[1]&y[0]);
			4'b1011 : truth <= (y[3] & y[2]);
			4'b1100 : truth <= (y[3] & y[2] & y[0]) | (y[3]&y[2]&y[1]);
			4'b1101 : truth <= (y[3] & y[2] & y[1]);
			4'b1110 : truth <= (y[3] & y[2] & y[1] & y[0]);
			4'b1111 : truth <= 0;
		endcase
	//end 
	
	//Equal (x,y, equal);
		
//	if(equal == 1)
//		begin
//			//assign out[0]=0;
//			//assign out = 0;
//			out = 4'b0000;
//		end	
//	else if (truth == 1)
//		begin
//			assign out = y;
//		end	
//	else
//		begin
//			assign out = x;
//		end
//	end
	
	if(truth == 1)
		begin 
			out = y;
		end
	else if(truth == 0)
		begin
			out = x;
		end
	else
		begin 
			out = 0;
		end 
end
endmodule 
