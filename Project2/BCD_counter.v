module bcdCounter( 
	input binaryTime[10:0],
	input clk,
	output reg [3:0] seconds,
	output reg [3:0] tenths,
	output reg [3:0] hundreths,
	output reg [3:0] thousandths
	);

	parameter reset = 4'b1001;
	reg [10:0] num;
	
	clockdivider(clk, binaryTime[10:0], 1, 0, num[10:0]);
	
	if (num[3] & num[0]) // if num = 9
	begin
		tenths = 
	end
	
	
	always @ (
		

endmodule

//2bit counter
module BCDCount(
	input clk,
	input clear,
	input E,
	output reg [3:0]BCD1,
	output reg [3:0]BCD0
	);
	
	always @(posedge clk)
	begin
		if(clear)
		begin
			BCD1 <= 0;
			BCD0 <= 0;
		end
		else if(E)
			if(BCD0 == 4'b1001)
			begin
				BCD <= 0;
				if(BCD1 == 4'b1001)
					BCD1 <= 0;
				else
					BCD1 <= BCD1 + 1;
			end
			else 
			BCD0 <= BCD0 + 1;
		end
	endmodule
	
	
endmodule 
