module alu
	(
		input  logic [31:0] src_A, src_B,
		input logic [2:0] alu_control,
		output logic zero,
		output logic [31:0] alu_res
	);
	
	always_comb
		case(alu_control)
			3'b000: alu_res = src_A & src_B;
			3'b001: alu_res = src_A | src_B;
			3'b010: alu_res = src_A + src_B;
			3'b011: alu_res = 0;
			3'b100: alu_res = src_A & (!src_B);
			3'b101: alu_res = src_A | (!src_B);
			3'b110: alu_res = src_A - src_B;
			3'b111: alu_res = 0;
			default: alu_res = 0;
			
		endcase
	
	assign zero = (alu_res == 0)? 1: 0;
	
endmodule
