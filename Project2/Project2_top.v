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
	
	
	parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b100; // define states
	
	reg [2:0] CS; // holds current state
	wire [10:0] randomnum; // output of LSFR
	//wire [10:0] mstime;
	wire [10:0] mstime;
	//wire [10:0] meastime;
	wire meastime;
	
	wire [4:0] ein, zehn, hundert, tousand;
	wire clk;
	
	reg [9:0] ledz;
	reg changeKey;
	reg [14:0] timer;
	reg initTimer;
	initial initTimer = 0;
	
	reg [14:0] yourtime;
	reg [10:0] hiscore;
//	reg [3:0] thousanths;
//	reg [3:0] hundreths;
//	reg [3:0] tenths;
//	reg [2:0] ones;
		
	wire [3:0] thousanths;
	wire [3:0] hundreths;
	wire [3:0] tenths;
	wire [3:0] ones;
	wire [7:0] disp0, disp1, disp2, disp3;
		
	initial CS = A;
		
	//Clock_divider first(MAX10_CLK1_50, mstime[10:0]);
	//Clock_divider first(MAX10_CLK1_50, mstime);
	Clock_divider first(MAX10_CLK1_50, clk);
	LFSR sht (clk, randomnum[10:0]);
	BCD_Counter meas(clk, state, ones, tenths, hundreths, thousanths);
	BCD_decoder(CS, ones, tenths, hundreths, thousanths, disp0, disp1, disp2, disp3);
	SevenSegmentOnes(ones, disp3); // displays decimal to indicate seconds
	SevenSegment(tenths, disp2);
	SevenSegment(hundreths, disp1);
	SevenSegment(thousandths, disp0);

	always@(posedge SW[0])
	begin
		CS=A;
	end
	
	always@(posedge SW[9])
	begin
		CS=F;
	end
	
	always@(posedge clk) 
	begin
		timer = timer + 1;
	end
	
	always@(*)
	begin
		// State 0
		// KEY[0]= Start
		if(CS == A)	// Do Nothing state, wait for KEY[0] to be 1 or SW[0] to be 1
		begin	
			//always@(negedge KEY[0])
			if(KEY[0])
			begin
				changeKey = 1;
			end
			
			if(KEY[0] && changeKey)
			begin
				changeKey = 0;
				CS=B;
			end
		end
		
		else if(CS==B) // State to make sure KEY[1] isn't still pressed
		begin
			if((LEDR[9:0] == 0) && KEY[1]) // 'Delaying the Measurement'
			begin
				CS=B;
			end
			else if((~LEDR[9:0]) && (~KEY[1]))
			begin
				CS= C;
			end
		end
		else if(CS==C)	// get LFSR stuff and then light up LEDs
		begin
//			LFSR sht (MAX10_CLK1_50, randomnum[10:0]);
//			Clock_divider first(MAX10_CLK1_50, mstime[10:0]);
			if(~initTimer)
			begin
				timer = 0;
				initTimer = 1; 
			end
			if(timer >= randomnum)
			begin
				//LEDR[9:0] = 10'b1111111111;
				ledz = 10'b1111111111;
				CS=D;
				initTimer = 0;
			end
		end
		
		
		else if(CS==D)	
		begin
			if(KEY[1])
			begin
				yourtime <= {ones [3:0], tenths[3:0], hundreths[3:0], thousanths[3:0]} ;
				CS=E;
			end
		end
		
		else if(CS==E)	// show yourtime on seven seg
			//LEDR[9:0]=10'b0000000000;
			ledz = 10'b0000000000;
			if(yourtime<hiscore)
			begin
				hiscore=yourtime;
				//assign LEDR[9:0]=10'b1010101010;
				ledz = 10'b1010101010;
			end
			//always@(posedge KEY[1])
			if(KEY[1])
			begin
				CS=F;
			end
		
		
		else if(CS==F)
			//Display Highscore
			//always@(posedge KEY[1])
			if(KEY[1])
			begin
				CS=A;
			end
	end
	
	assign LEDR[9:0] = ledz[9:0];
endmodule
