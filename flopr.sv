module flopr #(parameter WIDTH = 16)
	(
		input logic clk, reset,
		input logic [WIDTH-1:0] pc_next,
		output logic [WIDTH-1:0] pc
	);
	
	always_ff @(posedge clk, posedge reset)
	begin
		if(reset) pc <= 0;
		else pc <= pc_next;
	end
	
endmodule