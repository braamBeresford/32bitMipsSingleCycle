module registerMem
    (
        input logic clk, WE3,
		  input logic [4:0] RA1, RA2, WA3,
		  input logic [31:0] WD3,
		  
		  output logic [31:0] RD1, RD2
    );

	logic [31:0] regData [31:0];
	
	always_ff @(posedge clk)
	begin
		if(WE3) regData[WA3] <= WD3;
	end
	
	//Register 0 is always 0.
	assign RD1 = (RA1 != 0) ? regData[RA1]: 0;
	assign RD2 = (RA2 != 0) ? regData[RA2]: 0;
	
endmodule