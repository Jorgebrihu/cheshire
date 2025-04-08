--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
--Date        : Wed May 22 11:05:36 2024
--Host        : cei-HP-ProDesk-600-G5-MT running 64-bit Ubuntu 22.04.4 LTS
--Command     : generate_target system.bd
--Design      : system
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity artico3_module is
  port (
    A3_RESET : in STD_LOGIC;
    A3_ACLK : in STD_LOGIC;

    INTERRUPT : out STD_LOGIC;

    -- Puertos entrada/salida 
    -- AXI-Lite
    S00_AXI_AWADDR : in STD_LOGIC_VECTOR ( 19 downto 0 );
    S00_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_AWVALID : in STD_LOGIC;
    S00_AXI_AWREADY : out STD_LOGIC;
    S00_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_WVALID : in STD_LOGIC;
    S00_AXI_WREADY : out STD_LOGIC;
    S00_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_BVALID : out STD_LOGIC;
    S00_AXI_BREADY : in STD_LOGIC;
    S00_AXI_ARADDR : in STD_LOGIC_VECTOR ( 19 downto 0 );
    S00_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_ARVALID : in STD_LOGIC;
    S00_AXI_ARREADY : out STD_LOGIC;
    S00_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_RVALID : out STD_LOGIC;
    S00_AXI_RREADY : in STD_LOGIC;

    -- AXI4-Full
    S01_AXI_AWID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S01_AXI_AWADDR : in STD_LOGIC_VECTOR ( 19 downto 0 );
    S01_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_AWLOCK : in STD_LOGIC;
    S01_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_AWREGION : in STD_LOGIC_VECTOR ( 3 downto 0 );
    -- S01_AXI_AWUSER : in STD_LOGIC_VECTOR ( 0 TO 0 );
    S01_AXI_AWVALID : in STD_LOGIC;
    S01_AXI_AWREADY : out STD_LOGIC;
    S01_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_WLAST : in STD_LOGIC;
    -- S01_AXI_WUSER : in STD_LOGIC_VECTOR ( 0 TO 0 );
    S01_AXI_WVALID : in STD_LOGIC;
    S01_AXI_WREADY : out STD_LOGIC;
    S01_AXI_BID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S01_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    -- S01_AXI_BUSER : out STD_LOGIC_VECTOR ( 0 TO 0 );
    S01_AXI_BVALID : out STD_LOGIC;
    S01_AXI_BREADY : in STD_LOGIC;
    S01_AXI_ARID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S01_AXI_ARADDR : in STD_LOGIC_VECTOR ( 19 downto 0 );
    S01_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_ARLOCK : in STD_LOGIC;
    S01_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_ARREGION : in STD_LOGIC_VECTOR ( 3 downto 0 );
    -- S01_AXI_ARUSER : in STD_LOGIC_VECTOR ( 0 TO 0 );
    S01_AXI_ARVALID : in STD_LOGIC;
    S01_AXI_ARREADY : out STD_LOGIC;
    S01_AXI_RID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S01_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_RLAST : out STD_LOGIC;
    -- S01_AXI_RUSER : out STD_LOGIC_VECTOR ( 0 TO 0 );
    S01_AXI_RVALID : out STD_LOGIC;
    S01_AXI_RREADY : in STD_LOGIC;

    -- Port for monitoring traces of artico3
    CONCAT_TRACES : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end artico3_module;

architecture STRUCTURE of artico3_module is

  -- signal clk_ila_artico3_module : std_logic; -- señal para introducir el reloj en el ILA

  -- component xlnx_ila_artico3_module
  --   port (
  --       clk    : in std_logic;
  --       probe0 : in std_logic;
  --       probe1 : in std_logic;
  --       probe2 : in std_logic;
  --       probe3 : in std_logic;
  --       probe4 : in std_logic;
  --       probe5 : in std_logic;
  --       probe6 : in std_logic;
  --       probe7 : in std_logic

  --   );
  -- end component;

  component system_artico3_shuffler_0_0 is
  port (
    interrupt : out STD_LOGIC;
    m0_artico3_aclk : out STD_LOGIC;
    m0_artico3_aresetn : out STD_LOGIC;
    m0_artico3_start : out STD_LOGIC;
    m0_artico3_ready : in STD_LOGIC;
    m0_artico3_en : out STD_LOGIC;
    m0_artico3_we : out STD_LOGIC;
    m0_artico3_mode : out STD_LOGIC;
    m0_artico3_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m0_artico3_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m0_artico3_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m1_artico3_aclk : out STD_LOGIC;
    m1_artico3_aresetn : out STD_LOGIC;
    m1_artico3_start : out STD_LOGIC;
    m1_artico3_ready : in STD_LOGIC;
    m1_artico3_en : out STD_LOGIC;
    m1_artico3_we : out STD_LOGIC;
    m1_artico3_mode : out STD_LOGIC;
    m1_artico3_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m1_artico3_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m1_artico3_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m2_artico3_aclk : out STD_LOGIC;
    m2_artico3_aresetn : out STD_LOGIC;
    m2_artico3_start : out STD_LOGIC;
    m2_artico3_ready : in STD_LOGIC;
    m2_artico3_en : out STD_LOGIC;
    m2_artico3_we : out STD_LOGIC;
    m2_artico3_mode : out STD_LOGIC;
    m2_artico3_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m2_artico3_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m2_artico3_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m3_artico3_aclk : out STD_LOGIC;
    m3_artico3_aresetn : out STD_LOGIC;
    m3_artico3_start : out STD_LOGIC;
    m3_artico3_ready : in STD_LOGIC;
    m3_artico3_en : out STD_LOGIC;
    m3_artico3_we : out STD_LOGIC;
    m3_artico3_mode : out STD_LOGIC;
    m3_artico3_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m3_artico3_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m3_artico3_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );

    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s01_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s01_axi_awaddr : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s01_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s01_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s01_axi_awlock : in STD_LOGIC;
    s01_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s01_axi_awvalid : in STD_LOGIC;
    s01_axi_awready : out STD_LOGIC;
    s01_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s01_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_wlast : in STD_LOGIC;
    s01_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s01_axi_wvalid : in STD_LOGIC;
    s01_axi_wready : out STD_LOGIC;
    s01_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s01_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s01_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s01_axi_bvalid : out STD_LOGIC;
    s01_axi_bready : in STD_LOGIC;
    s01_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s01_axi_araddr : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s01_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s01_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s01_axi_arlock : in STD_LOGIC;
    s01_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s01_axi_arvalid : in STD_LOGIC;
    s01_axi_arready : out STD_LOGIC;
    s01_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s01_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s01_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s01_axi_rlast : out STD_LOGIC;
    s01_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s01_axi_rvalid : out STD_LOGIC;
    s01_axi_rready : in STD_LOGIC
  );
  end component system_artico3_shuffler_0_0;

  component system_a3_slot_0_0 is
  port (
    s_artico3_aclk : in STD_LOGIC;
    s_artico3_aresetn : in STD_LOGIC;
    s_artico3_start : in STD_LOGIC;
    s_artico3_ready : out STD_LOGIC;
    s_artico3_en : in STD_LOGIC;
    s_artico3_we : in STD_LOGIC;
    s_artico3_mode : in STD_LOGIC;
    s_artico3_addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_artico3_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_artico3_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component system_a3_slot_0_0;

  component system_a3_slot_1_0 is
  port (
    s_artico3_aclk : in STD_LOGIC;
    s_artico3_aresetn : in STD_LOGIC;
    s_artico3_start : in STD_LOGIC;
    s_artico3_ready : out STD_LOGIC;
    s_artico3_en : in STD_LOGIC;
    s_artico3_we : in STD_LOGIC;
    s_artico3_mode : in STD_LOGIC;
    s_artico3_addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_artico3_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_artico3_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component system_a3_slot_1_0;

  component system_a3_slot_2_0 is
  port (
    s_artico3_aclk : in STD_LOGIC;
    s_artico3_aresetn : in STD_LOGIC;
    s_artico3_start : in STD_LOGIC;
    s_artico3_ready : out STD_LOGIC;
    s_artico3_en : in STD_LOGIC;
    s_artico3_we : in STD_LOGIC;
    s_artico3_mode : in STD_LOGIC;
    s_artico3_addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_artico3_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_artico3_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component system_a3_slot_2_0;

  component system_a3_slot_3_0 is
  port (
    s_artico3_aclk : in STD_LOGIC;
    s_artico3_aresetn : in STD_LOGIC;
    s_artico3_start : in STD_LOGIC;
    s_artico3_ready : out STD_LOGIC;
    s_artico3_en : in STD_LOGIC;
    s_artico3_we : in STD_LOGIC;
    s_artico3_mode : in STD_LOGIC;
    s_artico3_addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_artico3_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_artico3_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component system_a3_slot_3_0;

  signal GENERAL_CLK0 : STD_LOGIC;
  signal GENERAL_aresetn : STD_LOGIC;

  -- Señales para los slots
  signal artico3_shuffler_0_interrupt : STD_LOGIC;

  signal artico3_slot0_artico3_aclk : STD_LOGIC;
  signal artico3_slot0_artico3_addr : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal artico3_slot0_artico3_aresetn : STD_LOGIC;
  signal artico3_slot0_artico3_en : STD_LOGIC;
  signal artico3_slot0_artico3_mode : STD_LOGIC;
  signal artico3_slot0_artico3_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal artico3_slot0_artico3_ready : STD_LOGIC;
  signal artico3_slot0_artico3_start : STD_LOGIC;
  signal artico3_slot0_artico3_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal artico3_slot0_artico3_we : STD_LOGIC;

  signal artico3_slot1_artico3_aclk : STD_LOGIC;
  signal artico3_slot1_artico3_addr : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal artico3_slot1_artico3_aresetn : STD_LOGIC;
  signal artico3_slot1_artico3_en : STD_LOGIC;
  signal artico3_slot1_artico3_mode : STD_LOGIC;
  signal artico3_slot1_artico3_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal artico3_slot1_artico3_ready : STD_LOGIC;
  signal artico3_slot1_artico3_start : STD_LOGIC;
  signal artico3_slot1_artico3_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal artico3_slot1_artico3_we : STD_LOGIC;

  signal artico3_slot2_artico3_aclk : STD_LOGIC;
  signal artico3_slot2_artico3_addr : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal artico3_slot2_artico3_aresetn : STD_LOGIC;
  signal artico3_slot2_artico3_en : STD_LOGIC;
  signal artico3_slot2_artico3_mode : STD_LOGIC;
  signal artico3_slot2_artico3_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal artico3_slot2_artico3_ready : STD_LOGIC;
  signal artico3_slot2_artico3_start : STD_LOGIC;
  signal artico3_slot2_artico3_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal artico3_slot2_artico3_we : STD_LOGIC;

  signal artico3_slot3_artico3_aclk : STD_LOGIC;
  signal artico3_slot3_artico3_addr : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal artico3_slot3_artico3_aresetn : STD_LOGIC;
  signal artico3_slot3_artico3_en : STD_LOGIC;
  signal artico3_slot3_artico3_mode : STD_LOGIC;
  signal artico3_slot3_artico3_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal artico3_slot3_artico3_ready : STD_LOGIC;
  signal artico3_slot3_artico3_start : STD_LOGIC;
  signal artico3_slot3_artico3_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal artico3_slot3_artico3_we : STD_LOGIC;

  -- Señales hacia puertos
  -- Señales "ctrl"
  signal axi_shuffler_S00_AXI_ARADDR : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal axi_shuffler_S00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_shuffler_S00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S00_AXI_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axi_shuffler_S00_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S00_AXI_ARLOCK : STD_LOGIC;
  signal axi_shuffler_S00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_shuffler_S00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S00_AXI_ARREADY : STD_LOGIC;
  signal axi_shuffler_S00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_shuffler_S00_AXI_ARVALID : STD_LOGIC;
  signal axi_shuffler_S00_AXI_AWADDR : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal axi_shuffler_S00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_shuffler_S00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S00_AXI_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axi_shuffler_S00_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_shuffler_S00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_shuffler_S00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S00_AXI_AWREADY : STD_LOGIC;
  signal axi_shuffler_S00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_shuffler_S00_AXI_AWVALID : STD_LOGIC;
  signal axi_shuffler_S00_AXI_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axi_shuffler_S00_AXI_BREADY : STD_LOGIC;
  signal axi_shuffler_S00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_shuffler_S00_AXI_BVALID : STD_LOGIC;
  signal axi_shuffler_S00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_shuffler_S00_AXI_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axi_shuffler_S00_AXI_RLAST : STD_LOGIC;
  signal axi_shuffler_S00_AXI_RREADY : STD_LOGIC;
  signal axi_shuffler_S00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_shuffler_S00_AXI_RVALID : STD_LOGIC;
  signal axi_shuffler_S00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_shuffler_S00_AXI_WLAST : STD_LOGIC;
  signal axi_shuffler_S00_AXI_WREADY : STD_LOGIC;
  signal axi_shuffler_S00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S00_AXI_WVALID : STD_LOGIC;

  -- Señales "data"
  signal axi_shuffler_S01_AXI_ARADDR : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal axi_shuffler_S01_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_shuffler_S01_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S01_AXI_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axi_shuffler_S01_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_shuffler_S01_AXI_ARLOCK : STD_LOGIC;
  signal axi_shuffler_S01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_shuffler_S01_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S01_AXI_ARREADY : STD_LOGIC;
  signal axi_shuffler_S01_AXI_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
  signal axi_shuffler_S01_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_shuffler_S01_AXI_ARVALID : STD_LOGIC;
  signal axi_shuffler_S01_AXI_AWADDR : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal axi_shuffler_S01_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_shuffler_S01_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S01_AXI_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axi_shuffler_S01_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_shuffler_S01_AXI_AWLOCK : STD_LOGIC;
  signal axi_shuffler_S01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_shuffler_S01_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S01_AXI_AWREADY : STD_LOGIC;
  signal axi_shuffler_S01_AXI_AWREGION: STD_LOGIC_VECTOR (3 downto 0);
  signal axi_shuffler_S01_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_shuffler_S01_AXI_AWVALID : STD_LOGIC;
  signal axi_shuffler_S01_AXI_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axi_shuffler_S01_AXI_BREADY : STD_LOGIC;
  signal axi_shuffler_S01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_shuffler_S01_AXI_BVALID : STD_LOGIC;
  signal axi_shuffler_S01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_shuffler_S01_AXI_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axi_shuffler_S01_AXI_RLAST : STD_LOGIC;
  signal axi_shuffler_S01_AXI_RREADY : STD_LOGIC;
  signal axi_shuffler_S01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_shuffler_S01_AXI_RVALID : STD_LOGIC;
  signal axi_shuffler_S01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_shuffler_S01_AXI_WLAST : STD_LOGIC;
  signal axi_shuffler_S01_AXI_WREADY : STD_LOGIC;
  signal axi_shuffler_S01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_shuffler_S01_AXI_WVALID : STD_LOGIC;

  --Signal for concatenated artico3 traces
  signal concat_traces_signal : STD_LOGIC_VECTOR ( 7 downto 0 );

  -- 

  signal NLW_artico3_shuffler_0_s01_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_artico3_shuffler_0_s01_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );

  -- DEBUG --
  -- attribute mark_debug : string;

  -- attribute mark_debug of artico3_slot0_artico3_addr          : signal is "TRUE";
  -- attribute mark_debug of artico3_slot0_artico3_aresetn       : signal is "TRUE";
  -- attribute mark_debug of artico3_slot0_artico3_en            : signal is "TRUE";
  -- attribute mark_debug of artico3_slot0_artico3_mode          : signal is "TRUE";
  -- attribute mark_debug of artico3_slot0_artico3_rdata         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot0_artico3_ready         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot0_artico3_start         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot0_artico3_wdata         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot0_artico3_we            : signal is "TRUE";

  -- attribute mark_debug of artico3_slot1_artico3_addr          : signal is "TRUE";
  -- attribute mark_debug of artico3_slot1_artico3_aresetn       : signal is "TRUE";
  -- attribute mark_debug of artico3_slot1_artico3_en            : signal is "TRUE";
  -- attribute mark_debug of artico3_slot1_artico3_mode          : signal is "TRUE";
  -- attribute mark_debug of artico3_slot1_artico3_rdata         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot1_artico3_ready         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot1_artico3_start         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot1_artico3_wdata         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot1_artico3_we            : signal is "TRUE";

  -- attribute mark_debug of artico3_slot2_artico3_addr          : signal is "TRUE";
  -- attribute mark_debug of artico3_slot2_artico3_aresetn       : signal is "TRUE";
  -- attribute mark_debug of artico3_slot2_artico3_en            : signal is "TRUE";
  -- attribute mark_debug of artico3_slot2_artico3_mode          : signal is "TRUE";
  -- attribute mark_debug of artico3_slot2_artico3_rdata         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot2_artico3_ready         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot2_artico3_start         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot2_artico3_wdata         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot2_artico3_we            : signal is "TRUE";

  -- attribute mark_debug of artico3_slot3_artico3_addr          : signal is "TRUE";
  -- attribute mark_debug of artico3_slot3_artico3_aresetn       : signal is "TRUE";
  -- attribute mark_debug of artico3_slot3_artico3_en            : signal is "TRUE";
  -- attribute mark_debug of artico3_slot3_artico3_mode          : signal is "TRUE";
  -- attribute mark_debug of artico3_slot3_artico3_rdata         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot3_artico3_ready         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot3_artico3_start         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot3_artico3_wdata         : signal is "TRUE";
  -- attribute mark_debug of artico3_slot3_artico3_we            : signal is "TRUE";

  -- attribute mark_debug of axi_shuffler_S01_AXI_ARADDR          : signal is "TRUE";
  -- attribute mark_debug of axi_shuffler_S01_AXI_ARVALID          : signal is "TRUE";
  -- attribute mark_debug of axi_shuffler_S01_AXI_AWADDR          : signal is "TRUE";
  -- attribute mark_debug of axi_shuffler_S01_AXI_AWVALID          : signal is "TRUE";
  -- attribute mark_debug of axi_shuffler_S01_AXI_RDATA          : signal is "TRUE";
  -- attribute mark_debug of axi_shuffler_S01_AXI_RVALID          : signal is "TRUE";
  -- attribute mark_debug of axi_shuffler_S01_AXI_WDATA          : signal is "TRUE";
  -- attribute mark_debug of axi_shuffler_S01_AXI_WVALID          : signal is "TRUE";

  -- attribute mark_debug of concat_traces_signal                 : signal is "TRUE";
  

  
begin

  -- -----------------------------
  -- -- ILA reg_out Instantiate --
  -- -----------------------------

  -- clk_ila_artico3_module <= A3_ACLK;

  -- ila_artico3_module : xlnx_ila_artico3_module
  --     port map (
  --         clk    => clk_ila_artico3_module,          
  --         probe0 => artico3_slot0_artico3_start,         
  --         probe1 => artico3_slot0_artico3_ready,  
  --         probe2 => artico3_slot1_artico3_start,
  --         probe3 => artico3_slot1_artico3_ready,
  --         probe4 => artico3_slot2_artico3_start,
  --         probe5 => artico3_slot2_artico3_ready,
  --         probe6 => artico3_slot3_artico3_start,
  --         probe7 => artico3_slot3_artico3_ready
  -- );

  GENERAL_CLK0 <= A3_ACLK;
  GENERAL_aresetn <= A3_RESET;

  INTERRUPT <= artico3_shuffler_0_interrupt;

  -- Señales hacia shuffler ctrl
  -- Señales IN
  axi_shuffler_S00_AXI_AWADDR(19 downto 0) <= S00_AXI_AWADDR(19 downto 0);
  axi_shuffler_S00_AXI_AWPROT(2 downto 0) <= S00_AXI_AWPROT(2 downto 0);
  axi_shuffler_S00_AXI_AWVALID <= S00_AXI_AWVALID;
  axi_shuffler_S00_AXI_WDATA(31 downto 0) <= S00_AXI_WDATA(31 downto 0);
  axi_shuffler_S00_AXI_WSTRB(3 downto 0) <= S00_AXI_WSTRB(3 downto 0);
  axi_shuffler_S00_AXI_WVALID <= S00_AXI_WVALID;
  axi_shuffler_S00_AXI_BREADY <= S00_AXI_BREADY;
  axi_shuffler_S00_AXI_ARADDR(19 downto 0) <= S00_AXI_ARADDR(19 downto 0);
  axi_shuffler_S00_AXI_ARPROT(2 downto 0) <= S00_AXI_ARPROT(2 downto 0);
  axi_shuffler_S00_AXI_ARVALID <= S00_AXI_ARVALID;
  axi_shuffler_S00_AXI_RREADY <= S00_AXI_RREADY;

  -- Señales OUT
  S00_AXI_AWREADY <= axi_shuffler_S00_AXI_AWREADY;
  S00_AXI_WREADY <= axi_shuffler_S00_AXI_WREADY;
  S00_AXI_BRESP( 1 downto 0 ) <= axi_shuffler_S00_AXI_BRESP(1 downto 0);
  S00_AXI_BVALID <= axi_shuffler_S00_AXI_BVALID;
  S00_AXI_ARREADY <=  axi_shuffler_S00_AXI_ARREADY;
  S00_AXI_RDATA( 31 downto 0 ) <= axi_shuffler_S00_AXI_RDATA(31 downto 0);
  S00_AXI_RRESP( 1 downto 0 ) <= axi_shuffler_S00_AXI_RRESP(1 downto 0);
  S00_AXI_RVALID <= axi_shuffler_S00_AXI_RVALID;


  -- Señales hacia shuffler data
  -- Señales IN
  axi_shuffler_S01_AXI_ARADDR(19 downto 0) <= S01_AXI_ARADDR(19 downto 0);
  axi_shuffler_S01_AXI_ARBURST(1 downto 0) <= S01_AXI_ARBURST(1 downto 0);
  axi_shuffler_S01_AXI_ARCACHE(3 downto 0) <= S01_AXI_ARCACHE(3 downto 0);
  axi_shuffler_S01_AXI_ARID(11 downto 0) <= S01_AXI_ARID(11 downto 0);
  axi_shuffler_S01_AXI_ARLEN(7 downto 0) <= S01_AXI_ARLEN(7 downto 0);
  axi_shuffler_S01_AXI_ARLOCK <= S01_AXI_ARLOCK;
  axi_shuffler_S01_AXI_ARPROT(2 downto 0) <= S01_AXI_ARPROT(2 downto 0);
  axi_shuffler_S01_AXI_ARQOS(3 downto 0) <= S01_AXI_ARQOS(3 downto 0);
  axi_shuffler_S01_AXI_ARSIZE(2 downto 0) <= S01_AXI_ARSIZE(2 downto 0);
  axi_shuffler_S01_AXI_ARVALID <= S01_AXI_ARVALID;
  axi_shuffler_S01_AXI_ARREGION(3 downto 0)<= S01_AXI_ARREGION(3 downto 0);
 
  axi_shuffler_S01_AXI_AWADDR(19 downto 0) <= S01_AXI_AWADDR(19 downto 0);
  axi_shuffler_S01_AXI_AWBURST(1 downto 0) <= S01_AXI_AWBURST(1 downto 0);
  axi_shuffler_S01_AXI_AWCACHE(3 downto 0) <= S01_AXI_AWCACHE(3 downto 0);
  axi_shuffler_S01_AXI_AWID(11 downto 0) <= S01_AXI_AWID(11 downto 0);
  axi_shuffler_S01_AXI_AWLEN(7 downto 0) <= S01_AXI_AWLEN(7 downto 0);
  axi_shuffler_S01_AXI_AWLOCK <= S01_AXI_AWLOCK;
  axi_shuffler_S01_AXI_AWPROT(2 downto 0) <= S01_AXI_AWPROT(2 downto 0);
  axi_shuffler_S01_AXI_AWQOS(3 downto 0) <= S01_AXI_AWQOS(3 downto 0);
  axi_shuffler_S01_AXI_AWSIZE(2 downto 0) <= S01_AXI_AWSIZE(2 downto 0);
  axi_shuffler_S01_AXI_AWVALID <= S01_AXI_AWVALID;
  axi_shuffler_S01_AXI_AWREGION(3 downto 0)<= S01_AXI_AWREGION(3 downto 0);

  axi_shuffler_S01_AXI_BREADY <= S01_AXI_BREADY;

  axi_shuffler_S01_AXI_RREADY <= S01_AXI_RREADY;

  axi_shuffler_S01_AXI_WDATA(31 downto 0) <= S01_AXI_WDATA(31 downto 0);
  axi_shuffler_S01_AXI_WLAST <= S01_AXI_WLAST;
  axi_shuffler_S01_AXI_WSTRB(3 downto 0) <= S01_AXI_WSTRB(3 downto 0);
  axi_shuffler_S01_AXI_WVALID <= S01_AXI_WVALID;
  
  -- Señales OUT
  S01_AXI_ARREADY <= axi_shuffler_S01_AXI_ARREADY;
  S01_AXI_AWREADY <= axi_shuffler_S01_AXI_AWREADY;
  S01_AXI_BID( 11 downto 0 ) <= axi_shuffler_S01_AXI_BID(11 downto 0);
  S01_AXI_BRESP( 1 downto 0 ) <= axi_shuffler_S01_AXI_BRESP(1 downto 0);
  S01_AXI_BVALID <= axi_shuffler_S01_AXI_BVALID;
  S01_AXI_RDATA( 31 downto 0 ) <= axi_shuffler_S01_AXI_RDATA(31 downto 0);
  S01_AXI_RID( 11 downto 0 ) <= axi_shuffler_S01_AXI_RID(11 downto 0);
  S01_AXI_RLAST <= axi_shuffler_S01_AXI_RLAST;
  S01_AXI_RRESP( 1 downto 0 ) <= axi_shuffler_S01_AXI_RRESP(1 downto 0);
  S01_AXI_RVALID <= axi_shuffler_S01_AXI_RVALID;
  S01_AXI_WREADY <= axi_shuffler_S01_AXI_WREADY;

  --Assign concatenated signal to CONCAT_TRACES port
  concat_traces_signal <= artico3_slot3_artico3_ready & artico3_slot3_artico3_start & 
                          artico3_slot2_artico3_ready & artico3_slot2_artico3_start & 
                          artico3_slot1_artico3_ready & artico3_slot1_artico3_start & 
                          artico3_slot0_artico3_ready & artico3_slot0_artico3_start;
                          
  CONCAT_TRACES <= concat_traces_signal;

a3_slot_0: component system_a3_slot_0_0
     port map (
      s_artico3_aclk => artico3_slot0_artico3_aclk,
      s_artico3_addr(15 downto 0) => artico3_slot0_artico3_addr(15 downto 0),
      s_artico3_aresetn => artico3_slot0_artico3_aresetn,
      s_artico3_en => artico3_slot0_artico3_en,
      s_artico3_mode => artico3_slot0_artico3_mode,
      s_artico3_rdata(31 downto 0) => artico3_slot0_artico3_rdata(31 downto 0),
      s_artico3_ready => artico3_slot0_artico3_ready,
      s_artico3_start => artico3_slot0_artico3_start,
      s_artico3_wdata(31 downto 0) => artico3_slot0_artico3_wdata(31 downto 0),
      s_artico3_we => artico3_slot0_artico3_we
    );

a3_slot_1: component system_a3_slot_1_0
     port map (
      s_artico3_aclk => artico3_slot1_artico3_aclk,
      s_artico3_addr(15 downto 0) => artico3_slot1_artico3_addr(15 downto 0),
      s_artico3_aresetn => artico3_slot1_artico3_aresetn,
      s_artico3_en => artico3_slot1_artico3_en,
      s_artico3_mode => artico3_slot1_artico3_mode,
      s_artico3_rdata(31 downto 0) => artico3_slot1_artico3_rdata(31 downto 0),
      s_artico3_ready => artico3_slot1_artico3_ready,
      s_artico3_start => artico3_slot1_artico3_start,
      s_artico3_wdata(31 downto 0) => artico3_slot1_artico3_wdata(31 downto 0),
      s_artico3_we => artico3_slot1_artico3_we
    );

a3_slot_2: component system_a3_slot_2_0
     port map (
      s_artico3_aclk => artico3_slot2_artico3_aclk,
      s_artico3_addr(15 downto 0) => artico3_slot2_artico3_addr(15 downto 0),
      s_artico3_aresetn => artico3_slot2_artico3_aresetn,
      s_artico3_en => artico3_slot2_artico3_en,
      s_artico3_mode => artico3_slot2_artico3_mode,
      s_artico3_rdata(31 downto 0) => artico3_slot2_artico3_rdata(31 downto 0),
      s_artico3_ready => artico3_slot2_artico3_ready,
      s_artico3_start => artico3_slot2_artico3_start,
      s_artico3_wdata(31 downto 0) => artico3_slot2_artico3_wdata(31 downto 0),
      s_artico3_we => artico3_slot2_artico3_we
    );

a3_slot_3: component system_a3_slot_3_0
     port map (
      s_artico3_aclk => artico3_slot3_artico3_aclk,
      s_artico3_addr(15 downto 0) => artico3_slot3_artico3_addr(15 downto 0),
      s_artico3_aresetn => artico3_slot3_artico3_aresetn,
      s_artico3_en => artico3_slot3_artico3_en,
      s_artico3_mode => artico3_slot3_artico3_mode,
      s_artico3_rdata(31 downto 0) => artico3_slot3_artico3_rdata(31 downto 0),
      s_artico3_ready => artico3_slot3_artico3_ready,
      s_artico3_start => artico3_slot3_artico3_start,
      s_artico3_wdata(31 downto 0) => artico3_slot3_artico3_wdata(31 downto 0),
      s_artico3_we => artico3_slot3_artico3_we
    );

artico3_shuffler_0: component system_artico3_shuffler_0_0
     port map (
      interrupt => artico3_shuffler_0_interrupt,
      m0_artico3_aclk => artico3_slot0_artico3_aclk,
      m0_artico3_addr(15 downto 0) => artico3_slot0_artico3_addr(15 downto 0),
      m0_artico3_aresetn => artico3_slot0_artico3_aresetn,
      m0_artico3_en => artico3_slot0_artico3_en,
      m0_artico3_mode => artico3_slot0_artico3_mode,
      m0_artico3_rdata(31 downto 0) => artico3_slot0_artico3_rdata(31 downto 0),
      m0_artico3_ready => artico3_slot0_artico3_ready,
      m0_artico3_start => artico3_slot0_artico3_start,
      m0_artico3_wdata(31 downto 0) => artico3_slot0_artico3_wdata(31 downto 0),
      m0_artico3_we => artico3_slot0_artico3_we,
      m1_artico3_aclk => artico3_slot1_artico3_aclk,
      m1_artico3_addr(15 downto 0) => artico3_slot1_artico3_addr(15 downto 0),
      m1_artico3_aresetn => artico3_slot1_artico3_aresetn,
      m1_artico3_en => artico3_slot1_artico3_en,
      m1_artico3_mode => artico3_slot1_artico3_mode,
      m1_artico3_rdata(31 downto 0) => artico3_slot1_artico3_rdata(31 downto 0),
      m1_artico3_ready => artico3_slot1_artico3_ready,
      m1_artico3_start => artico3_slot1_artico3_start,
      m1_artico3_wdata(31 downto 0) => artico3_slot1_artico3_wdata(31 downto 0),
      m1_artico3_we => artico3_slot1_artico3_we,
      m2_artico3_aclk => artico3_slot2_artico3_aclk,
      m2_artico3_addr(15 downto 0) => artico3_slot2_artico3_addr(15 downto 0),
      m2_artico3_aresetn => artico3_slot2_artico3_aresetn,
      m2_artico3_en => artico3_slot2_artico3_en,
      m2_artico3_mode => artico3_slot2_artico3_mode,
      m2_artico3_rdata(31 downto 0) => artico3_slot2_artico3_rdata(31 downto 0),
      m2_artico3_ready => artico3_slot2_artico3_ready,
      m2_artico3_start => artico3_slot2_artico3_start,
      m2_artico3_wdata(31 downto 0) => artico3_slot2_artico3_wdata(31 downto 0),
      m2_artico3_we => artico3_slot2_artico3_we,
      m3_artico3_aclk => artico3_slot3_artico3_aclk,
      m3_artico3_addr(15 downto 0) => artico3_slot3_artico3_addr(15 downto 0),
      m3_artico3_aresetn => artico3_slot3_artico3_aresetn,
      m3_artico3_en => artico3_slot3_artico3_en,
      m3_artico3_mode => artico3_slot3_artico3_mode,
      m3_artico3_rdata(31 downto 0) => artico3_slot3_artico3_rdata(31 downto 0),
      m3_artico3_ready => artico3_slot3_artico3_ready,
      m3_artico3_start => artico3_slot3_artico3_start,
      m3_artico3_wdata(31 downto 0) => artico3_slot3_artico3_wdata(31 downto 0),
      m3_artico3_we => artico3_slot3_artico3_we,
      
      s00_axi_araddr(19 downto 0) => axi_shuffler_S00_AXI_ARADDR(19 downto 0),
      s00_axi_arprot(2 downto 0) => axi_shuffler_S00_AXI_ARPROT(2 downto 0),
      s00_axi_arready => axi_shuffler_S00_AXI_ARREADY,
      s00_axi_arvalid => axi_shuffler_S00_AXI_ARVALID,
      s00_axi_awaddr(19 downto 0) => axi_shuffler_S00_AXI_AWADDR(19 downto 0),
      s00_axi_awprot(2 downto 0) => axi_shuffler_S00_AXI_AWPROT(2 downto 0),
      s00_axi_awready => axi_shuffler_S00_AXI_AWREADY,
      s00_axi_awvalid => axi_shuffler_S00_AXI_AWVALID,
      s00_axi_bready => axi_shuffler_S00_AXI_BREADY,
      s00_axi_bresp(1 downto 0) => axi_shuffler_S00_AXI_BRESP(1 downto 0),
      s00_axi_bvalid => axi_shuffler_S00_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => axi_shuffler_S00_AXI_RDATA(31 downto 0),
      s00_axi_rready => axi_shuffler_S00_AXI_RREADY,
      s00_axi_rresp(1 downto 0) => axi_shuffler_S00_AXI_RRESP(1 downto 0),
      s00_axi_rvalid => axi_shuffler_S00_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => axi_shuffler_S00_AXI_WDATA(31 downto 0),
      s00_axi_wready => axi_shuffler_S00_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => axi_shuffler_S00_AXI_WSTRB(3 downto 0),
      s00_axi_wvalid => axi_shuffler_S00_AXI_WVALID,

      s01_axi_araddr(19 downto 0) => axi_shuffler_S01_AXI_ARADDR(19 downto 0),
      s01_axi_arburst(1 downto 0) => axi_shuffler_S01_AXI_ARBURST(1 downto 0),
      s01_axi_arcache(3 downto 0) => axi_shuffler_S01_AXI_ARCACHE(3 downto 0),
      s01_axi_arid(11 downto 0) => axi_shuffler_S01_AXI_ARID(11 downto 0),
      s01_axi_arlen(7 downto 0) => axi_shuffler_S01_AXI_ARLEN(7 downto 0),
      s01_axi_arlock => axi_shuffler_S01_AXI_ARLOCK,
      s01_axi_arprot(2 downto 0) => axi_shuffler_S01_AXI_ARPROT(2 downto 0),
      s01_axi_arqos(3 downto 0) => axi_shuffler_S01_AXI_ARQOS(3 downto 0),
      s01_axi_arready => axi_shuffler_S01_AXI_ARREADY,
      s01_axi_arregion(3 downto 0) => axi_shuffler_S01_AXI_ARREGION(3 downto 0),
      s01_axi_arsize(2 downto 0) => axi_shuffler_S01_AXI_ARSIZE(2 downto 0),
      s01_axi_aruser(0) => '0',
      s01_axi_arvalid => axi_shuffler_S01_AXI_ARVALID,
      s01_axi_awaddr(19 downto 0) => axi_shuffler_S01_AXI_AWADDR(19 downto 0),
      s01_axi_awburst(1 downto 0) => axi_shuffler_S01_AXI_AWBURST(1 downto 0),
      s01_axi_awcache(3 downto 0) => axi_shuffler_S01_AXI_AWCACHE(3 downto 0),
      s01_axi_awid(11 downto 0) => axi_shuffler_S01_AXI_AWID(11 downto 0),
      s01_axi_awlen(7 downto 0) => axi_shuffler_S01_AXI_AWLEN(7 downto 0),
      s01_axi_awlock => axi_shuffler_S01_AXI_AWLOCK,
      s01_axi_awprot(2 downto 0) => axi_shuffler_S01_AXI_AWPROT(2 downto 0),
      s01_axi_awqos(3 downto 0) => axi_shuffler_S01_AXI_AWQOS(3 downto 0),
      s01_axi_awready => axi_shuffler_S01_AXI_AWREADY,
      s01_axi_awregion(3 downto 0) => axi_shuffler_S01_AXI_AWREGION(3 downto 0),
      s01_axi_awsize(2 downto 0) => axi_shuffler_S01_AXI_AWSIZE(2 downto 0),
      s01_axi_awuser(0) => '0',
      s01_axi_awvalid => axi_shuffler_S01_AXI_AWVALID,
      s01_axi_bid(11 downto 0) => axi_shuffler_S01_AXI_BID(11 downto 0),
      s01_axi_bready => axi_shuffler_S01_AXI_BREADY,
      s01_axi_bresp(1 downto 0) => axi_shuffler_S01_AXI_BRESP(1 downto 0),
      s01_axi_buser(0) => NLW_artico3_shuffler_0_s01_axi_buser_UNCONNECTED(0),
      s01_axi_bvalid => axi_shuffler_S01_AXI_BVALID,
      s01_axi_rdata(31 downto 0) => axi_shuffler_S01_AXI_RDATA(31 downto 0),
      s01_axi_rid(11 downto 0) => axi_shuffler_S01_AXI_RID(11 downto 0),
      s01_axi_rlast => axi_shuffler_S01_AXI_RLAST,
      s01_axi_rready => axi_shuffler_S01_AXI_RREADY,
      s01_axi_rresp(1 downto 0) => axi_shuffler_S01_AXI_RRESP(1 downto 0),
      s01_axi_ruser(0) => NLW_artico3_shuffler_0_s01_axi_ruser_UNCONNECTED(0),
      s01_axi_rvalid => axi_shuffler_S01_AXI_RVALID,
      s01_axi_wdata(31 downto 0) => axi_shuffler_S01_AXI_WDATA(31 downto 0),
      s01_axi_wlast => axi_shuffler_S01_AXI_WLAST,
      s01_axi_wready => axi_shuffler_S01_AXI_WREADY,
      s01_axi_wstrb(3 downto 0) => axi_shuffler_S01_AXI_WSTRB(3 downto 0),
      s01_axi_wuser(0) => '0',
      s01_axi_wvalid => axi_shuffler_S01_AXI_WVALID,
      s_axi_aclk => GENERAL_CLK0,
      s_axi_aresetn => GENERAL_aresetn
    );


end STRUCTURE;