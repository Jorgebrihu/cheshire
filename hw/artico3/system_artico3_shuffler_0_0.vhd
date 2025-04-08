-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: cei.upm.es:artico3:artico3_shuffler:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY system_artico3_shuffler_0_0 IS
  PORT (
    interrupt : OUT STD_LOGIC;
    m0_artico3_aclk : OUT STD_LOGIC;
    m0_artico3_aresetn : OUT STD_LOGIC;
    m0_artico3_start : OUT STD_LOGIC;
    m0_artico3_ready : IN STD_LOGIC;
    m0_artico3_en : OUT STD_LOGIC;
    m0_artico3_we : OUT STD_LOGIC;
    m0_artico3_mode : OUT STD_LOGIC;
    m0_artico3_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m0_artico3_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m0_artico3_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m1_artico3_aclk : OUT STD_LOGIC;
    m1_artico3_aresetn : OUT STD_LOGIC;
    m1_artico3_start : OUT STD_LOGIC;
    m1_artico3_ready : IN STD_LOGIC;
    m1_artico3_en : OUT STD_LOGIC;
    m1_artico3_we : OUT STD_LOGIC;
    m1_artico3_mode : OUT STD_LOGIC;
    m1_artico3_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m1_artico3_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m1_artico3_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m2_artico3_aclk : OUT STD_LOGIC;
    m2_artico3_aresetn : OUT STD_LOGIC;
    m2_artico3_start : OUT STD_LOGIC;
    m2_artico3_ready : IN STD_LOGIC;
    m2_artico3_en : OUT STD_LOGIC;
    m2_artico3_we : OUT STD_LOGIC;
    m2_artico3_mode : OUT STD_LOGIC;
    m2_artico3_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m2_artico3_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m2_artico3_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m3_artico3_aclk : OUT STD_LOGIC;
    m3_artico3_aresetn : OUT STD_LOGIC;
    m3_artico3_start : OUT STD_LOGIC;
    m3_artico3_ready : IN STD_LOGIC;
    m3_artico3_en : OUT STD_LOGIC;
    m3_artico3_we : OUT STD_LOGIC;
    m3_artico3_mode : OUT STD_LOGIC;
    m3_artico3_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m3_artico3_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m3_artico3_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    s00_axi_awaddr : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
    s00_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_awvalid : IN STD_LOGIC;
    s00_axi_awready : OUT STD_LOGIC;
    s00_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_wvalid : IN STD_LOGIC;
    s00_axi_wready : OUT STD_LOGIC;
    s00_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_bvalid : OUT STD_LOGIC;
    s00_axi_bready : IN STD_LOGIC;
    s00_axi_araddr : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
    s00_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_arvalid : IN STD_LOGIC;
    s00_axi_arready : OUT STD_LOGIC;
    s00_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_rvalid : OUT STD_LOGIC;
    s00_axi_rready : IN STD_LOGIC;
    s01_axi_awid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    s01_axi_awaddr : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
    s01_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s01_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_awlock : IN STD_LOGIC;
    s01_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_awuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s01_axi_awvalid : IN STD_LOGIC;
    s01_axi_awready : OUT STD_LOGIC;
    s01_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s01_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_wlast : IN STD_LOGIC;
    s01_axi_wuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s01_axi_wvalid : IN STD_LOGIC;
    s01_axi_wready : OUT STD_LOGIC;
    s01_axi_bid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    s01_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_buser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s01_axi_bvalid : OUT STD_LOGIC;
    s01_axi_bready : IN STD_LOGIC;
    s01_axi_arid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    s01_axi_araddr : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
    s01_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s01_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_arlock : IN STD_LOGIC;
    s01_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_aruser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s01_axi_arvalid : IN STD_LOGIC;
    s01_axi_arready : OUT STD_LOGIC;
    s01_axi_rid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    s01_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s01_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_rlast : OUT STD_LOGIC;
    s01_axi_ruser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s01_axi_rvalid : OUT STD_LOGIC;
    s01_axi_rready : IN STD_LOGIC
  );
