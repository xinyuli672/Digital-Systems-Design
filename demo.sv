module verilogdemo(
	input signed[7:0] a,b,
	output signed logic[15:0] c 

);
    assign c = a*b; //connect a piece of wire (anytime I change a or b recompute c)
    always_comb c = a*b; //equivalent 
    always @ (*) c = a*b;

    assign c = d? a:b;
    always_comb case (/* switch */)
    
    	default : /* default */;
    endcase

    always_comb begin
    	//
    end // always_comb

endmodule // verilogdemo


module casc_and(input a,b,c,
	output logic d);
    logic e; //type logic
    
    always @ (*) begin     //blocking: execute sequentially 
    	e = a&b;
    	d = e&c;
    end
    
    always_comb e = a&b;   //better this way
    always_comb d = e&c;
    //always_comb e = 1'b1;  // could cause error: can't drive it with two values 
    wire g;
    assign g = a&b; //     assign g =  en? 1'b1 : a&b;
    assign g = 1'b1;

endmodule // casc_and

module fsm (
	input clk,    // Clock
	input en, //  Enable
	input rst,
	output logic[1:0] state,
	logic[1:0] next_state
);
	always_ff @ (posedge clk) begin 
		if(rst) state <= 2'b0;
		else if(en) state <= next_state;
	end // always @ (posedge clk)

	always_comb case(state)
	    0: next_state = 1;
	    1: next_state = 2;
	    2: next_state = 0;
	endcase // state

endmodule // fsm



	always_ff @ (posedge clk) begin 
		a<= din;
		b<= a;
		c<= b;
	end // always_ff @ (posedge clk)
