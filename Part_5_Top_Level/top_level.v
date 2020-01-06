module top_level(SW, KEY, HEX0, HEX1, HEX2, HEX3,LEDR); //declares the top_level module
	input wire [9:0]SW; //defines input switches
	input [0:0]KEY; //Key 0 is the input parity bit for parity checker.
	
	output [9:0]LEDR; //defines output LEDR wires
	output wire [6:0]HEX0; //defines output HEX0 display.
	output wire [6:0]HEX1; //defines output HEX1 display.
	output wire [6:0]HEX2; //defines output HEX2 display.
	output wire [6:0]HEX3; //defines output HEX3 display.
	//Switch 8 selects which data message to transmit.
	
	assign Parity = SW[9]; // Switch 9 determines whether the parity is odd or even.(0 for Even; 1 for Odd.)
	wire P; //defines wire P
	assign P = KEY [0:0]; // assigns wire P to KEY [0:0]
	
	wire [3:0]D0 = SW[3:0]; //Data message 0: switches 3:0 
	wire [3:0]D1 = SW[7:4]; //Data message 1: switches 7:4 
	
	
	wire [3:0]Databus; //defines databus wire, 4 bits wide
	wire EPG_wire; //defines even parity generator wire
	wire OPG_wire; //defines odd parity generator wire
	
	wire GP_wire; //defines generated parity wire
	
	wire CEP_wire; //defines checked even parity wire
	wire COP_wire; //defines checked odd parity wire
	
	wire CP_wire; //defines checked parity output wire
	
	two_to_1_4_bit_mux inst7(Databus[3:0],D0[3:0],D1[3:0],SW[8]); //instantiates a two to 1, 4 bit multiplexer to select the data message

	even_parity_generator(EPG_wire, Databus[3], Databus[2] ,Databus[1], Databus[0]); //instantiates the even parity generator to generate the even parity bit
	odd_parity_generator(OPG_wire, Databus[3], Databus[2] ,Databus[1], Databus[0]); //instantiates the odd parity generator to generate the odd parity bit
	
	mux_2to1 inst4(GP_wire, SW[9], EPG_wire, OPG_wire); //instantiates a 2 to 1, 1 bit multiplexer to select between the generated even parity bit and odd parity bit

	even_parity_checker(CEP_wire,Databus[3], Databus[2] ,Databus[1], Databus[0], P); //checks the recieved data and even parity bit
	odd_parity_checker(COP_wire, Databus[3], Databus[2] ,Databus[1], Databus[0], P); //checks the recieved data and odd parity bit
	
	mux_2to1 inst5(CP_wire, SW[9], CEP_wire, COP_wire); //instantiates a two to 1, 1 bit MUX to select between the even bit checker and the odd bit checker outputs.
	
	
	wire [3:0]X; //defines 4 wires X
	wire [3:0]Y; //defines 4 wires Y
	wire [3:0]Z; //defines 4 wires Z
	wire [3:0]Z0; //defines 4 wires Z0
	wire [3:0]Z1; //defines 4 wires Z1

	
	assign X = {3'b000, GP_wire}; //concatenates the X wires
	assign Y = {3'b000, CP_wire}; //concatenates the Y wires
	
	assign Z0 = {3'b000, Parity}; //concatenates the Z wire
	assign Z1 = {3'b111, ~(Parity)}; //concatenates the Z wire
		

	two_to_1_4_bit_mux inst6(Z,Z0,Z1,Parity); //instantiates the two to 1, 4 bit MUX
	
	
	hex_7seg_bitwise  inst0 (Databus[3:0], HEX0); //calls hex_7seg_bitwise
	
	hex_7seg_bitwise  inst1 (X, HEX1); //calls hex_7seg_bitwise
	
	hex_7seg_bitwise  inst2 (Y, HEX2); //calls hex_7seg_bitwise
	
	hex_7seg_bitwise  inst3 (Z, HEX3); //calls hex_7seg_bitwise
	
	assign LEDR[9:0] = SW[9:0]; //assigns LEDRS to switches
	
endmodule //ends module
