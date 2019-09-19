module top
	(
		input logic				clk, reset,
		output logic [31:0]	write_data, data_addr, 
		output logic 			mem_write
	);
	
	logic [31:0] pc, instr, read_data;
	
	mips32Single cpu(clk, reset, pc, instr, mem_write, 
							data_addr, write_data, read_data);


								
	instructMem		instructions(.instruction(instr), .pc(pc[7:2]));
	
	dataMemory					data(clk, mem_write, data_addr, write_data, read_data);
endmodule
