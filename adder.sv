module adder
	(
		input logic [31:0] x, y,
		output logic [31:0] z
	);
	
	assign z = x + y;
	
endmodule