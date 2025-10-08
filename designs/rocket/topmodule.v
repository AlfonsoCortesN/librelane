// ===========================================================================
// Hardware description
// Alfonso Cortés - Inria AIO
// Replace with your design. Notice that pad cells are instantiated in the top module
//
// ===========================================================================


module topmodule (
    inout wire          clock_pad,
    inout wire          reset_pad,
    inout wire			clock_tap_pad,
    inout wire			uart_tx_pad,
    inout wire			uart_rx_pad,
    inout wire			boot_pad,
    inout wire			jtag_TCK_pad,
    inout wire			jtag_TMS_pad,
    inout wire			jtag_TDI_pad,
    inout wire			jtag_TDO_pad,
    inout wire			stl_in_ready_pad,
    inout wire			stl_in_valid_pad,
    inout wire  [31:0]  stl_in_bits_pad,
    inout wire			stl_out_ready_pad,
    inout wire			stl_out_valid_pad,
    inout wire  [31:0]  stl_out_bits_pad,
    inout wire			stl_clock_pad
);
    wire clock, reset, clock_tap;
	wire uart_tx, uart_rx, boot;
	wire jtag_TCK, jtag_TMS, jtag_TDI, jtag_TDO;
    wire stl_in_ready, stl_in_valid, stl_out_ready, stl_out_valid, stl_clock;
	wire [31:0] stl_in_bits, stl_out_bits;

    (* keep *)
    sg13g2_IOPadVdd sg13g2_IOPad_vdd ();

    (* keep *)
    sg13g2_IOPadVss sg13g2_IOPad_vss ();

    (* keep *)
    sg13g2_IOPadIOVss sg13g2_IOPad_vssio ();

    (* keep *)
    sg13g2_IOPadIOVdd sg13g2_IOPad_vddio ();

    ChipTop chip_top (	// 
        .clock_uncore              (clock),	// 
        .reset_io                  (reset),
        .clock_tap                 (clock_tap),	// 1 output
        .uart_0_txd                (uart_tx),	// 1 output
        .uart_0_rxd                (uart_rx),	// 1 input
        .custom_boot               (boot),	// 1 input
        .jtag_TCK                  (jtag_TCK),	// 1 input
        .jtag_TMS                  (jtag_TMS),	// 1 input
        .jtag_TDI                  (jtag_TDI),	// 1 input
        .jtag_TDO                  (jtag_TDO),	// 1 output
        .serial_tl_0_in_ready      (stl_in_ready),	// 1 output
        .serial_tl_0_in_valid      (stl_in_valid),	// 1 input
        .serial_tl_0_in_bits_phit  (stl_in_bits),	// 32 input
        .serial_tl_0_out_ready     (stl_out_ready),	// 1 input
        .serial_tl_0_out_valid     (stl_out_valid),	// 1 output
        .serial_tl_0_out_bits_phit (stl_out_bits),	// 32 output
        .serial_tl_0_clock_in      (stl_clock)	// 1 input
    );	

    sg13g2_IOPadIn sg13g2_IOPad_clock (
        .p2c(clock),
        .pad(clock_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_reset (
        .p2c(reset),
        .pad(reset_pad)
    );
    sg13g2_IOPadOut30mA sg13g2_IOPad_clock_tap (
        .c2p(clock_tap),
        .pad(clock_tap_pad)
    );
    sg13g2_IOPadOut30mA sg13g2_IOPad_uart_tx (
        .c2p(uart_tx),
        .pad(uart_tx_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_uart_rx (
        .p2c(uart_rx),
        .pad(uart_rx_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_boot (
        .p2c(boot),
        .pad(boot_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_jtag_TCK (
        .p2c(jtag_TCK),
        .pad(jtag_TCK_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_jtag_TMS (
        .p2c(jtag_TMS),
        .pad(jtag_TMS_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_jtag_TDI (
        .p2c(jtag_TDI),
        .pad(jtag_TDI_pad)
    );
    sg13g2_IOPadOut30mA sg13g2_IOPad_jtag_TDO (
        .c2p(jtag_TDO),
        .pad(jtag_TDO_pad)
    );
	
    generate
        for (genvar i=0; i<32; i++) begin : sg13g2_IOPad_gen
          sg13g2_IOPadIn sg13g2_IOPad_stl_in_bits (
            .p2c(stl_in_bits[i]),
            .pad(stl_in_bits_pad[i])
          );
          sg13g2_IOPadOut30mA sg13g2_IOPad_stl_out_bits (
            .c2p(stl_out_bits[i]),
            .pad(stl_out_bits_pad[i])
          );
        end
    endgenerate

    sg13g2_IOPadOut30mA sg13g2_IOPad_stl_in_ready (
        .c2p(stl_in_ready),
        .pad(stl_in_ready_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_stl_in_valid (
        .p2c(stl_in_valid),
        .pad(stl_in_valid_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_stl_out_ready (
        .p2c(stl_out_ready),
        .pad(stl_out_ready_pad)
    );
    sg13g2_IOPadOut30mA sg13g2_IOPad_stl_out_valid (
        .c2p(stl_out_valid),
        .pad(stl_out_valid_pad)
    );
    sg13g2_IOPadIn sg13g2_IOPad_stl_clock (
        .p2c(stl_clock),
        .pad(stl_clock_pad)
    );


endmodule
