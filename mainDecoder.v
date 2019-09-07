module mainDecoder
	(
		input logic [5:0] op_code, funct,
		input logic alu_zero,
		
		output logic [1:0] alu_op,
		output logic mem_to_reg, mem_write, pc_src, branch,
		output logic alu_src, reg_dst, reg_write, jump
	);
	
	
	assign {reg_write, reg_dst, alu_src, branch, mem_write, mem_to_reg, jump, alu_op} = controls;
				
				
	always@(*)
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