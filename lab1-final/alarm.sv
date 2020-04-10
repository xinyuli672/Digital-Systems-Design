module alarm (
	input[7:0] tmin,  // Clock
	input[7:0] amin,
	input[7:0] thr, // Clock Enable
	input[7:0] ahr, 
	output logic buzz
);

	assign buzz = (tmin == amin) && (thr == ahr);

endmodule
