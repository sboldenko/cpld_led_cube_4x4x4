module d_trigger
(
    input  D,
    input  clk,
    output Q
);

    wire nand1; 
    wire nand2; 
    wire nand3; 
    wire nand4; 
    
    nand n1(nand1, D, clk); 
    nand n2(nand2, nand1, clk); 
    nand n3(nand3, nand1, nand4); 
    nand n4(nand4, nand2, nand3); 
    
    assign Q = nand3;
	
endmodule
