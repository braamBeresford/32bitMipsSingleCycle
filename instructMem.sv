module instructMem
    (
        input logic [5:0] pc,
        output logic [31:0] instruction
        
    );

    logic [31:0] rom [31:0];

    initial begin
        rom[0] = 'h20020005;  
        rom[1] = 'h2003000c;  
        rom[2] = 'h2067fff7;  
        rom[3] = 'h00e22025;  
        rom[4] = 'h00642824;  
        rom[5] = 'h00a42820; 
        rom[6] = 'h10a7000a;  
        rom[7] = 'h0064202a;  
        rom[8] = 'h10800001;  
        rom[9] = 'h20050000;  
        rom[10] = 'h00e2202a;  
        rom[11] = 'h00853820;  
        rom[12] = 'h00e23822;  
        rom[13] = 'hac670044;  
        rom[14] = 'h8c020050;  
        rom[15] = 'h08000011;  
		  rom[16] = 'h20020001; 
		  rom[17] = 'hac020054; 
    end


     assign instruction = rom[pc];
endmodule