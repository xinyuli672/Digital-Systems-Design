// testbench for lab1
`include "display_tb.sv"
module lab1_tb();
  logic Reset = 1,
        Clk = 0,
        Timeset = 0,
        Alarmset = 0,
		    Minadv = 0,
		    Hrsadv = 0,
		    Alarmon = 1,
		    Pulse = 0;
  wire[6:0] S1disp, S0disp,
            M1disp, M0disp,
	        H1disp, H0disp;
  wire Buzz;

  struct_diag sd(.*);
  initial begin
	#  20ns  Reset    = 0;
	#  10ns  Timeset  = 1;
	        Minadv   = 1;
	# 500ns  Minadv   = 0;
	       Hrsadv   = 1;
	#  70ns  Timeset  = 0;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	#  10ns  Alarmset = 1;
	#  80ns  Hrsadv   = 0;
	#  10ns  Minadv   = 1;
	# 100ns  Minadv   = 0;
	#  10ns  Alarmset = 0;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 1600ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 1600ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 1600ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));


  	#15000ns  $stop;
  end 
  always begin
    #5ns Pulse = 1;
	#5ns Pulse = 0;
  end

endmodule