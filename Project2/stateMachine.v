module stateMachine(
	input Key0,
	input Key1,
	input sw0, 
	input finished,
	output enableCounter,
	output downcountenable,
	output enablehiscore,
	output ledenable
	);
	
	reg [2:0] pstate;
	reg [2:0] nextstate;
	
	//wire [6:0] val = {startSignal, enableCounter, enableLFSR, sw9, sw0, ~Key1, ~Key0};
	//wire [6:0] val = {(~Key0), (~Key1), sw0, sw9, enableLFSR, enableCounter, startSignal};
	
	//initial CS = 3'b000;
	
	//parameter A=7'b0000000, B=7'b1000000, C=7'b0000100, D=7'b0000011, E=7'b0100011, F=7'b0000001, G=7'b0010???, H=7'b0001???;
	
//	always @(val)
//	begin 
//		case(val)
//			A : state <= 2'b00;
//			B : state <= 2'b01;
//			C : state <= 2'b10;
//			D : state <= 2'b11;
//
//		
//		endcase
//	end
	
always @(negedge Key0,negedge Key1,posedge finished)
begin
//	nextstate[0]<= (~pstate[0]);
//	if(pstate[0]==1)
//	begin
//		nextstate[1]<= ~pstate[1];
//	end
//	else 
//	begin
//		nextstate[1]<=pstate[1];
//	end	
	
	if(pstate == 3'b000 & Key0==1)
	begin
		//downcontenable <= 1;
		nextstate <= 3'b001;
	end
	
	else if(pstate == 3'b001 & finished)
	begin
		nextstate <= 3'b010;
		//enableCounter <= 1;
	end
	else if(pstate == 3'b010 & Key0==1)
	begin
		nextstate = 3'b011;
		//enableCounter <= 0;
	end
	else if (Key1==1)
	begin
		nextstate<= 3'b000;
	end
	else if (pstate==3'b011)
	begin
	// Display current score
		nextstate <= 3'b000;
	end
	
end

	assign downcountenable=(~pstate[2] & ~pstate[1] & pstate[0]);
	assign enableCounter=(~pstate[2] & pstate[1] & ~pstate[0]);
	assign enablehiscore=(~pstate[2] & ~pstate[1] & ~pstate[0]);
	assign ledenable = (~pstate[2] & pstate[1] & ~pstate[0]);
		
	
endmodule
