module mips32Single(
		input logic				clk, reset,
		output logic [31:0]	pc,
		input logic [31:0]	instr,
		output logic			mem_write,
		output logic [31:0] alu_out, write_data,
		input logic [31:0]	read_data

	);

	logic mem_to_reg, alu_src, reg_dst,
			reg_write, jump, pc_src, alu_zero;
		
	logic [2:0]	alu_control;
	
	control_unit cu(instr[31:26], instr[5:0], alu_zero, mem_to_reg,
						mem_write, pc_src, alu_src, reg_dst, reg_write, 
						jump, alu_control);
	
	dataPath 	 data(clk, reset, mem_to_reg, pc_src,
							alu_src, reg_dst, reg_write, jump,
							alu_control, alu_zero, pc, instr,
							alu_out, write_data, read_data);

	
endmodule
