// ===========================================================================
// Hardware description with SRAM
// Alfonso Cortés - Inria AIO
// PDK: IHP-sg13g2
// Replace with your design.
//
// ===========================================================================


module test (
    input  wire         clk,
    input  wire         rst,
    input  wire         enable,
	input  wire			write,
    input  wire  [15:0] data_in,
    output wire  [15:0] data_out
);

    reg [15:0] data_in_reg;
    reg [10:0] counter, counter_next;

    always @(*) begin
        if(enable)
            counter_next[10:0] = counter[10:0] + 1;
        else
            counter_next[10:0] = counter[10:0];
    end

    always @(posedge clk) begin
        data_in_reg[15:0] <= data_in[15:0];
        if(rst == 1'b1)
            counter[10:0] <= 11'h7FA;
        else 
            counter[10:0] <= counter_next[10:0];
    end
        
	wire [15:0] read_data;
	assign data_out[15:0] = read_data[15:8] * read_data[7:0];
	
    sram_block memory(
		.clk(clk),
		.rst(rst),
    	.write_en(write),
    	.address(counter[10:0]),
    	.write_data(data_in_reg[15:0]),
    	.read_data(read_data[15:0])	
	);

endmodule


module sram_block(
    input  wire         clk,
    input  wire         rst,
    input  wire         write_en,
    input  wire  [10:0]  address,
    input  wire  [15:0] write_data,
    output wire  [15:0] read_data	
);
	
	wire sram_en;
    wire bank_0_en, bank_1_en;
    reg prev_bank;
    wire [15:0] read_data_0, read_data_1;
	assign sram_en = 1'b1;
    assign bank_0_en = address[10] == 1'b0;
    assign bank_1_en = address[10] == 1'b1;

    always @(posedge clk) begin
        if (rst) begin
            prev_bank <= 1'b0;
        end 
        else begin
            prev_bank <= address[10];
        end
    end

    assign read_data[15:0] = prev_bank ? read_data_1[15:0] : read_data_0[15:0];
	
	RM_IHPSG13_1P_1024x16_c2_bm_bist sram_0 (
        .A_CLK      (clk),
        .A_MEN      (bank_0_en && sram_en),
        .A_WEN      (bank_0_en && write_en),
        .A_REN      (bank_0_en && !write_en),
        .A_ADDR     (address[9:0]),
        .A_DIN      (write_data[15:0]),
        .A_DLY      (1'b1),
        .A_DOUT     (read_data_0[15:0]),
        .A_BM       (~16'b0),

        .A_BIST_EN      (1'b0),
        .A_BIST_CLK     (1'b0),
        .A_BIST_MEN     (1'b0),
        .A_BIST_WEN     (1'b0),
        .A_BIST_REN     (1'b0),
        .A_BIST_ADDR    (10'd0),
        .A_BIST_DIN     (16'd0),
        .A_BIST_BM      (16'd0)
    );
	
	RM_IHPSG13_1P_1024x16_c2_bm_bist sram_1 (
        .A_CLK      (clk),
        .A_MEN      (bank_1_en && sram_en),
        .A_WEN      (bank_1_en && write_en),
        .A_REN      (bank_1_en && !write_en),
        .A_ADDR     (address[9:0]),
        .A_DIN      (write_data[15:0]),
        .A_DLY      (1'b1),
        .A_DOUT     (read_data_1[15:0]),
        .A_BM       (~16'b0),

        .A_BIST_EN      (1'b0),
        .A_BIST_CLK     (1'b0),
        .A_BIST_MEN     (1'b0),
        .A_BIST_WEN     (1'b0),
        .A_BIST_REN     (1'b0),
        .A_BIST_ADDR    (10'd0),
        .A_BIST_DIN     (16'd0),
        .A_BIST_BM      (16'd0)
    );
endmodule