//Program Counter Module
//Author: Omair Siddique
//Dated: 23rd May 2023
//Intel Quartus Prime Lite


//------------------------------------------------------------------------------------

`timescale 1ns / 1ps

module ProgramCounter(
input [7:0] br_instruction,
input we,
input j_pc,
input br_sig,
input clk,
output reg [7:0] instraddr,
output [7:0] ret_addr
);

	initial instraddr = 8'h00;
	assign ret_addr = instraddr + 8'h04;

	always @(posedge clk) begin
		if ((br_sig && we) || (j_pc))
		begin
		instraddr = br_instruction;
		end
		else
		instraddr = ret_addr;
	end
endmodule