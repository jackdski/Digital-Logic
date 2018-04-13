module BCD_Counter( 
	input clk,
	input [2:0] state,
	output reg [3:0] ones,
	output reg [3:0] tenths,
	output reg [3:0] hundreths,
	output reg [3:0] thousandths
	);
	
	parameter reset = 4'b1001;
	//reg [10:0] num;
	
	//Clock_divider(clk, num[10:0]);
	
	//always@(posedge num)
	
	always @(posedge clk)
		begin
			thousandths = thousandths +1;
			if (thousandths == reset)
			begin
				thousandths <= 4'b0000;
				hundreths <= hundreths +1;
			end
		end
		
		always@(posedge hundreths)
		begin
			if(hundreths == reset)
			begin
				hundreths <= 4'b0000;
				tenths <= tenths + 1;
			end
		end
		
		always@(posedge tenths)
		begin
			if (tenths == reset)
			begin
				tenths <= 4'b0000;
				ones <= ones+1;
			end
		end

endmodule
