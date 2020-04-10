module ct_mod60 (
	input clk,    // Clock
	input en, // Clock Enable
	input rst,
	output logic[7:0] ct_out,
	output logic z
);
    logic[7:0] ctq;


    always_ff @(posedge clk)
    	if(rst)
    		ct_out <= 0;
    	else if(en)
    		ct_out <= (ct_out + 1) % (7'd60);

    	
    always_ff @(posedge clk)
    	if(rst) 
    		ctq <= 0;
    	else
    		ctq <= ct_out;
    
    assign z = ctq && !ct_out;
    

endmodule