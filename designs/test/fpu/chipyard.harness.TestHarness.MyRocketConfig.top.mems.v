module rockettile_dcache_data_arrays_0_ext(
  input  [10:0] RW0_addr,
  input         RW0_clk,
  input  [63:0] RW0_wdata,
  output [63:0] RW0_rdata,
  input         RW0_en,
  input         RW0_wmode,
  input  [7:0]  RW0_wmask
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [9:0] mem_0_0_A_ADDR;
  wire  mem_0_0_A_CLK;
  wire [15:0] mem_0_0_A_DIN;
  wire [15:0] mem_0_0_A_DOUT;
  wire  mem_0_0_A_MEN;
  wire  mem_0_0_A_REN;
  wire  mem_0_0_A_WEN;
  wire [15:0] mem_0_0_A_BM;
  wire  mem_0_0_A_DLY;
  wire [9:0] mem_0_1_A_ADDR;
  wire  mem_0_1_A_CLK;
  wire [15:0] mem_0_1_A_DIN;
  wire [15:0] mem_0_1_A_DOUT;
  wire  mem_0_1_A_MEN;
  wire  mem_0_1_A_REN;
  wire  mem_0_1_A_WEN;
  wire [15:0] mem_0_1_A_BM;
  wire  mem_0_1_A_DLY;
  wire [9:0] mem_0_2_A_ADDR;
  wire  mem_0_2_A_CLK;
  wire [15:0] mem_0_2_A_DIN;
  wire [15:0] mem_0_2_A_DOUT;
  wire  mem_0_2_A_MEN;
  wire  mem_0_2_A_REN;
  wire  mem_0_2_A_WEN;
  wire [15:0] mem_0_2_A_BM;
  wire  mem_0_2_A_DLY;
  wire [9:0] mem_0_3_A_ADDR;
  wire  mem_0_3_A_CLK;
  wire [15:0] mem_0_3_A_DIN;
  wire [15:0] mem_0_3_A_DOUT;
  wire  mem_0_3_A_MEN;
  wire  mem_0_3_A_REN;
  wire  mem_0_3_A_WEN;
  wire [15:0] mem_0_3_A_BM;
  wire  mem_0_3_A_DLY;
  wire [9:0] mem_1_0_A_ADDR;
  wire  mem_1_0_A_CLK;
  wire [15:0] mem_1_0_A_DIN;
  wire [15:0] mem_1_0_A_DOUT;
  wire  mem_1_0_A_MEN;
  wire  mem_1_0_A_REN;
  wire  mem_1_0_A_WEN;
  wire [15:0] mem_1_0_A_BM;
  wire  mem_1_0_A_DLY;
  wire [9:0] mem_1_1_A_ADDR;
  wire  mem_1_1_A_CLK;
  wire [15:0] mem_1_1_A_DIN;
  wire [15:0] mem_1_1_A_DOUT;
  wire  mem_1_1_A_MEN;
  wire  mem_1_1_A_REN;
  wire  mem_1_1_A_WEN;
  wire [15:0] mem_1_1_A_BM;
  wire  mem_1_1_A_DLY;
  wire [9:0] mem_1_2_A_ADDR;
  wire  mem_1_2_A_CLK;
  wire [15:0] mem_1_2_A_DIN;
  wire [15:0] mem_1_2_A_DOUT;
  wire  mem_1_2_A_MEN;
  wire  mem_1_2_A_REN;
  wire  mem_1_2_A_WEN;
  wire [15:0] mem_1_2_A_BM;
  wire  mem_1_2_A_DLY;
  wire [9:0] mem_1_3_A_ADDR;
  wire  mem_1_3_A_CLK;
  wire [15:0] mem_1_3_A_DIN;
  wire [15:0] mem_1_3_A_DOUT;
  wire  mem_1_3_A_MEN;
  wire  mem_1_3_A_REN;
  wire  mem_1_3_A_WEN;
  wire [15:0] mem_1_3_A_BM;
  wire  mem_1_3_A_DLY;
  wire  RW0_addr_sel = RW0_addr[10];
  reg  RW0_addr_sel_reg;
  wire [15:0] RW0_rdata_0_0 = mem_0_0_A_DOUT;
  wire [15:0] RW0_rdata_0_1 = mem_0_1_A_DOUT;
  wire [15:0] RW0_rdata_0_2 = mem_0_2_A_DOUT;
  wire [15:0] RW0_rdata_0_3 = mem_0_3_A_DOUT;
  wire [63:0] RW0_rdata_0 = {RW0_rdata_0_3,RW0_rdata_0_2,RW0_rdata_0_1,RW0_rdata_0_0};
  wire [15:0] RW0_rdata_1_0 = mem_1_0_A_DOUT;
  wire [15:0] RW0_rdata_1_1 = mem_1_1_A_DOUT;
  wire [15:0] RW0_rdata_1_2 = mem_1_2_A_DOUT;
  wire [15:0] RW0_rdata_1_3 = mem_1_3_A_DOUT;
  wire [63:0] RW0_rdata_1 = {RW0_rdata_1_3,RW0_rdata_1_2,RW0_rdata_1_1,RW0_rdata_1_0};
  wire [9:0] _GEN_28 = {RW0_wmask[1],RW0_wmask[1],RW0_wmask[0],RW0_wmask[0],RW0_wmask[0],RW0_wmask[0],RW0_wmask[0],
    RW0_wmask[0],RW0_wmask[0],RW0_wmask[0]};
  wire [14:0] _GEN_38 = {RW0_wmask[1],RW0_wmask[1],RW0_wmask[1],RW0_wmask[1],RW0_wmask[1],_GEN_28};
  wire [9:0] _GEN_63 = {RW0_wmask[3],RW0_wmask[3],RW0_wmask[2],RW0_wmask[2],RW0_wmask[2],RW0_wmask[2],RW0_wmask[2],
    RW0_wmask[2],RW0_wmask[2],RW0_wmask[2]};
  wire [14:0] _GEN_73 = {RW0_wmask[3],RW0_wmask[3],RW0_wmask[3],RW0_wmask[3],RW0_wmask[3],_GEN_63};
  wire [9:0] _GEN_98 = {RW0_wmask[5],RW0_wmask[5],RW0_wmask[4],RW0_wmask[4],RW0_wmask[4],RW0_wmask[4],RW0_wmask[4],
    RW0_wmask[4],RW0_wmask[4],RW0_wmask[4]};
  wire [14:0] _GEN_108 = {RW0_wmask[5],RW0_wmask[5],RW0_wmask[5],RW0_wmask[5],RW0_wmask[5],_GEN_98};
  wire [9:0] _GEN_133 = {RW0_wmask[7],RW0_wmask[7],RW0_wmask[6],RW0_wmask[6],RW0_wmask[6],RW0_wmask[6],RW0_wmask[6],
    RW0_wmask[6],RW0_wmask[6],RW0_wmask[6]};
  wire [14:0] _GEN_143 = {RW0_wmask[7],RW0_wmask[7],RW0_wmask[7],RW0_wmask[7],RW0_wmask[7],_GEN_133};
  RM_IHPSG13_1P_1024x16_c2_bm_bist mem_0_0 (
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
  RM_IHPSG13_1P_1024x16_c2_bm_bist mem_0_1 (
    .A_ADDR(mem_0_1_A_ADDR),
    .A_CLK(mem_0_1_A_CLK),
    .A_DIN(mem_0_1_A_DIN),
    .A_DOUT(mem_0_1_A_DOUT),
    .A_MEN(mem_0_1_A_MEN),
    .A_REN(mem_0_1_A_REN),
    .A_WEN(mem_0_1_A_WEN),
    .A_BM(mem_0_1_A_BM),
    .A_DLY(mem_0_1_A_DLY)
  );
  RM_IHPSG13_1P_1024x16_c2_bm_bist mem_0_2 (
    .A_ADDR(mem_0_2_A_ADDR),
    .A_CLK(mem_0_2_A_CLK),
    .A_DIN(mem_0_2_A_DIN),
    .A_DOUT(mem_0_2_A_DOUT),
    .A_MEN(mem_0_2_A_MEN),
    .A_REN(mem_0_2_A_REN),
    .A_WEN(mem_0_2_A_WEN),
    .A_BM(mem_0_2_A_BM),
    .A_DLY(mem_0_2_A_DLY)
  );
  RM_IHPSG13_1P_1024x16_c2_bm_bist mem_0_3 (
    .A_ADDR(mem_0_3_A_ADDR),
    .A_CLK(mem_0_3_A_CLK),
    .A_DIN(mem_0_3_A_DIN),
    .A_DOUT(mem_0_3_A_DOUT),
    .A_MEN(mem_0_3_A_MEN),
    .A_REN(mem_0_3_A_REN),
    .A_WEN(mem_0_3_A_WEN),
    .A_BM(mem_0_3_A_BM),
    .A_DLY(mem_0_3_A_DLY)
  );
  RM_IHPSG13_1P_1024x16_c2_bm_bist mem_1_0 (
    .A_ADDR(mem_1_0_A_ADDR),
    .A_CLK(mem_1_0_A_CLK),
    .A_DIN(mem_1_0_A_DIN),
    .A_DOUT(mem_1_0_A_DOUT),
    .A_MEN(mem_1_0_A_MEN),
    .A_REN(mem_1_0_A_REN),
    .A_WEN(mem_1_0_A_WEN),
    .A_BM(mem_1_0_A_BM),
    .A_DLY(mem_1_0_A_DLY)
  );
  RM_IHPSG13_1P_1024x16_c2_bm_bist mem_1_1 (
    .A_ADDR(mem_1_1_A_ADDR),
    .A_CLK(mem_1_1_A_CLK),
    .A_DIN(mem_1_1_A_DIN),
    .A_DOUT(mem_1_1_A_DOUT),
    .A_MEN(mem_1_1_A_MEN),
    .A_REN(mem_1_1_A_REN),
    .A_WEN(mem_1_1_A_WEN),
    .A_BM(mem_1_1_A_BM),
    .A_DLY(mem_1_1_A_DLY)
  );
  RM_IHPSG13_1P_1024x16_c2_bm_bist mem_1_2 (
    .A_ADDR(mem_1_2_A_ADDR),
    .A_CLK(mem_1_2_A_CLK),
    .A_DIN(mem_1_2_A_DIN),
    .A_DOUT(mem_1_2_A_DOUT),
    .A_MEN(mem_1_2_A_MEN),
    .A_REN(mem_1_2_A_REN),
    .A_WEN(mem_1_2_A_WEN),
    .A_BM(mem_1_2_A_BM),
    .A_DLY(mem_1_2_A_DLY)
  );
  RM_IHPSG13_1P_1024x16_c2_bm_bist mem_1_3 (
    .A_ADDR(mem_1_3_A_ADDR),
    .A_CLK(mem_1_3_A_CLK),
    .A_DIN(mem_1_3_A_DIN),
    .A_DOUT(mem_1_3_A_DOUT),
    .A_MEN(mem_1_3_A_MEN),
    .A_REN(mem_1_3_A_REN),
    .A_WEN(mem_1_3_A_WEN),
    .A_BM(mem_1_3_A_BM),
    .A_DLY(mem_1_3_A_DLY)
  );
  assign RW0_rdata = ~RW0_addr_sel_reg ? RW0_rdata_0 : RW0_addr_sel_reg ? RW0_rdata_1 : 64'h0;
  assign mem_0_0_A_ADDR = RW0_addr[9:0];
  assign mem_0_0_A_CLK = RW0_clk;
  assign mem_0_0_A_DIN = RW0_wdata[15:0];
  assign mem_0_0_A_MEN = RW0_en & ~RW0_addr_sel;
  assign mem_0_0_A_REN = ~RW0_wmode & RW0_en & ~RW0_addr_sel;
  assign mem_0_0_A_WEN = RW0_wmode & ~RW0_addr_sel;
  assign mem_0_0_A_BM = {RW0_wmask[1],_GEN_38};
  assign mem_0_0_A_DLY = 1'h1;
  assign mem_0_1_A_ADDR = RW0_addr[9:0];
  assign mem_0_1_A_CLK = RW0_clk;
  assign mem_0_1_A_DIN = RW0_wdata[31:16];
  assign mem_0_1_A_MEN = RW0_en & ~RW0_addr_sel;
  assign mem_0_1_A_REN = ~RW0_wmode & RW0_en & ~RW0_addr_sel;
  assign mem_0_1_A_WEN = RW0_wmode & ~RW0_addr_sel;
  assign mem_0_1_A_BM = {RW0_wmask[3],_GEN_73};
  assign mem_0_1_A_DLY = 1'h1;
  assign mem_0_2_A_ADDR = RW0_addr[9:0];
  assign mem_0_2_A_CLK = RW0_clk;
  assign mem_0_2_A_DIN = RW0_wdata[47:32];
  assign mem_0_2_A_MEN = RW0_en & ~RW0_addr_sel;
  assign mem_0_2_A_REN = ~RW0_wmode & RW0_en & ~RW0_addr_sel;
  assign mem_0_2_A_WEN = RW0_wmode & ~RW0_addr_sel;
  assign mem_0_2_A_BM = {RW0_wmask[5],_GEN_108};
  assign mem_0_2_A_DLY = 1'h1;
  assign mem_0_3_A_ADDR = RW0_addr[9:0];
  assign mem_0_3_A_CLK = RW0_clk;
  assign mem_0_3_A_DIN = RW0_wdata[63:48];
  assign mem_0_3_A_MEN = RW0_en & ~RW0_addr_sel;
  assign mem_0_3_A_REN = ~RW0_wmode & RW0_en & ~RW0_addr_sel;
  assign mem_0_3_A_WEN = RW0_wmode & ~RW0_addr_sel;
  assign mem_0_3_A_BM = {RW0_wmask[7],_GEN_143};
  assign mem_0_3_A_DLY = 1'h1;
  assign mem_1_0_A_ADDR = RW0_addr[9:0];
  assign mem_1_0_A_CLK = RW0_clk;
  assign mem_1_0_A_DIN = RW0_wdata[15:0];
  assign mem_1_0_A_MEN = RW0_en & RW0_addr_sel;
  assign mem_1_0_A_REN = ~RW0_wmode & RW0_en & RW0_addr_sel;
  assign mem_1_0_A_WEN = RW0_wmode & RW0_addr_sel;
  assign mem_1_0_A_BM = {RW0_wmask[1],_GEN_38};
  assign mem_1_0_A_DLY = 1'h1;
  assign mem_1_1_A_ADDR = RW0_addr[9:0];
  assign mem_1_1_A_CLK = RW0_clk;
  assign mem_1_1_A_DIN = RW0_wdata[31:16];
  assign mem_1_1_A_MEN = RW0_en & RW0_addr_sel;
  assign mem_1_1_A_REN = ~RW0_wmode & RW0_en & RW0_addr_sel;
  assign mem_1_1_A_WEN = RW0_wmode & RW0_addr_sel;
  assign mem_1_1_A_BM = {RW0_wmask[3],_GEN_73};
  assign mem_1_1_A_DLY = 1'h1;
  assign mem_1_2_A_ADDR = RW0_addr[9:0];
  assign mem_1_2_A_CLK = RW0_clk;
  assign mem_1_2_A_DIN = RW0_wdata[47:32];
  assign mem_1_2_A_MEN = RW0_en & RW0_addr_sel;
  assign mem_1_2_A_REN = ~RW0_wmode & RW0_en & RW0_addr_sel;
  assign mem_1_2_A_WEN = RW0_wmode & RW0_addr_sel;
  assign mem_1_2_A_BM = {RW0_wmask[5],_GEN_108};
  assign mem_1_2_A_DLY = 1'h1;
  assign mem_1_3_A_ADDR = RW0_addr[9:0];
  assign mem_1_3_A_CLK = RW0_clk;
  assign mem_1_3_A_DIN = RW0_wdata[63:48];
  assign mem_1_3_A_MEN = RW0_en & RW0_addr_sel;
  assign mem_1_3_A_REN = ~RW0_wmode & RW0_en & RW0_addr_sel;
  assign mem_1_3_A_WEN = RW0_wmode & RW0_addr_sel;
  assign mem_1_3_A_BM = {RW0_wmask[7],_GEN_143};
  assign mem_1_3_A_DLY = 1'h1;
  always @(posedge RW0_clk) begin
    if (RW0_en) begin
      RW0_addr_sel_reg <= RW0_addr_sel;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  RW0_addr_sel_reg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule


module rockettile_icache_tag_array_0_ext(
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


module rockettile_icache_data_arrays_0_0_ext(
  input  [8:0]  RW0_addr,
  input         RW0_clk,
  input  [31:0] RW0_wdata,
  output [31:0] RW0_rdata,
  input         RW0_en,
  input         RW0_wmode
);
  wire [8:0] mem_0_0_A_ADDR;
  wire  mem_0_0_A_CLK;
  wire [31:0] mem_0_0_A_DIN;
  wire [31:0] mem_0_0_A_DOUT;
  wire  mem_0_0_A_MEN;
  wire  mem_0_0_A_REN;
  wire  mem_0_0_A_WEN;
  wire [31:0] mem_0_0_A_BM;
  wire  mem_0_0_A_DLY;
  RM_IHPSG13_1P_512x32_c2_bm_bist mem_0_0 (
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
  assign RW0_rdata = mem_0_0_A_DOUT;
  assign mem_0_0_A_ADDR = RW0_addr;
  assign mem_0_0_A_CLK = RW0_clk;
  assign mem_0_0_A_DIN = RW0_wdata;
  assign mem_0_0_A_MEN = RW0_en;
  assign mem_0_0_A_REN = ~RW0_wmode & RW0_en;
  assign mem_0_0_A_WEN = RW0_wmode;
  assign mem_0_0_A_BM = 32'hffffffff;
  assign mem_0_0_A_DLY = 1'h1;
endmodule

