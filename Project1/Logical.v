//module MasterLogical(
//	input [1:0] SW,
//	input [3:0] X,
//	input [3:0] Y,
//	input [7:0] Z,
//	output reg [7:0] outOne,
//	output reg [7:0] outTwo
//	);
//	
//	reg [3:0] o, p;
//	AND do(X,Y,o);
//	
//	always @(*) 
//	begin 
//		case(o)
//		begin 
//			4'b0000 : outOne[3:0] <= 8'b00000000;
//			4'b0001 : outOne[3:0] <= 8'b00000001;
//			4'b0010 : outOne[3:0] <= 8'b00000010;
//			4'b0011 : outOne[3:0] <= 8'b00000011;
//		end 
//		
//		case(p)
//		begin 
//			
//		end 
//	end 
//	
//	
//	
//	
//endmodule 

 module AND(
	input [3:0] X,
	input [3:0] Y,
	output [3:0] out
	);
	
	assign out = X & Y;
endmodule 

 module OR(
	input [3:0] X,
	input [3:0] Y,
	output [3:0] out
	);
	
	assign out = X | Y;
endmodule 

 module XOR(
	input [3:0] X,
	input [3:0] Y,
	output [3:0] out
	);
	
	assign out = X ^ Y;
endmodule 

 module NOT(
	input [7:0] Z,
	output [3:0] outOne,
	output [3:0] outTwo
	);
	
	assign out = ~Z;
endmodule 
