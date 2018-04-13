module Compare(
	input [10:0] in,
	input clk,
	output [10:0] val
	);

	reg cutoff= 11'b01000000000;
	reg [10:0] temp;
	reg [10:0] temp2;
	
	lfsr(clk, temp2);
	always@(posedge clk)
	begin
		if (in < cutoff)
			begin
				temp = temp2;
			end
		else
			begin
				temp = in;
			end
	end
	assign val = temp;

endmodule 
