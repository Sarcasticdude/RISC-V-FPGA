//Data Memory Module
//Author: Muhammad Aqdas Chaudhary
//Dated: 26th May 2023
//Intel Quartus Prime Lite


//------------------------------------------------------------------------------------

module DataMem(
   input [31:0] datamem_in,
   input [7:0] addr_sel,
   input re,
   input we,
   input [2:0] funct_3,
   output reg [31:0] datamem_out
);
   reg [7:0] data_mem [0:128];
   
   always @(*) begin
      if (we) begin
         case (funct_3)
            3'b000: data_mem[addr_sel] = datamem_in[7:0];
            3'b001: begin
               data_mem[addr_sel] = datamem_in[7:0];
               data_mem[addr_sel+1] = datamem_in[15:8];
            end
            3'b010: begin
               data_mem[addr_sel] = datamem_in[7:0];
               data_mem[addr_sel+7'b1] = datamem_in[15:8];
               data_mem[addr_sel+7'b10] = datamem_in[23:16];
               data_mem[addr_sel+7'b11] = datamem_in[31:24];
            end
         endcase
      end
      
      if (re) begin
         case (funct_3)
            3'b000: begin 
               if (data_mem[addr_sel][7]) 
                  datamem_out = {24'hffffff, data_mem[addr_sel]};
               else 
                  datamem_out = {24'h000000, data_mem[addr_sel]};
            end
            3'b001: begin
               if (data_mem[addr_sel+1][7])
                  datamem_out = {24'hffff, data_mem[addr_sel+1], data_mem[addr_sel]};
               else
                  datamem_out = {24'h0000, data_mem[addr_sel+1], data_mem[addr_sel]};
            end
            3'b010: begin
               datamem_out = {data_mem[addr_sel+3], data_mem[addr_sel+2], data_mem[addr_sel+1], data_mem[addr_sel]};
            end
            3'b100: begin
               datamem_out = {24'h000000, data_mem[addr_sel]};
            end
            3'b101: begin
               datamem_out = {24'h0000, data_mem[addr_sel+1], data_mem[addr_sel]};
            end
         endcase
      end
   end
endmodule
