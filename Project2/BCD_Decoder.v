module SevenSegment(value, disp);
input [3:0] value;
output reg [7:0] disp;

	always @(*)
	begin
		case(value)
			0 : disp [7:0] <= 8'b11000000;// 0 <= 7'h7E;
			1 : disp [7:0] <= 8'b11111001;// 1 <= 7'h60;
			2 : disp [7:0] <= 8'b10100100;// 2 <= 7'h6D;
			3 : disp [7:0] <= 8'b10110000;// 3 <= 7'h79;
			4 : disp [7:0] <= 8'b10011001;// 4 <= 7'h33;
			5 : disp [7:0] <= 8'b10010010;// 5 <= 7'h5B;
			6 : disp [7:0] <= 8'b10000010;// 6 <= 7'h5F;
			7 : disp [7:0] <= 8'b11111000;// 7 <= 7'h70;
			8 : disp [7:0] <= 8'b10000000;// 8 <= 7'h7F;
			9 : disp [7:0] <= 8'b10011000;// 9 <= 7'h7B;
		endcase
	end

endmodule

module SevenSegmentOnes(value, disp);
input [3:0] value;
output reg [7:0] disp;

	always @(*)
	begin
		case(value)
			0 : disp [7:0] <= 8'b01000000;// 0 <= 7'h7E;
			1 : disp [7:0] <= 8'b01111001;// 1 <= 7'h60;
			2 : disp [7:0] <= 8'b00100100;// 2 <= 7'h6D;
			3 : disp [7:0] <= 8'b00110000;// 3 <= 7'h79;
			4 : disp [7:0] <= 8'b00011001;// 4 <= 7'h33;
			5 : disp [7:0] <= 8'b00010010;// 5 <= 7'h5B;
			6 : disp [7:0] <= 8'b00000010;// 6 <= 7'h5F;
			7 : disp [7:0] <= 8'b01111000;// 7 <= 7'h70;
			8 : disp [7:0] <= 8'b00000000;// 8 <= 7'h7F;
			9 : disp [7:0] <= 8'b00011000;// 9 <= 7'h7B;
		endcase
	end

endmodule

module bcdDecoder( 
	//input [2:0] state,
	input hienable,
	input [3:0] ones,
	input [3:0] tenths,
	input [3:0] hundreths,
	input [3:0] thousandths,
	input [15:0] hiscore,
//	output reg [7:0] disp0,
//	output reg [7:0] disp1,
//	output reg [7:0] disp2,
//	output reg [7:0] disp3	
	output [7:0] disp0,
	output [7:0] disp1,
	output [7:0] disp2,
	output [7:0] disp3	
	);

	reg [7:0] segZero, segOne, segTwo, segThree;

	
	always @(hienable)
	begin
		if(hienable == 0)
		begin 
			segThree = ones;
			segTwo = tenths;
			segOne = hundreths;
			segZero = thousandths;
		end
		else
			segThree = hiscore[15:12];
			segTwo = hiscore[11:8];
			segOne = hiscore[7:4];
			segZero = hiscore[3:0];
		end
		
//	SevenSegmentOnes m(ones, disp3); // displays decimal to indicate seconds
//	SevenSegment n(tenths, disp2);
//	SevenSegment o(hundreths, disp1);
//	SevenSegment p(thousandths, disp0);
//	

	SevenSegmentOnes m(segThree, disp3); // displays decimal to indicate seconds
	SevenSegment n(segTwo, disp2);
	SevenSegment o(segOne, disp1);
	SevenSegment p(segZero, disp0);
	
endmodule 
