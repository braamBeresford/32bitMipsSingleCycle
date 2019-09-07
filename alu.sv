module alu
	(
		input  logic [31:0] src_A, src_B,
		input logic [2:0] alu_control,
		output logic [31:0] alu_res,
		output logic zero
	);
	
	 logic [31:0] condinvb, sum;

	  assign condinvb = alu_control[2] ? ~src_B : src_B;
	  assign sum = src_A + condinvb + alu_control[2];

	  always_comb
		 case (alu_control[1:0])
			2'b00: alu_res = src_A & src_B;
			2'b01: alu_res = src_A | src_B;
			2'b10: alu_res = sum;
			2'b11: alu_res = sum[31];
		 endcase

	  assign zero = (alu_res == 32'b0);
	
	
	
//	always_comb
//		case(alu_control)
//			3'b000: alu_res = src_A & src_B;
//			3'b001: alu_res = src_A | src_B;
//			3'b010: alu_res = src_A + src_B;
//			3'b011: alu_res = 0;
//			3'b100: alu_res = src_A & (!src_B);
//			3'b101: alu_res = src_A | (!src_B);
//			3'b110: alu_res = src_A - src_B;
//			3'b111: alu_res = 0;
//			default: alu_res = 0;
//			
//		endcase
//	
//	assign zero = (alu_res == 0)? 1'b1: 1'b0;
	
endmodule
