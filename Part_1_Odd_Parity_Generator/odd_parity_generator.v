module odd_parity_generator(OP, A, B ,C, D ); //declares module

	input wire A, B ,C, D; //defines input wires A, B, C, D
	output wire OP; //defines output wire Odd parity
	assign OP = ~(A ^ B ^ C ^ D) ; //Logical expression for odd parity

endmodule //ends module
