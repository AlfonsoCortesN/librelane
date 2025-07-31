// ===========================================================================
// Hardware description
// Alfonso Cortés - Inria AIO
// Replace with your design. Notice that pad cells are instantiated in the top module
//
// ===========================================================================


module test_top (
    inout wire          clk_pad,
    inout wire          rst_pad,
    inout wire          start_pad,
    inout wire  [3:0]   data_in_A_pad,
    inout wire  [3:0]   data_in_B_pad,
    inout wire  [7:0]   data_out_pad
);
    wire clk, rst, start;
    wire [3:0] data_in_A, data_in_B;
    wire [7:0] data_out;

    
    (* keep *)
    sg13g2_IOPadVdd sg13g2_IOPad_vdd ();

    (* keep *)
    sg13g2_IOPadVss sg13g2_IOPad_vss ();

    (* keep *)
    sg13g2_IOPadIOVss sg13g2_IOPad_vssio ();

    (* keep *)
    sg13g2_IOPadIOVdd sg13g2_IOPad_vddio ();

    test my_module(
        .clk(clk),
        .rst(rst),
        .start(start),
        .data_in_A(data_in_A[3:0]),
        .data_in_B(data_in_B[3:0]),
        .data_out(data_out[7:0])
    );

    sg13g2_IOPadIn sg13g2_IOPad_clock (
        .p2c(clk),
        .pad(clk_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_reset (
        .p2c(rst),
        .pad(rst_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_start (
        .p2c(start),
        .pad(start_pad)
    );
    generate
        for (genvar i=0; i<4; i++) begin : sg13g2_IOPad_gen
          sg13g2_IOPadIn sg13g2_IOPad_in_A (
            .p2c(data_in_A[i]),
            .pad(data_in_A_pad[i])
          );
          sg13g2_IOPadIn sg13g2_IOPad_in_B (
            .p2c(data_in_B[i]),
            .pad(data_in_B_pad[i])
          );
        end
        for (genvar i=0; i<8; i++) begin : sg13g2_IOPad_gen2
          sg13g2_IOPadOut30mA sg13g2_IOPad_out (
            .c2p(data_out[i]),
            .pad(data_out_pad[i])
          );
        end
    endgenerate


endmodule


module test (
    input  wire         clk,
    input  wire         rst,
    input  wire         start,
    input  wire  [3:0]  data_in_A,
    input  wire  [3:0]  data_in_B,
    output wire  [7:0]  data_out
);

    wire [3:0] in_A, in_B;
    reg [7:0] out, next_out;
    assign data_out[7:0] = out[7:0];

    always @(*) begin
        if(start == 1'b1)
            next_out[7:0] = in_A[3:0] * in_B[3:0];
        else
            next_out[7:0] = out[7:0];
    end

    always @(posedge clk) begin
        in_A[3:0] <= data_in_A[3:0];
        in_B[3:0] <= data_in_B[3:0];
        if(rst == 1'b1)
            out[7:0]  <= 8'b0;
        else 
            out[7:0] <= next_out[7:0];
    end

endmodule
