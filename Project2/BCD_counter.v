// helped by book 5.14
module BCDCount(
	input clkDivder,
	output reg [3:0]BCD3,
	output reg [3:0]BCD2,
	output reg [3:0]BCD1,
	output reg [3:0]BCD0
	);
	
	always @(posedge clk)
	begin
		if(BCD0 == 4'b1001)
		begin
			BCD0 <= 0;
			if(BCD1 == 4'b1001)
			begin
				BCD1 <= 0;
				if(BCD2 == 4'b1001)
				begin
					BCD2 <= 0;
					if(BCD3 == 4'b1001)
						BCD3 <= 0;
					else
						BCD3 <= BCD3 + 1;
				end
				else
				begin 
					BCD2 <= BCD2 + 1;	
				end
			end
			else
			begin
				BCD1 <= BCD1 + 1;
			end
		end
		else 
		BCD0 <= BCD0 + 1;
	
endmodule 
