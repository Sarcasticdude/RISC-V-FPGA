//Instruction Decoder Module
//Author: Muhammad Aqdas Chaudhary
//Dated: 1st June 2023
//Intel Quartus Prime Lite


//------------------------------------------------------------------------------------

module InstrDecoder(
    output reg we_regfile,
    output reg we_datamem,
    output reg re_datamem,
    output reg [2:0] ALU_sel_1,
    output reg ALU_sel_2,
    output reg we_pc,
    output reg j_pc,
    output reg [1:0] operand1_sel,
    output reg operand2_sel,
    output reg [1:0] rd_sel,
    input [31:0] instrcode
);
    always @(*) begin
        case (instrcode[6:0])
            // R-type
            7'b0110011: begin
                operand1_sel = 2'b00;
                operand2_sel = 1'b0;
                we_regfile = 1'b1;
                ALU_sel_1 = instrcode[14:12];
                ALU_sel_2 = instrcode[30];
                rd_sel = 2'b00;
                we_datamem = 1'b0;
                re_datamem = 1'b0;
                we_pc = 1'b0;
                j_pc = 1'b0;
            end
            
            // I-type
            7'b0010011: begin
                operand1_sel = 2'b00;
                operand2_sel = 1'b1;
                we_regfile = 1'b1;
                ALU_sel_1 = instrcode[14:12];
                ALU_sel_2 = instrcode[30];
                rd_sel = 2'b00;
                we_datamem = 1'b0;
                re_datamem = 1'b0;
                we_pc = 1'b0;
                j_pc = 1'b0;
            end
            
            // S-type
            7'b0100011: begin
                operand1_sel = 2'b00;
                operand2_sel = 1'b1;
                we_regfile = 1'b0;
                we_datamem = 1'b1;
                re_datamem = 1'b0;
                we_pc = 1'b0;
                j_pc = 1'b0;
                rd_sel = 2'b00;
                ALU_sel_1 = 3'b000;
                ALU_sel_2 = 1'b0;
            end
            
            // L-type
            7'b0000011: begin
                operand1_sel = 2'b00;
                operand2_sel = 1'b1;
                we_regfile = 1'b1;
                we_datamem = 1'b0;
                re_datamem = 1'b1;
                we_pc = 1'b0;
                j_pc = 1'b0;
                rd_sel = 2'b01;
                ALU_sel_1 = 3'b000;
                ALU_sel_2 = 1'b0;
            end
            
            // B-type
            7'b1100011: begin
                operand1_sel = 2'b01;
                operand2_sel = 1'b1;
                we_regfile = 1'b0;
                we_datamem = 1'b0;
                re_datamem = 1'b0;
                j_pc = 1'b0;
                we_pc = 1'b1;
                rd_sel = 2'b00;
                ALU_sel_1 = 3'b000;
                ALU_sel_2 = 1'b0;
            end
            
            // JAL
            7'b1101111: begin
                operand1_sel = 2'b01;
                operand2_sel = 1'b1;
                we_regfile = 1'b1;
                we_datamem = 1'b0;
                re_datamem = 1'b0;
                j_pc = 1'b1;
                we_pc = 1'b0;
                ALU_sel_1 = 3'b000;
                ALU_sel_2 = 1'b0;
                rd_sel = 2'b10;
            end
            
            // JALR
            7'b1100111: begin
                operand1_sel = 2'b00;
                operand2_sel = 1'b1;
                we_regfile = 1'b1;
                we_datamem = 1'b0;
                re_datamem = 1'b0;
                j_pc = 1'b1;
                we_pc = 1'b0;
                ALU_sel_1 = 3'b000;
                ALU_sel_2 = 1'b0;
                rd_sel = 2'b10;
            end
            
            // LUI
            7'b0110111: begin
                operand1_sel = 2'b10;
                operand2_sel = 1'b1;
                we_regfile = 1'b1;
                we_datamem = 1'b0;
                re_datamem = 1'b0;
                j_pc = 1'b0;
                we_pc = 1'b0;
                ALU_sel_1 = 3'b000;
                ALU_sel_2 = 1'b0;
                rd_sel = 2'b00;
            end
            
            // AUIPC
            7'b0010111: begin
                operand1_sel = 2'b10;
                operand2_sel = 1'b1;
                we_regfile = 1'b0;
                we_datamem = 1'b0;
                re_datamem = 1'b0;
                rd_sel = 2'b00;
                j_pc = 1'b1;
                we_pc = 1'b0;
                ALU_sel_1 = 3'b000;
                ALU_sel_2 = 1'b0;
            end
        endcase
    end
endmodule
