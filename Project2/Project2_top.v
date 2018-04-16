module Project2_top(
	input [1:0] KEY,
	input [9:0] SW,
	input MAX10_CLK1_50,
	output [7:0]HEX0,
	output [7:0]HEX1,
	output [7:0]HEX2,
	output [7:0]HEX3,
	output [7:0]HEX4,
	output [7:0]HEX5,
	output [9:0]LEDR
	);
	
	parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101, G=3'b110, H=3'b111; // define states
	
	reg [2:0] CS; // holds current state
	reg [10:0] randtime;
	//reg enablelfsr;
	//reg enablecounter;
	//reg startSignal;
	//reg trigger;// Enables change of state
	
	reg [15:0] highscore = 16'b1111111111111111;
	
	wire [10:0] wrandtime;
	wire millisecond;
	wire [3:0] ones;
	wire [3:0] tens;
	wire [3:0] hundreds;
	wire [3:0] thousands;
	wire wenablecounter;
	//wire wenablelfsr;
	//wire wstartSignal;
	wire downcountenable;
	wire downcountload;
	wire finished;
	wire enablehiscore;
	wire ledenable;
	
	//wire [2:0] CSout;
	
//	initial
//	begin
//		enablelfsr=0;
//		enablecounter=1;
//		CS=A;
//		//trigger=0;
//	end

//	assign wenablecounter = enablecounter;
//	assign wenablelfsr = enablelfsr;
//	assign wstartSignal = startSignal;
//	assign CSout = CS;
	assign LEDR[0]=ledenable;
	assign wrandtime = randtime;
	
	//Clockdivider aa(MAX10_CLK1_50, millisecond);	
	stateMachine ff(KEY[0], KEY[1], SW[0], finished, wenablecounter, downcountenable, enablehiscore, ledenable);
	downcount ee(downcountenable, downcountload, randtime, millisecond, finished);
	bcdCounter(millisecond, wenablecounter, ones, tens, hundreds, thousands);
	lfsr a(MAX10_CLK1_50, wrandtime);
	bcdDecoder q((enablehiscore & SW[0]), ones, tens, hundreds, thousands, HEX0, HEX1, HEX2, HEX3);
	//SevenSegment bb(CS, HEX5);
//	SevenSegment bb(wenablecounter, HEX5);
//	SevenSegment cc(wenablelfsr, HEX4);
//	SevenSegment dd(CS, HEX0);


endmodule 
