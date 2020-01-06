module mux_2to1(m, select, in0, in1); //declares module

	input wire select, in0, in1; //defines input wires select, in0, in1
	output wire m; //defines output wire
	assign m = (~select & in0) | (select & in1); //assigns logical expression to m

endmodule //ends module