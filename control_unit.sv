module control_unit
	(
		input logic [5:0] op, funct,
		input logic alu_zero,
		output logic mem_to_reg, mem_write, pc_src,
		output logic alu_src, reg_dst, reg_write, jump,
		output logic[2:0] alu_control
	);
	
	logic branch;
	logic [1:0] alu_op;
	
	mainDecoder main(op, funct, alu_zero,alu_op, mem_to_reg, mem_write, pc_src,
						alu_src, reg_dst, reg_write, jump);
	
	
endmodule