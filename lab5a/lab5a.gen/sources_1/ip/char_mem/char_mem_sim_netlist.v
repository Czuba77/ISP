// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Tue Apr  7 20:04:57 2026
// Host        : DESKTOP-4VKR50Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/czuba/isp/lab5a/lab5a.gen/sources_1/ip/char_mem/char_mem_sim_netlist.v
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
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [11:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [0:0]wea;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.535699 mW" *) 
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
  (* C_MEM_TYPE = "0" *) 
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
        .dina(dina),
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
        .wea(wea),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 26160)
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
