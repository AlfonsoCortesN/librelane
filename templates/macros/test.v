// ===========================================================================
// Hardware description
// Alfonso Cortés - Inria AIO
// Replace with your design.
//
// ===========================================================================


module test (
    input  wire         clk,
    input  wire         rst,
    input  wire         start,
    input  wire  [3:0]  data_in_A,
    input  wire  [3:0]  data_in_B,
    input  wire		    X,
    output wire		    Y,
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
        
    my_cell DUT(
    	.a(X),
    	.b(X),
    	.c(Y),
    	.vh()
    );

endmodule
