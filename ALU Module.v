//ALU Module
//Author: Shameer Hussain
//Dated: 24th May 2023
//Intel Quartus Prime Lite


//------------------------------------------------------------------------------------

`timescale 1ns / 1ps

module ALU(
input [2:0] funct3,
input funct7_bit5,
input [31:0] operand1,
input [31:0] operand2,
output reg [31:0] ALU_result
);
	reg [31:0] sub_result;
	wire [31:0] SLL_result;
	wire [31:0] SR_result;

	SLL a0 (.operand1(operand1), .operand2(operand2), .result(SLL_result));
	ShiftRight a1 (.operand1(operand1), .operand2(operand2), .funct7_bit5(funct7_bit5), .result(SR_result));

 always @(*) begin
 sub_result = operand1 - operand2;

	  case (funct3)
     // addition/subtraction
     3'b000:
        begin
           case (funct7_bit5)
              1'b0: ALU_result = operand1 + operand2;
              1'b1: ALU_result = sub_result;
           endcase
        end
        
     // Left Shift (one cycle)
     3'b001:
        begin
           ALU_result = SLL_result;
        end
        
     // set if less than (signed comparison)
     3'b010:
        begin
           if (operand1[31] != operand2[31])
              ALU_result = operand1[31] ? 32'h1 : 32'h0;
           else
              ALU_result = sub_result[31] ? 32'h1 : 32'h0;
        end
        
     // set if less than (unsigned comparison)
     3'b011:
        begin
           ALU_result = (operand1 < operand2) ? 32'h1 : 32'h0;
        end
        
     // XOR
     3'b100:
        begin
           ALU_result = operand1 ^ operand2;
        end
        
     // shift right logical and arithmetic
     3'b101:
        begin
           ALU_result = SR_result;
        end
        
     // OR
     3'b110:
        begin
           ALU_result = operand1 | operand2;
        end
        
     // AND
     3'b111:
        begin
           ALU_result = operand1 & operand2;
        end
  endcase

end
endmodule