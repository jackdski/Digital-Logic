module Project1_top(
	input [1:0]KEY,
	input [9:0]SW,
	input MAX10_CLK1_50,
	output [7:0] HEX0,
	//output HEX1[7:0],
	output [9:0]LEDR
	);
	
	wire [3:0] X, Y,Z;
	assign X[3:0] = SW[3:0];
	assign Y[3:0] = SW[7:4];
	
	
	wire c;
	
	//Adder myadd(X,Y,Z,c);
	//mult_2 multiplied(X,Z, c);
	div_2 divided(X,Z,c);
	SevenSegment seven(Z, HEX0);
	
//	always @(posedge KEY[0])
//	begin 
//		LEDR[0] = 1;
//	end


endmodule 
