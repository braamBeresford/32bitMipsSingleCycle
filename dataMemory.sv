module dataMemory
    (
        input logic [31:0] addr,
        input logic [31:0] WD,
        input logic clk, memWrite,
        output logic [31:0] RD
    );

    logic [31:0] ram [255:0];

	integer i; 
    initial begin  
        for(i=0;i<256;i=i+1)  
            ram[i] <= 32'd0;  
    end

    always_ff @(posedge clk)
    begin
        if(memWrite) 
            ram[addr] <= WD;

    end

    assign RD = ram[addr];

endmodule