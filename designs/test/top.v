

module topmodule(
  input  [5:0]  RW0_addr,
  input         RW0_clk,
  input  [20:0] RW0_wdata,
  output [20:0] RW0_rdata,
  input         RW0_en,
  input         RW0_wmode
);
  wire [5:0] mem_0_0_A_ADDR;
  wire  mem_0_0_A_CLK;
  wire [63:0] mem_0_0_A_DIN;
  wire [63:0] mem_0_0_A_DOUT;
  wire  mem_0_0_A_MEN;
  wire  mem_0_0_A_REN;
  wire  mem_0_0_A_WEN;
  wire [63:0] mem_0_0_A_BM;
  wire  mem_0_0_A_DLY;
  RM_IHPSG13_1P_64x64_c2_bm_bist mem_0_0 (
    .A_ADDR(mem_0_0_A_ADDR),
    .A_CLK(mem_0_0_A_CLK),
    .A_DIN(mem_0_0_A_DIN),
    .A_DOUT(mem_0_0_A_DOUT),
    .A_MEN(mem_0_0_A_MEN),
    .A_REN(mem_0_0_A_REN),
    .A_WEN(mem_0_0_A_WEN),
    .A_BM(mem_0_0_A_BM),
    .A_DLY(mem_0_0_A_DLY)
  );
  assign RW0_rdata = mem_0_0_A_DOUT[20:0];
  assign mem_0_0_A_ADDR = RW0_addr;
  assign mem_0_0_A_CLK = RW0_clk;
  assign mem_0_0_A_DIN = {{43'd0}, RW0_wdata};
  assign mem_0_0_A_MEN = RW0_en;
  assign mem_0_0_A_REN = ~RW0_wmode & RW0_en;
  assign mem_0_0_A_WEN = RW0_wmode;
  assign mem_0_0_A_BM = 64'hffffffffffffffff;
  assign mem_0_0_A_DLY = 1'h1;
endmodule