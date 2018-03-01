module mux(
	input a,
	input b, 
	input c,
	input d,
	input [1:0]S,
	output f
	);
	
	assign f = S[1] ? (S[0] ? d:c) : (S[0] ? b : a);
	
endmodule
