//Register File Module
//Author: Shameer Hussain
//Dated: 27th May 2023
//Intel Quartus Prime Lite



//------------------------------------------------------------------------------------

module RegFile(
    input [4:0] rs1_sel,
    input [4:0] rs2_sel,
    input [4:0] rd_sel,
    input clk,
    input we,
    input [31:0] rd,
    output reg [31:0] rs1,
    output reg [31:0] rs2
);
    reg [31:0] registers [0:31];
    // initial begin
    //     registers[1] = 32'h00004;
    //     registers[2] = 32'hf0f0f0f0;
    // end
        
    // Read operation
    always @(*) begin
        registers[0] = 0;
        rs1 = registers[rs1_sel];
        rs2 = registers[rs2_sel];
    end
    
    // Write operation
    always @(posedge clk) begin
        if (we) begin
            registers[rd_sel] = rd;
        end
    end
endmodule
