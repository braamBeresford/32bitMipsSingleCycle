module mainDecoder
	(
		input logic [5:0] op_code,
		output logic 		mem_to_reg, mem_write, branch,
		output logic		alu_src, reg_dst, reg_write,
		output logic 		jump, 

		
		output logic [1:0] alu_op

	);
	
	logic [8:0] controls;
	assign {reg_write, reg_dst, alu_src, branch, mem_write, mem_to_reg, jump, alu_op} = controls;
				
				
	always_comb
		case(op_code)
			6'b000000: controls <= 9'b110000010; 
			6'b100011: controls <= 9'b101001000; 
			6'b101011: controls <= 9'b001010000; 
			6'b000100: controls <= 9'b000100001; 
			6'b001000: controls <= 9'b101000000; 
			6'b000010: controls <= 9'b000000100; 
			default:   controls <= 9'bxxxxxxxxx;

		endcase



endmodule