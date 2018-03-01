module Project1_top(
	input [1:0]KEY,
	input [9:0]SW,
	//input MAX10_CLK1_50,
	output [7:0]HEX0,
	output [7:0]HEX1,
	output [7:0]HEX2,
	output [7:0]HEX3,
	output [9:0]LEDR
	);
	
	// final
//	reg A;
//	reg B;
//	always @(posedge KEY[0]) 
//	begin 
//		A = ~A;
//	end 
//	
//	always @(posedge KEY[1])
//	begin 
//		B = ~B;
//	end
//	
//	wire [1:0]f;
//	
//	mux mode(A, B, f)
	
	
	// testing
	
	wire [3:0] X, Y; // adder and subtractor inputs
	wire [7:0] Z; // mult. and divider input
	wire [7:0] Vone, Vtwo, Vthree, Vfour; // 7 segment inputs
	wire over; // overflow for subtractor
	wire carryAdd, carrySub, carryMult, carryDiv; // carries for adder, mult, and divider
	
	
	assign X[3:0] = SW[3:0];
	assign Y[3:0] = SW[7:4];
	assign Z[7:0] = SW[7:0];
	
	wire c,d;
	
	//Adder myadd(X,Y,Vadd,carryAdd);
	//Subtractor mySubt(X,Y,Vsub,over);
	//Mult_2 multiplied(Z, Vmult, carryMult);
	//Div_2 divided(X,Z,carryDiv);
	
	AND log(X, Y, Vone[3:0]);
	
	//SevenSegment first(Vone[0], 0, HEX0);
	//SevenSegment second(Vone[1], 0, HEX1);
	//SevenSegment third(Vone[2], 0, HEX2);
	//SevenSegment second(Vone[3], 0, HEX4);


	
	reg o;
	always @(c)
	begin
		//assign carry=0;
		if (c == 1)
			begin
				//assign carry = 1;
				o = 1;
				//LEDR[9] = 1;
			end
		else
			begin
				//assign carry = 0;
				o = 0;
				//LEDR[9] = 0;
			end
	end
	
	assign LEDR[9] = o;
	
//	always @(posedge KEY[0])
//	begin 
//		LEDR[0] = 1;
//	end


endmodule 
