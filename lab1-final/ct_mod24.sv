module ct_mod24 (
	input clk,    // Clock
	input en, // Clock Enable
	input rst,
	output logic[7:0] ct_out,
	output logic z
);


    always_ff @(posedge clk)
    	if(rst)
    		ct_out <= 0;
    	else if(en)
    		ct_out <= (ct_out + 1) % (7'd24);

    	
    assign z = !ct_out;
    

endmodule // ct_mod24