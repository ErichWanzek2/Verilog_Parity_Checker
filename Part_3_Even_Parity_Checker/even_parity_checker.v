module even_parity_checker(CEP, A, B ,C, D, P); //declares module
	input wire A, B ,C, D, P; //defines input wires A, B, C, D, P
	output wire CEP; //defines output wire CEP
	
	wire EP; //defines the wire EP
	
	even_parity_generator(EP, A, B ,C, D ); //instantiates the even parity generator to generate the even parity bit to be checked. 
	
	assign CEP = EP ^ P; //assigns the logical expression to CEP

endmodule //ends module