END system_artico3_shuffler_0_0;

ARCHITECTURE system_artico3_shuffler_0_0_arch OF system_artico3_shuffler_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_artico3_shuffler_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT shuffler IS
    GENERIC (
      C_NUM_REG_RW : INTEGER;
      C_NUM_REG_RO : INTEGER;
      C_PIPE_DEPTH : INTEGER;
      C_EN_LATENCY : INTEGER;
      C_VOTER_LATENCY : INTEGER;
      C_MAX_SLOTS : INTEGER;
      C_CLK_GATE_BUFFER : STRING;
      C_RST_BUFFER : STRING;
      C_ARTICO3_ADDR_WIDTH : INTEGER;
      C_ARTICO3_ID_WIDTH : INTEGER;
      C_ARTICO3_OP_WIDTH : INTEGER;
      C_ARTICO3_GR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_ID_WIDTH : INTEGER;
      C_S_AXI_AWUSER_WIDTH : INTEGER;
      C_S_AXI_ARUSER_WIDTH : INTEGER;
      C_S_AXI_WUSER_WIDTH : INTEGER;
      C_S_AXI_RUSER_WIDTH : INTEGER;
      C_S_AXI_BUSER_WIDTH : INTEGER
    );
    PORT (
      interrupt : OUT STD_LOGIC;
      m0_artico3_aclk : OUT STD_LOGIC;
      m0_artico3_aresetn : OUT STD_LOGIC;
      m0_artico3_start : OUT STD_LOGIC;
      m0_artico3_ready : IN STD_LOGIC;
      m0_artico3_en : OUT STD_LOGIC;
      m0_artico3_we : OUT STD_LOGIC;
      m0_artico3_mode : OUT STD_LOGIC;
      m0_artico3_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m0_artico3_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m0_artico3_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m1_artico3_aclk : OUT STD_LOGIC;
      m1_artico3_aresetn : OUT STD_LOGIC;
      m1_artico3_start : OUT STD_LOGIC;
      m1_artico3_ready : IN STD_LOGIC;
      m1_artico3_en : OUT STD_LOGIC;
      m1_artico3_we : OUT STD_LOGIC;
      m1_artico3_mode : OUT STD_LOGIC;
      m1_artico3_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m1_artico3_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m1_artico3_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m2_artico3_aclk : OUT STD_LOGIC;
      m2_artico3_aresetn : OUT STD_LOGIC;
      m2_artico3_start : OUT STD_LOGIC;
      m2_artico3_ready : IN STD_LOGIC;
      m2_artico3_en : OUT STD_LOGIC;
      m2_artico3_we : OUT STD_LOGIC;
      m2_artico3_mode : OUT STD_LOGIC;
      m2_artico3_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m2_artico3_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m2_artico3_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m3_artico3_aclk : OUT STD_LOGIC;
      m3_artico3_aresetn : OUT STD_LOGIC;
      m3_artico3_start : OUT STD_LOGIC;
      m3_artico3_ready : IN STD_LOGIC;
      m3_artico3_en : OUT STD_LOGIC;
      m3_artico3_we : OUT STD_LOGIC;
      m3_artico3_mode : OUT STD_LOGIC;
      m3_artico3_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m3_artico3_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m3_artico3_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC;
      s00_axi_awaddr : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
      s00_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_awvalid : IN STD_LOGIC;
      s00_axi_awready : OUT STD_LOGIC;
      s00_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s00_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_wvalid : IN STD_LOGIC;
      s00_axi_wready : OUT STD_LOGIC;
      s00_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_bvalid : OUT STD_LOGIC;
      s00_axi_bready : IN STD_LOGIC;
      s00_axi_araddr : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
      s00_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_arvalid : IN STD_LOGIC;
      s00_axi_arready : OUT STD_LOGIC;
      s00_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s00_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_rvalid : OUT STD_LOGIC;
      s00_axi_rready : IN STD_LOGIC;
      s01_axi_awid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      s01_axi_awaddr : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
      s01_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s01_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s01_axi_awlock : IN STD_LOGIC;
      s01_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_awuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_awvalid : IN STD_LOGIC;
      s01_axi_awready : OUT STD_LOGIC;
      s01_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s01_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_wlast : IN STD_LOGIC;
      s01_axi_wuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_wvalid : IN STD_LOGIC;
      s01_axi_wready : OUT STD_LOGIC;
      s01_axi_bid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      s01_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s01_axi_buser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_bvalid : OUT STD_LOGIC;
      s01_axi_bready : IN STD_LOGIC;
      s01_axi_arid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      s01_axi_araddr : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
      s01_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s01_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s01_axi_arlock : IN STD_LOGIC;
      s01_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_aruser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_arvalid : IN STD_LOGIC;
      s01_axi_arready : OUT STD_LOGIC;
      s01_axi_rid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      s01_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s01_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s01_axi_rlast : OUT STD_LOGIC;
      s01_axi_ruser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_rvalid : OUT STD_LOGIC;
      s01_axi_rready : IN STD_LOGIC
    );
  END COMPONENT shuffler;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF system_artico3_shuffler_0_0_arch: ARCHITECTURE IS "shuffler,Vivado 2023.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF system_artico3_shuffler_0_0_arch : ARCHITECTURE IS "system_artico3_shuffler_0_0,shuffler,{}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF system_artico3_shuffler_0_0_arch: ARCHITECTURE IS "package_project";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF interrupt: SIGNAL IS "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m0_artico3_aclk: SIGNAL IS "XIL_INTERFACENAME m0_artico3_aclk, ASSOCIATED_RESET m0_artico3_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 m0_artico3_aclk CLK, cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_aclk";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_addr: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_addr";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m0_artico3_aresetn: SIGNAL IS "XIL_INTERFACENAME m0_artico3_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 m0_artico3_aresetn RST, cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_aresetn";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_en: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_en";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_mode: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_mode";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_rdata: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_rdata";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_ready: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_ready";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_start: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_start";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_wdata: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_wdata";
  ATTRIBUTE X_INTERFACE_INFO OF m0_artico3_we: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m0_artico3 artico3_we";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m1_artico3_aclk: SIGNAL IS "XIL_INTERFACENAME m1_artico3_aclk, ASSOCIATED_RESET m1_artico3_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 m1_artico3_aclk CLK, cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_aclk";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_addr: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_addr";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m1_artico3_aresetn: SIGNAL IS "XIL_INTERFACENAME m1_artico3_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 m1_artico3_aresetn RST, cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_aresetn";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_en: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_en";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_mode: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_mode";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_rdata: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_rdata";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_ready: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_ready";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_start: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_start";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_wdata: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_wdata";
  ATTRIBUTE X_INTERFACE_INFO OF m1_artico3_we: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m1_artico3 artico3_we";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m2_artico3_aclk: SIGNAL IS "XIL_INTERFACENAME m2_artico3_aclk, ASSOCIATED_RESET m2_artico3_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 m2_artico3_aclk CLK, cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_aclk";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_addr: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_addr";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m2_artico3_aresetn: SIGNAL IS "XIL_INTERFACENAME m2_artico3_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 m2_artico3_aresetn RST, cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_aresetn";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_en: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_en";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_mode: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_mode";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_rdata: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_rdata";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_ready: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_ready";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_start: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_start";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_wdata: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_wdata";
  ATTRIBUTE X_INTERFACE_INFO OF m2_artico3_we: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m2_artico3 artico3_we";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m3_artico3_aclk: SIGNAL IS "XIL_INTERFACENAME m3_artico3_aclk, ASSOCIATED_RESET m3_artico3_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 m3_artico3_aclk CLK, cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_aclk";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_addr: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_addr";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m3_artico3_aresetn: SIGNAL IS "XIL_INTERFACENAME m3_artico3_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 m3_artico3_aresetn RST, cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_aresetn";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_en: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_en";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_mode: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_mode";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_rdata: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_rdata";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_ready: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_ready";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_start: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_start";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_wdata: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_wdata";
  ATTRIBUTE X_INTERFACE_INFO OF m3_artico3_we: SIGNAL IS "cei.upm.es:artico3:artico3:1.0 m3_artico3 artico3_we";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axi_awaddr: SIGNAL IS "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 20, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS " & 
