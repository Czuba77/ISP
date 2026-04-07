// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Tue Apr  7 20:34:41 2026
// Host        : DESKTOP-4VKR50Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/czuba/isp/lab5a/lab5a.gen/sources_1/ip/char_mem_1/char_mem_sim_netlist.v
// Design      : char_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "char_mem,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module char_mem
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [11:0]addra;
  wire clka;
  wire [7:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.326399 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "char_mem.mem" *) 
  (* C_INIT_FILE_NAME = "char_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  char_mem_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YqH9kwIC39+qbZg4PSfFsXuB9k9wnuxNryS/CfnEri6Ci9fSC6fsrQ/T/hnt3u/yolbJ8DJa1Qu6
Qnm24A9jLbA+fu3Nsmm6/rM6a4vU6OfVl/gTFd/CiWDutv6Dhn6Lim4uUNPahoOR/A2Yc4Zo2tdI
kMLO9gn9WlH2l3O2oXs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XJYO2VHd/cnMxQd3i7/2qRhl57dl+doEKuhAunQyv3vpGRG/jlNxj8PqrgLoF0HMdqE3qJUVE/oq
kBSapqjVjLDMOrNGQ+Tc6VGsKMZH8FE/TXHQJ/IM5Iuiu2eozEwwVUomF+7cfqn+9OsVsqCONQ1M
g0oRlangiqasJDhhMfnlGGqwAwmgWRGQA6dmhTuua1s8zdvIv540zY6p5au8cAKVhqyyKK7wbxEE
SGuFqX+NYoyRV+rfWCcWM+hJEmnWS8LNAKkd13YE2+17sPYzUdZ23DmTxXK6KlAxKFW27CBySUfg
qdNXp2DSs2KAQYih27pBNMuHfGbM/ATFPWFvxg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYoEi/e8HsDTz6N11EDe/B/iitERmeYndlCklmCluwgb0N4W80JUGVlkd7NlRZHRNhxaNBJPkcjC
n61nO0tb17NwsMwjbY5TF8JWRYTNw1JXCFacvQYrdKv4/7QNQEtwVGiCLxFhOA8aHlWMZIrc2fri
VRMVWaEBcPwCGorlVIM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QEw9fEsWFbdX0OQLvYs/gl+zyEOW3ak9TdQVaq+0AXXOT3LIqF7wDxJ6ZBnlf9mNbdsUVH5tAz1o
H8u7ihJl1L3THEvugW+TS8hkvVbEA9rKO2vV15KAj4Lla7UdFT/xDfe79RFarlLI7yGrubjgdoRi
QWy//UKsffG7IWNwmoSuppWiWB4ZHJtkunNyIkm70JPGyZF62VxJg1MTT+5LUbZG5vZjjuHZud9w
xJaKv1tFP/x8RVqLU5gPOqGqTW7/nKO2S+450Vo4D9vAmBVVcXpaL1EbSmCvQ+qJmcQKtf9qYFRV
Zko08hbpHjPxstqvTDro01jRzB8592m4xU2TWA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TC7q853CWBPPJgbRfgDV1lmjUwSAtliljShAyNFg8sfRfwDzchthzoSPH1UCHV++E2JXacEKq1lB
UWsNP92U4Xh0/Gu+6esOI0pJb8I+TRTxyBN1I4cRQEfQHcwfhbSdeH3yX9OV3opLEqYmT37hWU+J
zCawYnxVESI0FtRzEXve9gdEWlrKKckrT/hp4mvxxOjvOkOSQBvy0elgUOqh6mEOZl+JnUbsR+Wm
CoZLE1eefMZy3FnVmyDNPv3JPXi88aLXMyimal0MYFkTiS4XJiGT3eAIMIbksehXY+eYi/KFpZWQ
GHpX+lG3UmiWWLwyPakFwKEHbrBc70AlJ2eV9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9nmCKgjPWNChPbpSW6EWLrMA6oCG2JGPoum8px09v0PEAh0DRXZi0J8HPzXUsZgOEMcKpA7X54u
YFcDDCLAQ+urha/eSPbQYHQh4yGCursxAQ1C6LEyNQ2wJ0eLlO2bJeAl/gof06zqsYVM2lLJVNv5
wao1k2bmgPdfpfY3c9vPD0fSMuZPS41EoRS0cQhO5GTZnKdjxm6tEUL3GnTjB8ynSCIbCJUsMtAX
4FRHNa52gudx5B5fagR+lXgFhE7e++rWTJELr7SYB+r5Es8qZLTpCH8TrQxEkV0rY/+e4sAjNE2D
gHw8GD7VcUtc15B8y1BbVmh29qc8Nd3V2i/miA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UkCD6I/Vye4qNoNoa3hIexBXG3xyKUJPAHAjIo7UcNVCDXpMQiYEtPDqExZMfiPlJn2nswCYIfIJ
FYWqMCloKSQyyI/7yZ2EtbyWEklb/P5IyZyvGi6hhFUo/JFTb12b4bK0gZPr+bCDdlVQKTx5GVHz
wptdUJO2omSj8axVMPbLRRtVzlJIZ29dTJ2ATXVXAcBxPnFfHRAMnYYKLeeLExX61vQvpqrkLQHm
XG7hpVzJi56gYKAzxa2BLq072OCVpVS70bfWlhlSTVcSlCrUf+EcarEk4FD8+Ih2NCvrqremG6yn
TtcBn8Xr8M/6zhOYvLi6AD6eArDMKA8n+Ccv8A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A5y5QVZU8yjPexRVPioSiAGohCHD5DX5FVobuMyhcgQRExLUhPvnnS8HOtxTj/2IapEcz68gFMGG
Hpi+m725u85/om/Vze9pGIW9Mn328Kz2FIg3W5EvGstfGwY+48LiAGAmTR269JS4lJGVYWYOz7Xk
S8cEsFd2m7j8iyKtARJzD90+UdXq/cIIh725jC9i8nbgxB364zddvm1Z/DF3JRw1qFp6GGcuRai1
KNcJ1j8c9wtIgktpsteU3e5+bxHEw8NT3gWXUFYjm00NDq97Jals8Jjktmum2nQxoF7ivPacfEey
gnSF6jRMkTsZObzc30hAhs0CEtc33hZLhPLHSn8pQ0WyvKJLHdd5s2yckgTZtqxC1Sbwe7WEgNXe
ZMX3pIkz+aoXsAL7GBLyVBMVQcyMoF0w8QGAaTe8sqatABwPqXidYRqNROTf62IYcMpV89XYgaTv
EwIn/oni9KOFd2BFVxRZbFGGC4IjvigsTBUijI+Dk6kVnDh240clGcc4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Omtp+lCaqUx7Z4qdFj2zrN8LpCkit2eX4hlMtig+ielGm/x4FSZkpjoFmiqdKFPi2eg0pg09MSai
XyGH68UzAR7Xrj8f1jlIoUmMKp4GcxfdqfTeuu7kWGOJEP6cvgTjSJFj2gawDv7f4yZcltnK2x0L
e4GW/rBTmGvZtKWb2ahjINLxPuh3dDaSaWdb+zVgbtyrI5FrjxBkq+aOxSjyNsqnCx1L0uWbxnkl
88NbXN3dTaECXHNm/fsleayM5hKis7kTv9BFajJMGy+BhQlmIYpE+F5zchnTTFUFJZCz1sX9Fc8e
HcY7irB8mR3ajdzjUZLBQEMktp096Nheq3U75A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpeBLwN9x2ZFDwroYLlUe5GjjDepHik2l0c2s3/6S7JPCRkzQSyt2V1Ad/JewAs/QNp5SXSbYYB4
rQl0My1LDMF3xw43r0g2IbcyHVpPhGp0W5msuQdF67afnsRv90iJYWLMI3QkYGCTWAzl4HrLxFSg
3z8XZRK670IcxznOrlvgHmIKsvubZrBkuc1EynrVb9Nw16QnIx2rc4WgcEXeFf+4i1RoYLDd3gXK
NFCNMdtaRYUThunFP6Z4ViZ5UnDmKq+IMhd31jTaqIlWOBDxPI1+v5RJYxIyTbn4rxlKR2fNbl5/
z4OUjBTd+1GH3I2OXlqmAOvIhpe2Z2HH7nZu/A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mt2RhTSUwEIEWeNARbyL+EdfS1UF6nPaL/fKl/7oO2gina93egwCWDLl1fbBtkfaPco0cu4MJ9K3
OraAsyHRlY+MNShmJ1LzAIA1LjZx4y55lu9dlQqSUXR7AW7wVbkg1864mK+hM/1XygU0jvebKNW9
B7xSER+asLO6pxi0mt7uC2PHxLPAYEszFhmnap82TtbDGdQ2qtyekY+ngs+N2fAdsblxVwJruiMl
e6XJ127M8N1mYwhWU2HtRpBOSnnKoHgD9fG51XK/rhk8DxT66QnX9uLPB+H25eDupBJGi1Y5o6x8
hOwZiSUVlBLh7brfzevh7+eRn+7es6wBas0+3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 25520)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
