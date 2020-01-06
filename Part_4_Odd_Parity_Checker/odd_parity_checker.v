module odd_parity_checker(COP, A, B ,C, D, P); //declares module
	input wire A, B ,C, D, P; //defines input wires A, B, C, D, P
	output wire COP; //defines output wire COP
	
	wire EP; //defines wire EP
	
	odd_parity_generator(OP, A, B ,C, D ); //instantiates the odd parity generator to generate the odd parity bit to be checked

	assign COP = OP ^ P; //assigns logical expression to COP

endmodule //ends module 
