module even_parity_generator(EP, A, B ,C, D ); //declares module

	input wire A, B ,C, D; //defines input wires A, B, C, D
	output wire EP; //defines output wire EP
	assign EP = A ^ B ^ C ^ D ; //assigns logical expression for EP

endmodule //ends module