module bcdCounter( 
	input clk,
	input enable,
	output reg [3:0] ones,
	output reg [3:0] tenths,
	output reg [3:0] hundreths,
	output reg [3:0] thousandths
	);
	
	parameter reset = 4'b1001;
	
	
//	initial
//	begin
//		ones=0;
//		tenths=0;
//		hundreths=0;
//		thousandths=0;
//	end
	
	always@(posedge clk)
	begin
		if(~enable) // IF enable allows this module to go, then it will count, otherwise it will do nothing
		begin
			if(thousandths==reset)
			begin
				thousandths<=0;
				if(hundreths==reset)
				begin
					hundreths<=0;
					if(tenths==reset)
					begin
						tenths<=0;
						//ones<= ones+1;
						if(ones==reset)
						begin
							ones<=0;
						end
						else
						begin
							ones<=ones+1;
						end
					end
					else
					begin
						tenths<=tenths+1;
					end
				end
				else
				begin
					hundreths<=hundreths+1;
				end
			end
			else
			begin
				thousandths<=thousandths+1;
			end
		end
	end
endmodule
