module two_to_1_4_bit_mux(O,I0,I1,S); //declares module

	input wire [3:0]I0; // Defines Two 4bit wide data inputs
	input wire [3:0]I1; // Defines Two 4bit wide data inputs
	input wire S; // Defines two selctor inputs
	output wire [3:0]O; //Defines output wire
	
	assign O[0] = (~S&I0[0]) | (S&I1[0]); //assigns logical expression to O[0]
	assign O[1] = (~S&I0[1]) | (S&I1[1]); //assigns logical expression to O[1]
	assign O[2] = (~S&I0[2]) | (S&I1[2]); //assigns logical expression to O[2]
	assign O[3] = (~S&I0[3]) | (S&I1[3]); //assigns logical expression to O[3]
	
endmodule //ends module