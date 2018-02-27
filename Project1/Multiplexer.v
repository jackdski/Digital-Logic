module mux(
	input A,
	input B,
	//input C,
	//input D, 
	//input [1:0] Key,
	output [3:0] disp,
	output [1:0] f
	);
	
	reg g;
	reg [3:0]h;
	h = 4'b 0000;
	if(Key[1] == 0) 
	begin 
		if(Key[0] == 0)
		//begin
			//g = A;
			
		//end
		else
		begin 
			//g = B;
			h = 4'b0001;
		end
	end 
	else
	begin 
		if(Key[0] == 0)
		begin 
			//g = C;
			h = 4'b0010;
		end
		else 
		begin 
			//g = D;
			h = 4'b0011;
		end
	end
	
	assign f = Key;
	assign disp = h;
endmodule;
