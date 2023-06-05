//Test Bench Module
//Author: Muhammad Aqdas Chaudhary
//Dated: 2nd June 2023
//Intel Quartus Prime Lite

// This is the test bench for the core


//------------------------------------------------------------------------------------
`timescale 1ns / 1ps


module tb_original(


    );
    reg clk;
	 wire [31:0] out;
    Core c1 (.clk(clk), .out(out));
    always #50 clk=~clk;
    initial clk=0;
    
    
endmodule