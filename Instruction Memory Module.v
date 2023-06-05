//Instruction Memory Module
//Author: Shameer Hussain
//Dated: 27th May 2023
//Intel Quartus Prime Lite

// This Instruction Memory contains the code for displaying Prime Numbers in the register 1.


//------------------------------------------------------------------------------------

`timescale 1ns / 1ps


module Instruction_Memory(
input [7:0] instraddr,
output reg [31:0] instrcode
    );
	 
        reg [7:0] prog_mem [0:256];
        initial begin
        
        prog_mem[3]=8'h00;prog_mem[2]=8'h20;prog_mem[1]=8'h06;prog_mem[0]=8'h13;       
        prog_mem[7]=8'h06;prog_mem[6]=8'h40;prog_mem[5]=8'h07;prog_mem[4]=8'h93;
        prog_mem[11]=8'h00;prog_mem[10]=8'h10;prog_mem[9]=8'h05;prog_mem[8]=8'h13;
        prog_mem[15]=8'h00;prog_mem[14]=8'h10;prog_mem[13]=8'h08;prog_mem[12]=8'h13;
        prog_mem[19]=8'h00;prog_mem[18]=8'h10;prog_mem[17]=8'h08;prog_mem[16]=8'h93;
        prog_mem[23]=8'h01;prog_mem[22]=8'h00;prog_mem[21]=8'h07;prog_mem[20]=8'h33;
        prog_mem[27]=8'h00;prog_mem[26]=8'hc0;prog_mem[25]=8'h06;prog_mem[24]=8'hb3;
        prog_mem[31]=8'h00;prog_mem[30]=8'he6;prog_mem[29]=8'hc6;prog_mem[28]=8'h63;
        prog_mem[35]=8'h40;prog_mem[34]=8'he6;prog_mem[33]=8'h86;prog_mem[32]=8'hb3;
        prog_mem[39]=8'h00;prog_mem[38]=8'h80;prog_mem[37]=8'h00;prog_mem[36]=8'h6F;
        prog_mem[43]=8'h40;prog_mem[42]=8'hD7;prog_mem[41]=8'h07;prog_mem[40]=8'h33;
        prog_mem[47]=8'hFE;prog_mem[46]=8'hD7;prog_mem[45]=8'h18;prog_mem[44]=8'hE3;
        prog_mem[51]=8'h00;prog_mem[50]=8'hA7;prog_mem[49]=8'h04;prog_mem[48]=8'h63;
        prog_mem[55]=8'h00;prog_mem[54]=8'h08;prog_mem[53]=8'hF8;prog_mem[52]=8'h93;
        prog_mem[59]=8'h00;prog_mem[58]=8'h18;prog_mem[57]=8'hF8;prog_mem[56]=8'h93;
        prog_mem[63]=8'h00;prog_mem[62]=8'h18;prog_mem[61]=8'h08;prog_mem[60]=8'h13;
        prog_mem[67]=8'hFC;prog_mem[66]=8'hC8;prog_mem[65]=8'h1A;prog_mem[64]=8'hE3;
        prog_mem[71]=8'h00;prog_mem[70]=8'hA8;prog_mem[69]=8'h86;prog_mem[68]=8'h63;
        prog_mem[75]=8'h00;prog_mem[74]=8'h16;prog_mem[73]=8'h06;prog_mem[72]=8'h13;
        prog_mem[79]=8'hFC;prog_mem[78]=8'hF6;prog_mem[77]=8'h10;prog_mem[76]=8'hE3;
        prog_mem[83]=8'h00;prog_mem[82]=8'hc0;prog_mem[81]=8'h00;prog_mem[80]=8'hB3;
        prog_mem[87]=8'hFF;prog_mem[86]=8'h5F;prog_mem[85]=8'hF0;prog_mem[84]=8'h6F;
        
      

        end
       always@(*)begin
       instrcode = {prog_mem[instraddr+3],  prog_mem[instraddr+2], prog_mem[instraddr+1], prog_mem[instraddr]};
     end
endmodule
