// ===========================================================================
// Hardware description with multiple SRAM
// Alfonso Cortés - Inria AIO
// PDK: IHP-sg13g2
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

    reg [63:0] data_in_reg;
    reg [13:0] counter, counter_next;

    always @(*) begin
        if(enable)
            counter_next = counter + 1;
        else
            counter_next = counter;
    end

    always @(posedge clk) begin
        data_in_reg[63:0] <= {data_in_reg[47:0], data_in[15:0]};
        if(rst == 1'b1)
            counter <= 14'h7FA;
        else 
            counter <= counter_next;
    end
        
	wire [63:0] read_data;
	assign data_out[15:0] = read_data[31:16] * read_data[15:0] - read_data[63:48] * read_data[47:32];
	
    DCacheDataArray memory (
        .clock(clk),	// 1 input
        .io_req_valid(1'b1),	// 1 input
        .io_req_bits_addr(counter),	// 14 input
        .io_req_bits_write(write), // 1 input
        .io_req_bits_wdata(data_in_reg),	// 64 input
        .io_req_bits_wordMask(2'b11),	// 2 input
        .io_req_bits_eccMask(4'hF), //4 input
        .io_resp_0(read_data) // 64 output
    );
endmodule
