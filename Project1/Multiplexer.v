/*
Jack Danielski and Mike Fruge
ECEN 2350 
Spring 2018
*/
module mux(
	input [7:0] a,
	input [7:0] b, 
	input [7:0] c,
	input [7:0] d,
	input [1:0] S,
	output [7:0]f
	);
	
	assign f = S[1] ? (S[0] ? d:c) : (S[0] ? b : a);
endmodule
