module dataPath
	(
		input logic clk, reset,
		input logic mem_to_reg, pc_src,
		input logic alu_src,reg_dst,
		input logic mem_write, jump,
		input logic [2:0] alu_control,
		
		output logic [31:0] instr,
		output logic alu_zero
		
	);
	
	logic [4:0]  write_reg;
	logic [31:0] pc_next, pc, pc_plus_4, pc_branch, pc_temp;
	logic [31:0] sign_immediate, sign_immediate_shifted_2;
	logic [31:0] result, src_A, src_B;
	logic [31:0] write_data, alu_res, read_data;
	
	flopr #(32) 	pc_flop(clk, reset, pc_next, pc);

	instructMem		instruction_mem(pc, instr);

	dataMemory		data_memory(alu_res, write_data, clk, mem_write, read_data);
	
	
	extendSign		extendSign(instr[15:0], sign_immediate);
	
	
	//PC related logic
	shift_left_2 	sl2(sign_immediate, sign_immediate_shifted_2);
	adder				jmp_adder(sign_immediate_shifted_2, pc_plus_4, pc_branch);
	adder				add_four_pc(pc, 3'b100, pc_plus_4);
	mux2 #(32)		pc_src_mux(pc_plus_4, pc_branch, pc_src, pc_temp);
	mux2 #(32)		pc_jmp_mux(pc_temp, {pc_plus_4[31:28],instr[25:0], 2'b00}, jump, pc_next);
	
	registerMem		register_file(clk, result, instr[25:21], instr[20:16], 
											write_reg, result, src_A, write_data);	
	mux2 #(5)		register_write_source_mux(instr[20:16], instr[15:11], reg_st, write_reg);
	mux2 #(32)		alu_src_mux(write_data, sign_immediate, alu_src, src_B);
	alu				alu(src_A, src_B, alu_control, alu_zero, alu_res);

	mux2 #(32)		result_select(read_data, mem_to_reg, alu_result);
	
endmodule