"4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_aruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWCACHE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s01_axi_awid: SIGNAL IS "XIL_INTERFACENAME s01_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 12, ADDR_WIDTH 20, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4" & 
", NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi BID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_buser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi BUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi RID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_ruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi RUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_wuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi WUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s01_axi WVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aclk: SIGNAL IS "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_RESET s_axi_aresetn, ASSOCIATED_BUSIF s00_axi:s01_axi, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aresetn: SIGNAL IS "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
BEGIN
  U0 : shuffler
    GENERIC MAP (
      C_NUM_REG_RW => 10,
      C_NUM_REG_RO => 40,
      C_PIPE_DEPTH => 3,
      C_EN_LATENCY => 4,
      C_VOTER_LATENCY => 2,
      C_MAX_SLOTS => 4,
      C_CLK_GATE_BUFFER => "HORIZONTAL",
      C_RST_BUFFER => "GLOBAL",
      C_ARTICO3_ADDR_WIDTH => 16,
      C_ARTICO3_ID_WIDTH => 4,
      C_ARTICO3_OP_WIDTH => 4,
      C_ARTICO3_GR_WIDTH => 4,
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ADDR_WIDTH => 20,
      C_S_AXI_ID_WIDTH => 12,
      C_S_AXI_AWUSER_WIDTH => 0,
      C_S_AXI_ARUSER_WIDTH => 0,
      C_S_AXI_WUSER_WIDTH => 0,
      C_S_AXI_RUSER_WIDTH => 0,
      C_S_AXI_BUSER_WIDTH => 0
    )
    PORT MAP (
      interrupt => interrupt,
      m0_artico3_aclk => m0_artico3_aclk,
      m0_artico3_aresetn => m0_artico3_aresetn,
      m0_artico3_start => m0_artico3_start,
      m0_artico3_ready => m0_artico3_ready,
      m0_artico3_en => m0_artico3_en,
      m0_artico3_we => m0_artico3_we,
      m0_artico3_mode => m0_artico3_mode,
      m0_artico3_addr => m0_artico3_addr,
      m0_artico3_wdata => m0_artico3_wdata,
      m0_artico3_rdata => m0_artico3_rdata,
      m1_artico3_aclk => m1_artico3_aclk,
      m1_artico3_aresetn => m1_artico3_aresetn,
      m1_artico3_start => m1_artico3_start,
      m1_artico3_ready => m1_artico3_ready,
      m1_artico3_en => m1_artico3_en,
      m1_artico3_we => m1_artico3_we,
      m1_artico3_mode => m1_artico3_mode,
      m1_artico3_addr => m1_artico3_addr,
      m1_artico3_wdata => m1_artico3_wdata,
      m1_artico3_rdata => m1_artico3_rdata,
      m2_artico3_aclk => m2_artico3_aclk,
      m2_artico3_aresetn => m2_artico3_aresetn,
      m2_artico3_start => m2_artico3_start,
      m2_artico3_ready => m2_artico3_ready,
      m2_artico3_en => m2_artico3_en,
      m2_artico3_we => m2_artico3_we,
      m2_artico3_mode => m2_artico3_mode,
      m2_artico3_addr => m2_artico3_addr,
      m2_artico3_wdata => m2_artico3_wdata,
      m2_artico3_rdata => m2_artico3_rdata,
      m3_artico3_aclk => m3_artico3_aclk,
      m3_artico3_aresetn => m3_artico3_aresetn,
      m3_artico3_start => m3_artico3_start,
      m3_artico3_ready => m3_artico3_ready,
      m3_artico3_en => m3_artico3_en,
      m3_artico3_we => m3_artico3_we,
      m3_artico3_mode => m3_artico3_mode,
      m3_artico3_addr => m3_artico3_addr,
      m3_artico3_wdata => m3_artico3_wdata,
      m3_artico3_rdata => m3_artico3_rdata,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s00_axi_awaddr => s00_axi_awaddr,
      s00_axi_awprot => s00_axi_awprot,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_awready => s00_axi_awready,
      s00_axi_wdata => s00_axi_wdata,
      s00_axi_wstrb => s00_axi_wstrb,
      s00_axi_wvalid => s00_axi_wvalid,
      s00_axi_wready => s00_axi_wready,
      s00_axi_bresp => s00_axi_bresp,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_araddr => s00_axi_araddr,
      s00_axi_arprot => s00_axi_arprot,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_arready => s00_axi_arready,
      s00_axi_rdata => s00_axi_rdata,
      s00_axi_rresp => s00_axi_rresp,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_rready => s00_axi_rready,
      s01_axi_awid => s01_axi_awid,
      s01_axi_awaddr => s01_axi_awaddr,
      s01_axi_awlen => s01_axi_awlen,
      s01_axi_awsize => s01_axi_awsize,
      s01_axi_awburst => s01_axi_awburst,
      s01_axi_awlock => s01_axi_awlock,
      s01_axi_awcache => s01_axi_awcache,
      s01_axi_awprot => s01_axi_awprot,
      s01_axi_awqos => s01_axi_awqos,
      s01_axi_awregion => s01_axi_awregion,
      s01_axi_awuser => s01_axi_awuser,
      s01_axi_awvalid => s01_axi_awvalid,
      s01_axi_awready => s01_axi_awready,
      s01_axi_wdata => s01_axi_wdata,
      s01_axi_wstrb => s01_axi_wstrb,
      s01_axi_wlast => s01_axi_wlast,
      s01_axi_wuser => s01_axi_wuser,
      s01_axi_wvalid => s01_axi_wvalid,
      s01_axi_wready => s01_axi_wready,
      s01_axi_bid => s01_axi_bid,
      s01_axi_bresp => s01_axi_bresp,
      s01_axi_buser => s01_axi_buser,
      s01_axi_bvalid => s01_axi_bvalid,
      s01_axi_bready => s01_axi_bready,
      s01_axi_arid => s01_axi_arid,
      s01_axi_araddr => s01_axi_araddr,
      s01_axi_arlen => s01_axi_arlen,
      s01_axi_arsize => s01_axi_arsize,
      s01_axi_arburst => s01_axi_arburst,
      s01_axi_arlock => s01_axi_arlock,
      s01_axi_arcache => s01_axi_arcache,
      s01_axi_arprot => s01_axi_arprot,
      s01_axi_arqos => s01_axi_arqos,
      s01_axi_arregion => s01_axi_arregion,
      s01_axi_aruser => s01_axi_aruser,
      s01_axi_arvalid => s01_axi_arvalid,
      s01_axi_arready => s01_axi_arready,
      s01_axi_rid => s01_axi_rid,
      s01_axi_rdata => s01_axi_rdata,
      s01_axi_rresp => s01_axi_rresp,
      s01_axi_rlast => s01_axi_rlast,
      s01_axi_ruser => s01_axi_ruser,
      s01_axi_rvalid => s01_axi_rvalid,
      s01_axi_rready => s01_axi_rready
    );
END system_artico3_shuffler_0_0_arch;
