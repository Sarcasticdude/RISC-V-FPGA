//Comparator Module
//Author: Omair Siddique
//Dated: 23rd May 2023
//Intel Quartus Prime Lite


//------------------------------------------------------------------------------------

`timescale 1ns / 1ps

module Comparator(
input [2:0] funct_3,
input [31:0] operand1,
input [31:0] operand2,
output reg br_sig
);
reg [31:0] sub_result;

always @(*) begin
sub_result = operand1 - operand2;

  case (funct_3)
     3'b000:
        begin
           br_sig = (operand1 == operand2) ? 1'b1 : 1'b0;
        end
        
     3'b001:
        begin
           br_sig = (operand1 != operand2) ? 1'b1 : 1'b0;
        end
        
     3'b100:
        begin
           if (operand1[31] != operand2[31])
              br_sig = (operand1[31]) ? 32'h1 : 32'h0;
           else
              br_sig = (sub_result[31]) ? 32'h1 : 32'h0;
        end
        
     3'b101:
        begin
           if (operand1[31] != operand2[31])
              br_sig = operand1[31] ? 32'h0 : 32'h1;
           else
              br_sig = sub_result[31] ? 32'h0 : 32'h1;
        end
        
     3'b110:
        begin
           br_sig = (operand1 < operand2) ? 32'h1 : 32'h0;
        end
        
     3'b111:
        begin
           br_sig = (operand1 < operand2) ? 32'h0 : 32'h1;
        end
  endcase
end
endmodule





