/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP3
// Date      : Fri Oct 16 00:49:27 2026
/////////////////////////////////////////////////////////////


module spi_regs ( pclk, presetn, psel, penable, pwrite, paddr, pwdata, prdata, 
        pready, pslverr, reg_start, reg_master_en, reg_clk_div, reg_tx_data, 
        core_busy, master_done, master_rx_data, slave_rx_valid, slave_rx_data
 );
  input [31:0] paddr;
  input [31:0] pwdata;
  output [31:0] prdata;
  output [7:0] reg_clk_div;
  output [15:0] reg_tx_data;
  input [15:0] master_rx_data;
  input [15:0] slave_rx_data;
  input pclk, presetn, psel, penable, pwrite, core_busy, master_done,
         slave_rx_valid;
  output pready, pslverr, reg_start, reg_master_en;
  wire   N43, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120;

  DFFR_X1 reg_start_reg ( .D(N43), .CK(pclk), .RN(presetn), .Q(reg_start) );
  DFFS_X1 reg_master_en_reg ( .D(n41), .CK(pclk), .SN(presetn), .Q(
        reg_master_en) );
  DFFR_X1 \reg_clk_div_reg[7]  ( .D(n40), .CK(pclk), .RN(presetn), .Q(
        reg_clk_div[7]), .QN(n117) );
  DFFR_X1 \reg_clk_div_reg[6]  ( .D(n39), .CK(pclk), .RN(presetn), .Q(
        reg_clk_div[6]), .QN(n113) );
  DFFR_X1 \reg_clk_div_reg[5]  ( .D(n38), .CK(pclk), .RN(presetn), .Q(
        reg_clk_div[5]), .QN(n116) );
  DFFS_X1 \reg_clk_div_reg[4]  ( .D(n37), .CK(pclk), .SN(presetn), .Q(
        reg_clk_div[4]), .QN(n120) );
  DFFR_X1 \reg_clk_div_reg[3]  ( .D(n36), .CK(pclk), .RN(presetn), .Q(
        reg_clk_div[3]), .QN(n119) );
  DFFS_X1 \reg_clk_div_reg[2]  ( .D(n35), .CK(pclk), .SN(presetn), .Q(
        reg_clk_div[2]) );
  DFFR_X1 \reg_clk_div_reg[1]  ( .D(n34), .CK(pclk), .RN(presetn), .Q(
        reg_clk_div[1]), .QN(n118) );
  DFFR_X1 \reg_clk_div_reg[0]  ( .D(n33), .CK(pclk), .RN(presetn), .Q(
        reg_clk_div[0]), .QN(n114) );
  DFFR_X1 \reg_tx_data_reg[15]  ( .D(n32), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[15]), .QN(n110) );
  DFFR_X1 \reg_tx_data_reg[14]  ( .D(n31), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[14]), .QN(n115) );
  DFFR_X1 \reg_tx_data_reg[13]  ( .D(n30), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[13]), .QN(n112) );
  DFFR_X1 \reg_tx_data_reg[12]  ( .D(n29), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[12]), .QN(n111) );
  DFFR_X1 \reg_tx_data_reg[11]  ( .D(n28), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[11]), .QN(n106) );
  DFFR_X1 \reg_tx_data_reg[10]  ( .D(n27), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[10]), .QN(n105) );
  DFFR_X1 \reg_tx_data_reg[9]  ( .D(n26), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[9]), .QN(n104) );
  DFFR_X1 \reg_tx_data_reg[8]  ( .D(n25), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[8]), .QN(n108) );
  DFFR_X1 \reg_tx_data_reg[7]  ( .D(n24), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[7]) );
  DFFR_X1 \reg_tx_data_reg[6]  ( .D(n23), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[6]) );
  DFFR_X1 \reg_tx_data_reg[5]  ( .D(n22), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[5]) );
  DFFR_X1 \reg_tx_data_reg[4]  ( .D(n21), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[4]) );
  DFFR_X1 \reg_tx_data_reg[3]  ( .D(n20), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[3]) );
  DFFR_X1 \reg_tx_data_reg[2]  ( .D(n19), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[2]), .QN(n107) );
  DFFR_X1 \reg_tx_data_reg[1]  ( .D(n18), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[1]) );
  DFFR_X1 \reg_tx_data_reg[0]  ( .D(n17), .CK(pclk), .RN(presetn), .Q(
        reg_tx_data[0]), .QN(n109) );
  INV_X1 U3 ( .A(pwrite), .ZN(n43) );
  NAND2_X1 U4 ( .A1(n43), .A2(psel), .ZN(n46) );
  NOR2_X1 U5 ( .A1(paddr[3]), .A2(paddr[2]), .ZN(n51) );
  INV_X1 U6 ( .A(paddr[2]), .ZN(n47) );
  NAND3_X1 U7 ( .A1(paddr[3]), .A2(n16), .A3(n47), .ZN(n90) );
  NOR3_X1 U8 ( .A1(pwdata[15]), .A2(pwdata[14]), .A3(pwdata[13]), .ZN(n96) );
  OAI21_X1 U9 ( .B1(pwdata[11]), .B2(pwdata[10]), .A(pwdata[12]), .ZN(n12) );
  NOR4_X1 U10 ( .A1(paddr[30]), .A2(paddr[31]), .A3(paddr[6]), .A4(paddr[5]), 
        .ZN(n9) );
  NOR4_X1 U11 ( .A1(paddr[10]), .A2(paddr[11]), .A3(paddr[28]), .A4(paddr[29]), 
        .ZN(n8) );
  OR4_X1 U12 ( .A1(paddr[1]), .A2(paddr[0]), .A3(paddr[8]), .A4(paddr[9]), 
        .ZN(n6) );
  NOR4_X1 U13 ( .A1(paddr[19]), .A2(paddr[7]), .A3(paddr[4]), .A4(paddr[17]), 
        .ZN(n4) );
  NOR4_X1 U14 ( .A1(paddr[16]), .A2(paddr[14]), .A3(paddr[15]), .A4(paddr[18]), 
        .ZN(n3) );
  NOR4_X1 U15 ( .A1(paddr[26]), .A2(paddr[27]), .A3(paddr[12]), .A4(paddr[22]), 
        .ZN(n2) );
  NOR4_X1 U16 ( .A1(paddr[20]), .A2(paddr[23]), .A3(paddr[24]), .A4(paddr[25]), 
        .ZN(n1) );
  NAND4_X1 U17 ( .A1(n4), .A2(n3), .A3(n2), .A4(n1), .ZN(n5) );
  NOR4_X1 U18 ( .A1(paddr[13]), .A2(paddr[21]), .A3(n6), .A4(n5), .ZN(n7) );
  NAND3_X1 U19 ( .A1(n9), .A2(n8), .A3(n7), .ZN(n48) );
  INV_X1 U20 ( .A(n48), .ZN(n61) );
  NAND2_X1 U21 ( .A1(n61), .A2(psel), .ZN(n11) );
  NAND2_X1 U22 ( .A1(pwrite), .A2(penable), .ZN(n10) );
  NOR2_X1 U23 ( .A1(n11), .A2(n10), .ZN(n16) );
  NAND2_X1 U24 ( .A1(n51), .A2(n16), .ZN(n101) );
  AOI21_X1 U25 ( .B1(n96), .B2(n12), .A(n101), .ZN(n13) );
  INV_X1 U26 ( .A(n13), .ZN(n95) );
  INV_X1 U27 ( .A(n101), .ZN(n103) );
  OAI22_X1 U28 ( .A1(n95), .A2(pwdata[10]), .B1(n103), .B2(reg_clk_div[2]), 
        .ZN(n14) );
  INV_X1 U29 ( .A(n14), .ZN(n35) );
  OAI22_X1 U30 ( .A1(n101), .A2(pwdata[1]), .B1(reg_master_en), .B2(n103), 
        .ZN(n15) );
  INV_X1 U31 ( .A(n15), .ZN(n41) );
  INV_X1 U32 ( .A(n90), .ZN(n91) );
  OAI22_X1 U33 ( .A1(n90), .A2(pwdata[1]), .B1(reg_tx_data[1]), .B2(n91), .ZN(
        n42) );
  INV_X1 U34 ( .A(n42), .ZN(n18) );
  INV_X1 U35 ( .A(n46), .ZN(n50) );
  NAND3_X1 U36 ( .A1(paddr[3]), .A2(paddr[2]), .A3(n50), .ZN(n45) );
  NOR2_X1 U37 ( .A1(n48), .A2(n45), .ZN(n83) );
  NAND3_X1 U38 ( .A1(paddr[3]), .A2(n50), .A3(n47), .ZN(n73) );
  NOR2_X1 U39 ( .A1(n48), .A2(n73), .ZN(n68) );
  AOI22_X1 U40 ( .A1(n83), .A2(master_rx_data[4]), .B1(n68), .B2(
        reg_tx_data[4]), .ZN(n44) );
  INV_X1 U41 ( .A(n44), .ZN(prdata[4]) );
  INV_X1 U42 ( .A(pwdata[0]), .ZN(n88) );
  NOR2_X1 U43 ( .A1(n101), .A2(n88), .ZN(N43) );
  INV_X1 U44 ( .A(n45), .ZN(n85) );
  NOR3_X1 U45 ( .A1(paddr[3]), .A2(n47), .A3(n46), .ZN(n54) );
  AOI22_X1 U46 ( .A1(n85), .A2(master_rx_data[0]), .B1(n54), .B2(core_busy), 
        .ZN(n49) );
  NAND2_X1 U47 ( .A1(n50), .A2(n48), .ZN(n87) );
  OAI211_X1 U48 ( .C1(n109), .C2(n73), .A(n49), .B(n87), .ZN(prdata[0]) );
  AND2_X1 U49 ( .A1(n51), .A2(n50), .ZN(n71) );
  INV_X1 U50 ( .A(n73), .ZN(n59) );
  AOI22_X1 U51 ( .A1(n71), .A2(reg_master_en), .B1(n59), .B2(reg_tx_data[1]), 
        .ZN(n53) );
  AOI22_X1 U52 ( .A1(n85), .A2(master_rx_data[1]), .B1(n54), .B2(master_done), 
        .ZN(n52) );
  NAND3_X1 U53 ( .A1(n53), .A2(n52), .A3(n87), .ZN(prdata[1]) );
  AOI22_X1 U54 ( .A1(n85), .A2(master_rx_data[2]), .B1(n54), .B2(
        slave_rx_valid), .ZN(n55) );
  OAI211_X1 U55 ( .C1(n107), .C2(n73), .A(n55), .B(n87), .ZN(prdata[2]) );
  AOI22_X1 U56 ( .A1(n85), .A2(master_rx_data[3]), .B1(n59), .B2(
        reg_tx_data[3]), .ZN(n56) );
  NAND2_X1 U57 ( .A1(n56), .A2(n87), .ZN(prdata[3]) );
  AOI22_X1 U58 ( .A1(n85), .A2(master_rx_data[5]), .B1(n59), .B2(
        reg_tx_data[5]), .ZN(n57) );
  NAND2_X1 U59 ( .A1(n57), .A2(n87), .ZN(prdata[5]) );
  AOI22_X1 U60 ( .A1(n85), .A2(master_rx_data[6]), .B1(n59), .B2(
        reg_tx_data[6]), .ZN(n58) );
  NAND2_X1 U61 ( .A1(n58), .A2(n87), .ZN(prdata[6]) );
  AOI22_X1 U62 ( .A1(n85), .A2(master_rx_data[7]), .B1(n59), .B2(
        reg_tx_data[7]), .ZN(n60) );
  NAND2_X1 U63 ( .A1(n60), .A2(n87), .ZN(prdata[7]) );
  NAND2_X1 U64 ( .A1(n61), .A2(n71), .ZN(n70) );
  AOI22_X1 U65 ( .A1(n83), .A2(master_rx_data[8]), .B1(reg_tx_data[8]), .B2(
        n68), .ZN(n62) );
  OAI21_X1 U66 ( .B1(n114), .B2(n70), .A(n62), .ZN(prdata[8]) );
  AOI22_X1 U67 ( .A1(reg_clk_div[1]), .A2(n71), .B1(n85), .B2(
        master_rx_data[9]), .ZN(n63) );
  OAI211_X1 U68 ( .C1(n104), .C2(n73), .A(n63), .B(n87), .ZN(prdata[9]) );
  AOI22_X1 U69 ( .A1(reg_clk_div[2]), .A2(n71), .B1(n85), .B2(
        master_rx_data[10]), .ZN(n64) );
  OAI211_X1 U70 ( .C1(n105), .C2(n73), .A(n64), .B(n87), .ZN(prdata[10]) );
  AOI22_X1 U71 ( .A1(reg_clk_div[3]), .A2(n71), .B1(n85), .B2(
        master_rx_data[11]), .ZN(n65) );
  OAI211_X1 U72 ( .C1(n106), .C2(n73), .A(n65), .B(n87), .ZN(prdata[11]) );
  AOI22_X1 U73 ( .A1(n85), .A2(master_rx_data[12]), .B1(n71), .B2(
        reg_clk_div[4]), .ZN(n66) );
  OAI211_X1 U74 ( .C1(n111), .C2(n73), .A(n66), .B(n87), .ZN(prdata[12]) );
  AOI22_X1 U75 ( .A1(n85), .A2(master_rx_data[13]), .B1(n71), .B2(
        reg_clk_div[5]), .ZN(n67) );
  OAI211_X1 U76 ( .C1(n112), .C2(n73), .A(n67), .B(n87), .ZN(prdata[13]) );
  AOI22_X1 U77 ( .A1(n83), .A2(master_rx_data[14]), .B1(n68), .B2(
        reg_tx_data[14]), .ZN(n69) );
  OAI21_X1 U78 ( .B1(n70), .B2(n113), .A(n69), .ZN(prdata[14]) );
  AOI22_X1 U79 ( .A1(n85), .A2(master_rx_data[15]), .B1(n71), .B2(
        reg_clk_div[7]), .ZN(n72) );
  OAI211_X1 U80 ( .C1(n110), .C2(n73), .A(n72), .B(n87), .ZN(prdata[15]) );
  NAND2_X1 U81 ( .A1(n85), .A2(slave_rx_data[0]), .ZN(n74) );
  NAND2_X1 U82 ( .A1(n87), .A2(n74), .ZN(prdata[16]) );
  AND2_X1 U83 ( .A1(n83), .A2(slave_rx_data[1]), .ZN(prdata[17]) );
  NAND2_X1 U84 ( .A1(n85), .A2(slave_rx_data[2]), .ZN(n75) );
  NAND2_X1 U85 ( .A1(n87), .A2(n75), .ZN(prdata[18]) );
  NAND2_X1 U86 ( .A1(n85), .A2(slave_rx_data[3]), .ZN(n76) );
  NAND2_X1 U87 ( .A1(n87), .A2(n76), .ZN(prdata[19]) );
  AND2_X1 U88 ( .A1(n83), .A2(slave_rx_data[4]), .ZN(prdata[20]) );
  NAND2_X1 U89 ( .A1(n85), .A2(slave_rx_data[5]), .ZN(n77) );
  NAND2_X1 U90 ( .A1(n87), .A2(n77), .ZN(prdata[21]) );
  AND2_X1 U91 ( .A1(n83), .A2(slave_rx_data[6]), .ZN(prdata[22]) );
  NAND2_X1 U92 ( .A1(n85), .A2(slave_rx_data[7]), .ZN(n78) );
  NAND2_X1 U93 ( .A1(n87), .A2(n78), .ZN(prdata[23]) );
  AND2_X1 U94 ( .A1(n83), .A2(slave_rx_data[8]), .ZN(prdata[24]) );
  NAND2_X1 U95 ( .A1(n85), .A2(slave_rx_data[9]), .ZN(n79) );
  NAND2_X1 U96 ( .A1(n87), .A2(n79), .ZN(prdata[25]) );
  NAND2_X1 U97 ( .A1(n85), .A2(slave_rx_data[10]), .ZN(n80) );
  NAND2_X1 U98 ( .A1(n87), .A2(n80), .ZN(prdata[26]) );
  NAND2_X1 U99 ( .A1(n85), .A2(slave_rx_data[11]), .ZN(n81) );
  NAND2_X1 U100 ( .A1(n87), .A2(n81), .ZN(prdata[27]) );
  NAND2_X1 U101 ( .A1(n85), .A2(slave_rx_data[12]), .ZN(n82) );
  NAND2_X1 U102 ( .A1(n87), .A2(n82), .ZN(prdata[28]) );
  AND2_X1 U103 ( .A1(n83), .A2(slave_rx_data[13]), .ZN(prdata[29]) );
  NAND2_X1 U104 ( .A1(n85), .A2(slave_rx_data[14]), .ZN(n84) );
  NAND2_X1 U105 ( .A1(n87), .A2(n84), .ZN(prdata[30]) );
  NAND2_X1 U106 ( .A1(n85), .A2(slave_rx_data[15]), .ZN(n86) );
  NAND2_X1 U107 ( .A1(n87), .A2(n86), .ZN(prdata[31]) );
  AOI22_X1 U108 ( .A1(n91), .A2(n88), .B1(n109), .B2(n90), .ZN(n17) );
  MUX2_X1 U109 ( .A(pwdata[2]), .B(reg_tx_data[2]), .S(n90), .Z(n19) );
  MUX2_X1 U110 ( .A(pwdata[3]), .B(reg_tx_data[3]), .S(n90), .Z(n20) );
  MUX2_X1 U111 ( .A(pwdata[4]), .B(reg_tx_data[4]), .S(n90), .Z(n21) );
  MUX2_X1 U112 ( .A(pwdata[5]), .B(reg_tx_data[5]), .S(n90), .Z(n22) );
  MUX2_X1 U113 ( .A(pwdata[6]), .B(reg_tx_data[6]), .S(n90), .Z(n23) );
  MUX2_X1 U114 ( .A(pwdata[7]), .B(reg_tx_data[7]), .S(n90), .Z(n24) );
  INV_X1 U115 ( .A(pwdata[8]), .ZN(n92) );
  AOI22_X1 U116 ( .A1(n91), .A2(n92), .B1(n108), .B2(n90), .ZN(n25) );
  INV_X1 U117 ( .A(pwdata[9]), .ZN(n93) );
  AOI22_X1 U118 ( .A1(n91), .A2(n93), .B1(n104), .B2(n90), .ZN(n26) );
  INV_X1 U119 ( .A(pwdata[10]), .ZN(n89) );
  AOI22_X1 U120 ( .A1(n91), .A2(n89), .B1(n105), .B2(n90), .ZN(n27) );
  INV_X1 U121 ( .A(pwdata[11]), .ZN(n94) );
  AOI22_X1 U122 ( .A1(n91), .A2(n94), .B1(n106), .B2(n90), .ZN(n28) );
  INV_X1 U123 ( .A(pwdata[12]), .ZN(n98) );
  AOI22_X1 U124 ( .A1(n91), .A2(n98), .B1(n111), .B2(n90), .ZN(n29) );
  INV_X1 U125 ( .A(pwdata[13]), .ZN(n99) );
  AOI22_X1 U126 ( .A1(n91), .A2(n99), .B1(n112), .B2(n90), .ZN(n30) );
  INV_X1 U127 ( .A(pwdata[14]), .ZN(n100) );
  AOI22_X1 U128 ( .A1(n91), .A2(n100), .B1(n115), .B2(n90), .ZN(n31) );
  INV_X1 U129 ( .A(pwdata[15]), .ZN(n102) );
  AOI22_X1 U130 ( .A1(n91), .A2(n102), .B1(n110), .B2(n90), .ZN(n32) );
  OAI22_X1 U131 ( .A1(n92), .A2(n95), .B1(n114), .B2(n103), .ZN(n33) );
  OAI22_X1 U132 ( .A1(n93), .A2(n95), .B1(n118), .B2(n103), .ZN(n34) );
  OAI22_X1 U133 ( .A1(n103), .A2(n119), .B1(n95), .B2(n94), .ZN(n36) );
  NOR2_X1 U134 ( .A1(n101), .A2(n96), .ZN(n97) );
  AOI22_X1 U135 ( .A1(n120), .A2(n101), .B1(n98), .B2(n97), .ZN(n37) );
  AOI22_X1 U136 ( .A1(n103), .A2(n99), .B1(n116), .B2(n101), .ZN(n38) );
  AOI22_X1 U137 ( .A1(n103), .A2(n100), .B1(n113), .B2(n101), .ZN(n39) );
  AOI22_X1 U138 ( .A1(n103), .A2(n102), .B1(n117), .B2(n101), .ZN(n40) );
endmodule


module spi_clk_gen_DIV_WIDTH8 ( clk, rst_n, enable, clk_div, spi_clk );
  input [7:0] clk_div;
  input clk, rst_n, enable;
  output spi_clk;
  wire   N25, N26, N27, N28, N29, N30, N31, N32, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56;
  wire   [7:0] div_cnt;

  DFF_X1 spi_clk_reg ( .D(n1), .CK(clk), .Q(spi_clk), .QN(n50) );
  DFF_X1 \div_cnt_reg[7]  ( .D(N32), .CK(clk), .Q(div_cnt[7]) );
  DFF_X1 \div_cnt_reg[6]  ( .D(N31), .CK(clk), .Q(div_cnt[6]), .QN(n55) );
  DFF_X1 \div_cnt_reg[5]  ( .D(N30), .CK(clk), .Q(div_cnt[5]), .QN(n54) );
  DFF_X1 \div_cnt_reg[4]  ( .D(N29), .CK(clk), .Q(div_cnt[4]), .QN(n51) );
  DFF_X1 \div_cnt_reg[3]  ( .D(N28), .CK(clk), .Q(div_cnt[3]), .QN(n53) );
  DFF_X1 \div_cnt_reg[2]  ( .D(N27), .CK(clk), .Q(div_cnt[2]), .QN(n52) );
  DFF_X1 \div_cnt_reg[1]  ( .D(N26), .CK(clk), .Q(div_cnt[1]), .QN(n56) );
  DFF_X1 \div_cnt_reg[0]  ( .D(N25), .CK(clk), .Q(div_cnt[0]), .QN(n49) );
  NOR3_X1 U3 ( .A1(clk_div[2]), .A2(clk_div[1]), .A3(clk_div[0]), .ZN(n21) );
  INV_X1 U4 ( .A(clk_div[3]), .ZN(n14) );
  NAND2_X1 U5 ( .A1(n21), .A2(n14), .ZN(n3) );
  NOR3_X1 U6 ( .A1(clk_div[5]), .A2(clk_div[4]), .A3(n3), .ZN(n31) );
  NOR2_X1 U7 ( .A1(clk_div[7]), .A2(clk_div[6]), .ZN(n30) );
  NOR2_X1 U8 ( .A1(clk_div[1]), .A2(clk_div[0]), .ZN(n9) );
  INV_X1 U9 ( .A(n9), .ZN(n2) );
  AOI21_X1 U10 ( .B1(clk_div[2]), .B2(n2), .A(n21), .ZN(n8) );
  INV_X1 U11 ( .A(n3), .ZN(n6) );
  INV_X1 U12 ( .A(clk_div[4]), .ZN(n4) );
  XOR2_X1 U13 ( .A(clk_div[5]), .B(div_cnt[5]), .Z(n22) );
  AOI221_X1 U14 ( .B1(clk_div[4]), .B2(n51), .C1(n4), .C2(div_cnt[4]), .A(n22), 
        .ZN(n5) );
  OAI22_X1 U15 ( .A1(n6), .A2(n5), .B1(n8), .B2(div_cnt[2]), .ZN(n7) );
  AOI21_X1 U16 ( .B1(n8), .B2(div_cnt[2]), .A(n7), .ZN(n29) );
  AOI21_X1 U17 ( .B1(clk_div[0]), .B2(clk_div[1]), .A(n9), .ZN(n27) );
  XOR2_X1 U18 ( .A(clk_div[7]), .B(div_cnt[7]), .Z(n20) );
  XNOR2_X1 U19 ( .A(n31), .B(clk_div[6]), .ZN(n13) );
  INV_X1 U20 ( .A(n20), .ZN(n12) );
  INV_X1 U21 ( .A(clk_div[6]), .ZN(n10) );
  OAI211_X1 U22 ( .C1(n31), .C2(n10), .A(n12), .B(div_cnt[6]), .ZN(n11) );
  OAI221_X1 U23 ( .B1(n13), .B2(div_cnt[6]), .C1(n12), .C2(n31), .A(n11), .ZN(
        n19) );
  INV_X1 U24 ( .A(clk_div[0]), .ZN(n17) );
  OAI221_X1 U25 ( .B1(div_cnt[4]), .B2(clk_div[4]), .C1(n51), .C2(n22), .A(
        div_cnt[3]), .ZN(n15) );
  OAI211_X1 U26 ( .C1(n21), .C2(div_cnt[3]), .A(n15), .B(n14), .ZN(n16) );
  OAI221_X1 U27 ( .B1(clk_div[0]), .B2(div_cnt[0]), .C1(n17), .C2(n49), .A(n16), .ZN(n18) );
  AOI211_X1 U28 ( .C1(clk_div[6]), .C2(n20), .A(n19), .B(n18), .ZN(n25) );
  XNOR2_X1 U29 ( .A(n21), .B(div_cnt[3]), .ZN(n23) );
  AOI22_X1 U30 ( .A1(clk_div[3]), .A2(n23), .B1(clk_div[4]), .B2(n22), .ZN(n24) );
  OAI211_X1 U31 ( .C1(div_cnt[1]), .C2(n27), .A(n25), .B(n24), .ZN(n26) );
  AOI21_X1 U32 ( .B1(div_cnt[1]), .B2(n27), .A(n26), .ZN(n28) );
  AOI22_X1 U33 ( .A1(n31), .A2(n30), .B1(n29), .B2(n28), .ZN(n48) );
  AND4_X1 U34 ( .A1(n48), .A2(rst_n), .A3(enable), .A4(n49), .ZN(N25) );
  NAND2_X1 U35 ( .A1(div_cnt[1]), .A2(div_cnt[0]), .ZN(n34) );
  NAND4_X1 U36 ( .A1(rst_n), .A2(n48), .A3(enable), .A4(n34), .ZN(n32) );
  AOI21_X1 U37 ( .B1(n56), .B2(n49), .A(n32), .ZN(N26) );
  OR2_X1 U38 ( .A1(n52), .A2(n34), .ZN(n36) );
  NAND4_X1 U39 ( .A1(rst_n), .A2(n48), .A3(enable), .A4(n36), .ZN(n33) );
  AOI21_X1 U40 ( .B1(n52), .B2(n34), .A(n33), .ZN(N27) );
  OR2_X1 U41 ( .A1(n53), .A2(n36), .ZN(n38) );
  NAND4_X1 U42 ( .A1(rst_n), .A2(n48), .A3(enable), .A4(n38), .ZN(n35) );
  AOI21_X1 U43 ( .B1(n53), .B2(n36), .A(n35), .ZN(N28) );
  OR2_X1 U44 ( .A1(n51), .A2(n38), .ZN(n40) );
  NAND4_X1 U45 ( .A1(rst_n), .A2(n48), .A3(enable), .A4(n40), .ZN(n37) );
  AOI21_X1 U46 ( .B1(n51), .B2(n38), .A(n37), .ZN(N29) );
  OR2_X1 U47 ( .A1(n54), .A2(n40), .ZN(n43) );
  NAND4_X1 U48 ( .A1(rst_n), .A2(n48), .A3(enable), .A4(n43), .ZN(n39) );
  AOI21_X1 U49 ( .B1(n54), .B2(n40), .A(n39), .ZN(N30) );
  NOR2_X1 U50 ( .A1(n55), .A2(n43), .ZN(n46) );
  INV_X1 U51 ( .A(n46), .ZN(n41) );
  NAND4_X1 U52 ( .A1(rst_n), .A2(n48), .A3(enable), .A4(n41), .ZN(n42) );
  AOI21_X1 U53 ( .B1(n55), .B2(n43), .A(n42), .ZN(N31) );
  AND2_X1 U54 ( .A1(rst_n), .A2(enable), .ZN(n44) );
  OAI211_X1 U55 ( .C1(div_cnt[7]), .C2(n46), .A(n44), .B(n48), .ZN(n45) );
  AOI21_X1 U56 ( .B1(div_cnt[7]), .B2(n46), .A(n45), .ZN(N32) );
  OAI211_X1 U57 ( .C1(n50), .C2(n48), .A(rst_n), .B(enable), .ZN(n47) );
  AOI21_X1 U58 ( .B1(n50), .B2(n48), .A(n47), .ZN(n1) );
endmodule


module spi_master_DIV_WIDTH8 ( clk, rst_n, start, tx_data, clk_div, miso, mosi, 
        sclk, cs_n, rx_data, busy, done );
  input [15:0] tx_data;
  input [7:0] clk_div;
  output [15:0] rx_data;
  input clk, rst_n, start, miso;
  output mosi, sclk, cs_n, busy, done;
  wire   spi_clk_en, spi_clk_d, cs_hold_active, N123, N164, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n2, n3, n4, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196;
  wire   [7:0] active_clk_div;
  wire   [4:0] cs_hold_cnt;
  wire   [3:0] bit_cnt;
  wire   [14:0] tx_shift_reg;

  spi_clk_gen_DIV_WIDTH8 u_spi_clk_gen ( .clk(clk), .rst_n(rst_n), .enable(
        spi_clk_en), .clk_div(active_clk_div), .spi_clk(sclk) );
  DFF_X1 busy_reg ( .D(n73), .CK(clk), .Q(busy), .QN(n174) );
  DFF_X1 \bit_cnt_reg[1]  ( .D(n72), .CK(clk), .Q(bit_cnt[1]) );
  DFF_X1 cs_hold_active_reg ( .D(n71), .CK(clk), .Q(cs_hold_active), .QN(n165)
         );
  DFF_X1 \cs_hold_cnt_reg[4]  ( .D(n70), .CK(clk), .Q(cs_hold_cnt[4]) );
  DFF_X1 \cs_hold_cnt_reg[0]  ( .D(n69), .CK(clk), .Q(cs_hold_cnt[0]), .QN(
        n179) );
  DFF_X1 \cs_hold_cnt_reg[1]  ( .D(n68), .CK(clk), .Q(cs_hold_cnt[1]) );
  DFF_X1 \cs_hold_cnt_reg[2]  ( .D(n67), .CK(clk), .Q(cs_hold_cnt[2]), .QN(
        n177) );
  DFF_X1 \cs_hold_cnt_reg[3]  ( .D(n66), .CK(clk), .Q(cs_hold_cnt[3]), .QN(
        n176) );
  DFF_X1 done_reg ( .D(N164), .CK(clk), .Q(done) );
  DFF_X1 \active_clk_div_reg[0]  ( .D(n65), .CK(clk), .Q(active_clk_div[0]) );
  DFF_X1 \active_clk_div_reg[7]  ( .D(n64), .CK(clk), .Q(active_clk_div[7]) );
  DFF_X1 \active_clk_div_reg[6]  ( .D(n63), .CK(clk), .Q(active_clk_div[6]) );
  DFF_X1 \active_clk_div_reg[5]  ( .D(n62), .CK(clk), .Q(active_clk_div[5]) );
  DFF_X1 \active_clk_div_reg[4]  ( .D(n61), .CK(clk), .Q(active_clk_div[4]) );
  DFF_X1 \active_clk_div_reg[3]  ( .D(n60), .CK(clk), .Q(active_clk_div[3]) );
  DFF_X1 \active_clk_div_reg[2]  ( .D(n59), .CK(clk), .Q(active_clk_div[2]) );
  DFF_X1 \active_clk_div_reg[1]  ( .D(n58), .CK(clk), .Q(active_clk_div[1]) );
  DFF_X1 cs_n_reg ( .D(n57), .CK(clk), .Q(cs_n), .QN(n196) );
  DFF_X1 spi_clk_en_reg ( .D(n56), .CK(clk), .Q(spi_clk_en) );
  DFF_X1 spi_clk_d_reg ( .D(N123), .CK(clk), .Q(spi_clk_d) );
  DFF_X1 \rx_shift_reg_reg[0]  ( .D(n55), .CK(clk), .QN(n172) );
  DFF_X1 \rx_data_reg[0]  ( .D(n54), .CK(clk), .Q(rx_data[0]), .QN(n195) );
  DFF_X1 \rx_shift_reg_reg[1]  ( .D(n53), .CK(clk), .QN(n158) );
  DFF_X1 \rx_shift_reg_reg[2]  ( .D(n52), .CK(clk), .QN(n171) );
  DFF_X1 \rx_shift_reg_reg[3]  ( .D(n51), .CK(clk), .QN(n164) );
  DFF_X1 \rx_shift_reg_reg[4]  ( .D(n50), .CK(clk), .QN(n170) );
  DFF_X1 \rx_shift_reg_reg[5]  ( .D(n49), .CK(clk), .QN(n163) );
  DFF_X1 \rx_shift_reg_reg[6]  ( .D(n48), .CK(clk), .QN(n169) );
  DFF_X1 \rx_shift_reg_reg[7]  ( .D(n47), .CK(clk), .QN(n162) );
  DFF_X1 \rx_shift_reg_reg[8]  ( .D(n46), .CK(clk), .QN(n168) );
  DFF_X1 \rx_shift_reg_reg[9]  ( .D(n45), .CK(clk), .QN(n161) );
  DFF_X1 \rx_shift_reg_reg[10]  ( .D(n44), .CK(clk), .QN(n167) );
  DFF_X1 \rx_shift_reg_reg[11]  ( .D(n43), .CK(clk), .QN(n160) );
  DFF_X1 \rx_shift_reg_reg[12]  ( .D(n42), .CK(clk), .QN(n166) );
  DFF_X1 \rx_shift_reg_reg[13]  ( .D(n41), .CK(clk), .QN(n159) );
  DFF_X1 \rx_shift_reg_reg[14]  ( .D(n40), .CK(clk), .QN(n157) );
  DFF_X1 \rx_shift_reg_reg[15]  ( .D(n39), .CK(clk), .QN(n173) );
  DFF_X1 \rx_data_reg[15]  ( .D(n38), .CK(clk), .Q(rx_data[15]), .QN(n194) );
  DFF_X1 \rx_data_reg[14]  ( .D(n37), .CK(clk), .Q(rx_data[14]), .QN(n193) );
  DFF_X1 \rx_data_reg[13]  ( .D(n36), .CK(clk), .Q(rx_data[13]), .QN(n192) );
  DFF_X1 \rx_data_reg[12]  ( .D(n35), .CK(clk), .Q(rx_data[12]), .QN(n191) );
  DFF_X1 \rx_data_reg[11]  ( .D(n34), .CK(clk), .Q(rx_data[11]), .QN(n182) );
  DFF_X1 \rx_data_reg[10]  ( .D(n33), .CK(clk), .Q(rx_data[10]), .QN(n181) );
  DFF_X1 \rx_data_reg[9]  ( .D(n32), .CK(clk), .Q(rx_data[9]), .QN(n180) );
  DFF_X1 \rx_data_reg[8]  ( .D(n31), .CK(clk), .Q(rx_data[8]), .QN(n190) );
  DFF_X1 \rx_data_reg[7]  ( .D(n30), .CK(clk), .Q(rx_data[7]), .QN(n189) );
  DFF_X1 \rx_data_reg[6]  ( .D(n29), .CK(clk), .Q(rx_data[6]), .QN(n188) );
  DFF_X1 \rx_data_reg[5]  ( .D(n28), .CK(clk), .Q(rx_data[5]), .QN(n187) );
  DFF_X1 \rx_data_reg[4]  ( .D(n27), .CK(clk), .Q(rx_data[4]), .QN(n186) );
  DFF_X1 \rx_data_reg[3]  ( .D(n26), .CK(clk), .Q(rx_data[3]), .QN(n185) );
  DFF_X1 \rx_data_reg[2]  ( .D(n25), .CK(clk), .Q(rx_data[2]), .QN(n184) );
  DFF_X1 \rx_data_reg[1]  ( .D(n24), .CK(clk), .Q(rx_data[1]), .QN(n183) );
  DFF_X1 \bit_cnt_reg[0]  ( .D(n23), .CK(clk), .Q(bit_cnt[0]), .QN(n178) );
  DFF_X1 \bit_cnt_reg[2]  ( .D(n22), .CK(clk), .Q(bit_cnt[2]) );
  DFF_X1 \bit_cnt_reg[3]  ( .D(n21), .CK(clk), .QN(n175) );
  DFF_X1 \tx_shift_reg_reg[0]  ( .D(n20), .CK(clk), .Q(tx_shift_reg[0]) );
  DFF_X1 \tx_shift_reg_reg[1]  ( .D(n19), .CK(clk), .Q(tx_shift_reg[1]) );
  DFF_X1 \tx_shift_reg_reg[2]  ( .D(n18), .CK(clk), .Q(tx_shift_reg[2]) );
  DFF_X1 \tx_shift_reg_reg[3]  ( .D(n17), .CK(clk), .Q(tx_shift_reg[3]) );
  DFF_X1 \tx_shift_reg_reg[4]  ( .D(n16), .CK(clk), .Q(tx_shift_reg[4]) );
  DFF_X1 \tx_shift_reg_reg[5]  ( .D(n15), .CK(clk), .Q(tx_shift_reg[5]) );
  DFF_X1 \tx_shift_reg_reg[6]  ( .D(n14), .CK(clk), .Q(tx_shift_reg[6]) );
  DFF_X1 \tx_shift_reg_reg[7]  ( .D(n13), .CK(clk), .Q(tx_shift_reg[7]) );
  DFF_X1 \tx_shift_reg_reg[8]  ( .D(n12), .CK(clk), .Q(tx_shift_reg[8]) );
  DFF_X1 \tx_shift_reg_reg[9]  ( .D(n11), .CK(clk), .Q(tx_shift_reg[9]) );
  DFF_X1 \tx_shift_reg_reg[10]  ( .D(n10), .CK(clk), .Q(tx_shift_reg[10]) );
  DFF_X1 \tx_shift_reg_reg[11]  ( .D(n9), .CK(clk), .Q(tx_shift_reg[11]) );
  DFF_X1 \tx_shift_reg_reg[12]  ( .D(n8), .CK(clk), .Q(tx_shift_reg[12]) );
  DFF_X1 \tx_shift_reg_reg[13]  ( .D(n7), .CK(clk), .Q(tx_shift_reg[13]) );
  DFF_X1 \tx_shift_reg_reg[14]  ( .D(n6), .CK(clk), .Q(tx_shift_reg[14]) );
  DFF_X1 mosi_reg ( .D(n5), .CK(clk), .Q(mosi) );
  AOI21_X2 U3 ( .B1(n84), .B2(n118), .A(n83), .ZN(n108) );
  NAND2_X1 U4 ( .A1(cs_hold_cnt[0]), .A2(cs_hold_cnt[1]), .ZN(n2) );
  NOR2_X1 U5 ( .A1(cs_hold_cnt[2]), .A2(n2), .ZN(n140) );
  NAND3_X1 U6 ( .A1(n140), .A2(cs_hold_cnt[4]), .A3(n176), .ZN(n153) );
  NOR2_X1 U7 ( .A1(n153), .A2(n165), .ZN(n137) );
  AND2_X1 U8 ( .A1(rst_n), .A2(n137), .ZN(N164) );
  NOR2_X1 U9 ( .A1(n177), .A2(n2), .ZN(n147) );
  NAND3_X1 U10 ( .A1(cs_hold_active), .A2(rst_n), .A3(n153), .ZN(n145) );
  INV_X1 U11 ( .A(start), .ZN(n74) );
  NAND3_X1 U12 ( .A1(bit_cnt[1]), .A2(bit_cnt[0]), .A3(bit_cnt[2]), .ZN(n122)
         );
  NOR2_X1 U13 ( .A1(n122), .A2(n175), .ZN(n114) );
  INV_X1 U14 ( .A(sclk), .ZN(n111) );
  AND2_X1 U15 ( .A1(n111), .A2(spi_clk_d), .ZN(n118) );
  NAND2_X1 U16 ( .A1(n114), .A2(n118), .ZN(n133) );
  AND2_X1 U17 ( .A1(n165), .A2(rst_n), .ZN(n101) );
  OAI221_X1 U18 ( .B1(busy), .B2(n74), .C1(n174), .C2(n133), .A(n101), .ZN(
        n146) );
  OAI21_X1 U19 ( .B1(n147), .B2(n145), .A(n146), .ZN(n149) );
  NOR2_X1 U20 ( .A1(cs_hold_cnt[3]), .A2(n145), .ZN(n148) );
  AOI22_X1 U21 ( .A1(cs_hold_cnt[3]), .A2(n149), .B1(n148), .B2(n147), .ZN(n3)
         );
  INV_X1 U22 ( .A(n3), .ZN(n66) );
  NOR2_X1 U23 ( .A1(cs_hold_cnt[1]), .A2(n145), .ZN(n142) );
  OAI21_X1 U24 ( .B1(cs_hold_cnt[0]), .B2(n145), .A(n146), .ZN(n141) );
  AOI22_X1 U25 ( .A1(cs_hold_cnt[0]), .A2(n142), .B1(cs_hold_cnt[1]), .B2(n141), .ZN(n4) );
  INV_X1 U26 ( .A(n4), .ZN(n68) );
  NAND2_X1 U27 ( .A1(n165), .A2(n174), .ZN(n117) );
  OAI21_X1 U28 ( .B1(n74), .B2(n117), .A(rst_n), .ZN(n83) );
  INV_X1 U29 ( .A(n83), .ZN(n102) );
  INV_X1 U30 ( .A(rst_n), .ZN(n112) );
  OR2_X1 U31 ( .A1(n102), .A2(n112), .ZN(n134) );
  OAI22_X1 U32 ( .A1(active_clk_div[0]), .A2(n83), .B1(clk_div[0]), .B2(n134), 
        .ZN(n75) );
  INV_X1 U33 ( .A(n75), .ZN(n65) );
  INV_X1 U34 ( .A(n134), .ZN(n115) );
  AOI22_X1 U35 ( .A1(n102), .A2(active_clk_div[1]), .B1(n115), .B2(clk_div[1]), 
        .ZN(n76) );
  INV_X1 U36 ( .A(n76), .ZN(n58) );
  AOI22_X1 U37 ( .A1(n102), .A2(active_clk_div[6]), .B1(n115), .B2(clk_div[6]), 
        .ZN(n77) );
  INV_X1 U38 ( .A(n77), .ZN(n63) );
  AOI22_X1 U39 ( .A1(n102), .A2(active_clk_div[7]), .B1(n115), .B2(clk_div[7]), 
        .ZN(n78) );
  INV_X1 U40 ( .A(n78), .ZN(n64) );
  AOI22_X1 U41 ( .A1(n102), .A2(active_clk_div[5]), .B1(n115), .B2(clk_div[5]), 
        .ZN(n79) );
  INV_X1 U42 ( .A(n79), .ZN(n62) );
  AOI22_X1 U43 ( .A1(n102), .A2(active_clk_div[4]), .B1(n115), .B2(clk_div[4]), 
        .ZN(n80) );
  INV_X1 U44 ( .A(n80), .ZN(n61) );
  AOI22_X1 U45 ( .A1(n102), .A2(active_clk_div[2]), .B1(n115), .B2(clk_div[2]), 
        .ZN(n81) );
  INV_X1 U46 ( .A(n81), .ZN(n59) );
  AOI22_X1 U47 ( .A1(n102), .A2(active_clk_div[3]), .B1(n115), .B2(clk_div[3]), 
        .ZN(n82) );
  INV_X1 U48 ( .A(n82), .ZN(n60) );
  NOR2_X1 U49 ( .A1(n174), .A2(cs_hold_active), .ZN(n127) );
  INV_X1 U50 ( .A(n127), .ZN(n126) );
  NOR2_X1 U51 ( .A1(n126), .A2(n114), .ZN(n84) );
  AOI22_X1 U52 ( .A1(n108), .A2(tx_shift_reg[0]), .B1(n115), .B2(tx_data[0]), 
        .ZN(n85) );
  INV_X1 U53 ( .A(n85), .ZN(n20) );
  INV_X1 U54 ( .A(n108), .ZN(n125) );
  NOR2_X1 U55 ( .A1(n112), .A2(n126), .ZN(n113) );
  NAND2_X1 U56 ( .A1(n125), .A2(n113), .ZN(n124) );
  INV_X1 U57 ( .A(n124), .ZN(n99) );
  AOI222_X1 U58 ( .A1(n108), .A2(tx_shift_reg[7]), .B1(n99), .B2(
        tx_shift_reg[6]), .C1(n115), .C2(tx_data[7]), .ZN(n86) );
  INV_X1 U59 ( .A(n86), .ZN(n13) );
  AOI222_X1 U60 ( .A1(n108), .A2(tx_shift_reg[5]), .B1(n99), .B2(
        tx_shift_reg[4]), .C1(n115), .C2(tx_data[5]), .ZN(n87) );
  INV_X1 U61 ( .A(n87), .ZN(n15) );
  AOI222_X1 U62 ( .A1(n108), .A2(tx_shift_reg[4]), .B1(n99), .B2(
        tx_shift_reg[3]), .C1(n115), .C2(tx_data[4]), .ZN(n88) );
  INV_X1 U63 ( .A(n88), .ZN(n16) );
  AOI222_X1 U64 ( .A1(n108), .A2(tx_shift_reg[6]), .B1(n99), .B2(
        tx_shift_reg[5]), .C1(n115), .C2(tx_data[6]), .ZN(n89) );
  INV_X1 U65 ( .A(n89), .ZN(n14) );
  AOI222_X1 U66 ( .A1(n108), .A2(tx_shift_reg[12]), .B1(n99), .B2(
        tx_shift_reg[11]), .C1(n115), .C2(tx_data[12]), .ZN(n90) );
  INV_X1 U67 ( .A(n90), .ZN(n8) );
  AOI222_X1 U68 ( .A1(n108), .A2(tx_shift_reg[13]), .B1(n99), .B2(
        tx_shift_reg[12]), .C1(n115), .C2(tx_data[13]), .ZN(n91) );
  INV_X1 U69 ( .A(n91), .ZN(n7) );
  AOI222_X1 U70 ( .A1(n108), .A2(tx_shift_reg[14]), .B1(n99), .B2(
        tx_shift_reg[13]), .C1(n115), .C2(tx_data[14]), .ZN(n92) );
  INV_X1 U71 ( .A(n92), .ZN(n6) );
  AOI222_X1 U72 ( .A1(n108), .A2(tx_shift_reg[1]), .B1(n99), .B2(
        tx_shift_reg[0]), .C1(n115), .C2(tx_data[1]), .ZN(n93) );
  INV_X1 U73 ( .A(n93), .ZN(n19) );
  AOI222_X1 U74 ( .A1(n108), .A2(tx_shift_reg[3]), .B1(n99), .B2(
        tx_shift_reg[2]), .C1(n115), .C2(tx_data[3]), .ZN(n94) );
  INV_X1 U75 ( .A(n94), .ZN(n17) );
  AOI222_X1 U76 ( .A1(n108), .A2(tx_shift_reg[2]), .B1(n99), .B2(
        tx_shift_reg[1]), .C1(n115), .C2(tx_data[2]), .ZN(n95) );
  INV_X1 U77 ( .A(n95), .ZN(n18) );
  AOI222_X1 U78 ( .A1(n108), .A2(tx_shift_reg[9]), .B1(n99), .B2(
        tx_shift_reg[8]), .C1(n115), .C2(tx_data[9]), .ZN(n96) );
  INV_X1 U79 ( .A(n96), .ZN(n11) );
  AOI222_X1 U80 ( .A1(n108), .A2(tx_shift_reg[11]), .B1(n99), .B2(
        tx_shift_reg[10]), .C1(n115), .C2(tx_data[11]), .ZN(n97) );
  INV_X1 U81 ( .A(n97), .ZN(n9) );
  AOI222_X1 U82 ( .A1(n108), .A2(tx_shift_reg[10]), .B1(n99), .B2(
        tx_shift_reg[9]), .C1(n115), .C2(tx_data[10]), .ZN(n98) );
  INV_X1 U83 ( .A(n98), .ZN(n10) );
  AOI222_X1 U84 ( .A1(n108), .A2(tx_shift_reg[8]), .B1(n99), .B2(
        tx_shift_reg[7]), .C1(n115), .C2(tx_data[8]), .ZN(n100) );
  INV_X1 U85 ( .A(n100), .ZN(n12) );
  AND2_X1 U86 ( .A1(n101), .A2(n174), .ZN(n138) );
  NOR2_X1 U87 ( .A1(n137), .A2(n174), .ZN(n103) );
  MUX2_X1 U88 ( .A(n138), .B(n103), .S(n102), .Z(n73) );
  NOR2_X1 U89 ( .A1(n178), .A2(n124), .ZN(n106) );
  AOI21_X1 U90 ( .B1(n113), .B2(n178), .A(n108), .ZN(n104) );
  INV_X1 U91 ( .A(n104), .ZN(n105) );
  MUX2_X1 U92 ( .A(n106), .B(n105), .S(bit_cnt[1]), .Z(n72) );
  NAND2_X1 U93 ( .A1(bit_cnt[1]), .A2(bit_cnt[0]), .ZN(n107) );
  NOR2_X1 U94 ( .A1(n107), .A2(n124), .ZN(n110) );
  AOI21_X1 U95 ( .B1(n113), .B2(n122), .A(n108), .ZN(n123) );
  INV_X1 U96 ( .A(n123), .ZN(n109) );
  MUX2_X1 U97 ( .A(n110), .B(n109), .S(bit_cnt[2]), .Z(n22) );
  NOR2_X1 U98 ( .A1(n112), .A2(n111), .ZN(N123) );
  INV_X1 U99 ( .A(n113), .ZN(n155) );
  NOR2_X1 U100 ( .A1(n114), .A2(n155), .ZN(n116) );
  AOI22_X1 U101 ( .A1(tx_shift_reg[14]), .A2(n116), .B1(n115), .B2(tx_data[15]), .ZN(n121) );
  NAND2_X1 U102 ( .A1(rst_n), .A2(n117), .ZN(n136) );
  AOI21_X1 U103 ( .B1(n118), .B2(n165), .A(n136), .ZN(n120) );
  NAND2_X1 U104 ( .A1(n120), .A2(mosi), .ZN(n119) );
  OAI21_X1 U105 ( .B1(n121), .B2(n120), .A(n119), .ZN(n5) );
  OAI22_X1 U106 ( .A1(n123), .A2(n175), .B1(n122), .B2(n124), .ZN(n21) );
  AOI22_X1 U107 ( .A1(bit_cnt[0]), .A2(n125), .B1(n124), .B2(n178), .ZN(n23)
         );
  OAI21_X2 U108 ( .B1(n133), .B2(n126), .A(rst_n), .ZN(n152) );
  NAND2_X1 U109 ( .A1(rst_n), .A2(n152), .ZN(n129) );
  OAI22_X1 U110 ( .A1(n152), .A2(n183), .B1(n129), .B2(n158), .ZN(n24) );
  OAI22_X1 U111 ( .A1(n152), .A2(n184), .B1(n129), .B2(n171), .ZN(n25) );
  OAI22_X1 U112 ( .A1(n152), .A2(n185), .B1(n129), .B2(n164), .ZN(n26) );
  OAI22_X1 U113 ( .A1(n152), .A2(n186), .B1(n129), .B2(n170), .ZN(n27) );
  OAI22_X1 U114 ( .A1(n152), .A2(n187), .B1(n129), .B2(n163), .ZN(n28) );
  OAI22_X1 U115 ( .A1(n152), .A2(n188), .B1(n129), .B2(n169), .ZN(n29) );
  OAI22_X1 U116 ( .A1(n152), .A2(n189), .B1(n129), .B2(n162), .ZN(n30) );
  OAI22_X1 U117 ( .A1(n152), .A2(n190), .B1(n129), .B2(n168), .ZN(n31) );
  OAI22_X1 U118 ( .A1(n152), .A2(n180), .B1(n129), .B2(n161), .ZN(n32) );
  OAI22_X1 U119 ( .A1(n152), .A2(n181), .B1(n129), .B2(n167), .ZN(n33) );
  OAI22_X1 U120 ( .A1(n152), .A2(n182), .B1(n129), .B2(n160), .ZN(n34) );
  OAI22_X1 U121 ( .A1(n152), .A2(n191), .B1(n129), .B2(n166), .ZN(n35) );
  OAI22_X1 U122 ( .A1(n152), .A2(n192), .B1(n129), .B2(n159), .ZN(n36) );
  OAI22_X1 U123 ( .A1(n152), .A2(n193), .B1(n129), .B2(n157), .ZN(n37) );
  OAI22_X1 U124 ( .A1(n152), .A2(n194), .B1(n129), .B2(n173), .ZN(n38) );
  NAND2_X1 U125 ( .A1(n127), .A2(sclk), .ZN(n128) );
  OAI21_X2 U126 ( .B1(spi_clk_d), .B2(n128), .A(rst_n), .ZN(n132) );
  NAND2_X1 U127 ( .A1(rst_n), .A2(n132), .ZN(n131) );
  OAI22_X1 U128 ( .A1(n157), .A2(n131), .B1(n173), .B2(n132), .ZN(n39) );
  OAI22_X1 U129 ( .A1(n159), .A2(n131), .B1(n157), .B2(n132), .ZN(n40) );
  OAI22_X1 U130 ( .A1(n166), .A2(n131), .B1(n159), .B2(n132), .ZN(n41) );
  OAI22_X1 U131 ( .A1(n160), .A2(n131), .B1(n166), .B2(n132), .ZN(n42) );
  OAI22_X1 U132 ( .A1(n167), .A2(n131), .B1(n160), .B2(n132), .ZN(n43) );
  OAI22_X1 U133 ( .A1(n161), .A2(n131), .B1(n167), .B2(n132), .ZN(n44) );
  OAI22_X1 U134 ( .A1(n168), .A2(n131), .B1(n161), .B2(n132), .ZN(n45) );
  OAI22_X1 U135 ( .A1(n162), .A2(n131), .B1(n168), .B2(n132), .ZN(n46) );
  OAI22_X1 U136 ( .A1(n169), .A2(n131), .B1(n162), .B2(n132), .ZN(n47) );
  OAI22_X1 U137 ( .A1(n163), .A2(n131), .B1(n169), .B2(n132), .ZN(n48) );
  OAI22_X1 U138 ( .A1(n170), .A2(n131), .B1(n163), .B2(n132), .ZN(n49) );
  OAI22_X1 U139 ( .A1(n164), .A2(n131), .B1(n170), .B2(n132), .ZN(n50) );
  OAI22_X1 U140 ( .A1(n171), .A2(n131), .B1(n164), .B2(n132), .ZN(n51) );
  OAI22_X1 U141 ( .A1(n158), .A2(n131), .B1(n171), .B2(n132), .ZN(n52) );
  OAI22_X1 U142 ( .A1(n158), .A2(n132), .B1(n172), .B2(n131), .ZN(n53) );
  OAI22_X1 U143 ( .A1(n152), .A2(n195), .B1(n129), .B2(n172), .ZN(n54) );
  INV_X1 U144 ( .A(miso), .ZN(n130) );
  OAI22_X1 U145 ( .A1(n172), .A2(n132), .B1(n131), .B2(n130), .ZN(n55) );
  OAI21_X1 U146 ( .B1(cs_hold_active), .B2(n133), .A(spi_clk_en), .ZN(n135) );
  OAI21_X1 U147 ( .B1(n136), .B2(n135), .A(n134), .ZN(n56) );
  NOR2_X1 U148 ( .A1(n137), .A2(n136), .ZN(n139) );
  AOI22_X1 U149 ( .A1(n196), .A2(n139), .B1(start), .B2(n138), .ZN(n57) );
  INV_X1 U150 ( .A(n140), .ZN(n144) );
  OAI21_X1 U151 ( .B1(n142), .B2(n141), .A(cs_hold_cnt[2]), .ZN(n143) );
  OAI21_X1 U152 ( .B1(n145), .B2(n144), .A(n143), .ZN(n67) );
  AOI22_X1 U153 ( .A1(cs_hold_cnt[0]), .A2(n146), .B1(n145), .B2(n179), .ZN(
        n69) );
  NAND4_X1 U154 ( .A1(cs_hold_cnt[3]), .A2(cs_hold_active), .A3(rst_n), .A4(
        n147), .ZN(n151) );
  OAI21_X1 U155 ( .B1(n149), .B2(n148), .A(cs_hold_cnt[4]), .ZN(n150) );
  OAI21_X1 U156 ( .B1(cs_hold_cnt[4]), .B2(n151), .A(n150), .ZN(n70) );
  INV_X1 U157 ( .A(n152), .ZN(n156) );
  NAND2_X1 U158 ( .A1(n156), .A2(n153), .ZN(n154) );
  AOI22_X1 U159 ( .A1(n156), .A2(n165), .B1(n155), .B2(n154), .ZN(n71) );
endmodule


module spi_slave ( clk, rst_n, sclk, cs_n, mosi, miso, tx_data, rx_data, 
        rx_valid, miso_oe_BAR );
  input [15:0] tx_data;
  output [15:0] rx_data;
  input clk, rst_n, sclk, cs_n, mosi;
  output miso, rx_valid, miso_oe_BAR;
  wire   N46, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126;
  wire   [2:0] sclk_sync;
  wire   [2:0] cs_n_sync;
  wire   [1:0] mosi_sync;
  wire   [14:0] rx_shift_reg;
  wire   [3:0] bit_cnt;
  wire   [14:0] tx_shift_reg;

  DFFR_X1 \mosi_sync_reg[0]  ( .D(mosi), .CK(clk), .RN(rst_n), .Q(mosi_sync[0]) );
  DFFR_X1 \mosi_sync_reg[1]  ( .D(mosi_sync[0]), .CK(clk), .RN(rst_n), .Q(
        mosi_sync[1]) );
  DFFR_X1 \sclk_sync_reg[0]  ( .D(sclk), .CK(clk), .RN(rst_n), .Q(sclk_sync[0]) );
  DFFR_X1 \sclk_sync_reg[1]  ( .D(sclk_sync[0]), .CK(clk), .RN(rst_n), .Q(
        sclk_sync[1]) );
  DFFR_X1 \sclk_sync_reg[2]  ( .D(sclk_sync[1]), .CK(clk), .RN(rst_n), .QN(
        n119) );
  DFFS_X1 \cs_n_sync_reg[0]  ( .D(cs_n), .CK(clk), .SN(rst_n), .Q(cs_n_sync[0]) );
  DFFS_X1 \cs_n_sync_reg[1]  ( .D(cs_n_sync[0]), .CK(clk), .SN(rst_n), .Q(
        cs_n_sync[1]), .QN(n118) );
  DFFS_X1 \cs_n_sync_reg[2]  ( .D(cs_n_sync[1]), .CK(clk), .SN(rst_n), .Q(
        cs_n_sync[2]) );
  DFFR_X1 miso_oe_reg ( .D(n118), .CK(clk), .RN(rst_n), .QN(miso_oe_BAR) );
  DFFR_X1 \rx_shift_reg_reg[0]  ( .D(n84), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[0]), .QN(n123) );
  DFFR_X1 \rx_shift_reg_reg[1]  ( .D(n83), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[1]), .QN(n116) );
  DFFR_X1 \rx_shift_reg_reg[2]  ( .D(n82), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[2]), .QN(n122) );
  DFFR_X1 \rx_shift_reg_reg[3]  ( .D(n81), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[3]), .QN(n115) );
  DFFR_X1 \rx_shift_reg_reg[4]  ( .D(n80), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[4]), .QN(n121) );
  DFFR_X1 \rx_shift_reg_reg[5]  ( .D(n79), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[5]), .QN(n114) );
  DFFR_X1 \rx_shift_reg_reg[6]  ( .D(n78), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[6]), .QN(n108) );
  DFFR_X1 \rx_shift_reg_reg[7]  ( .D(n77), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[7]), .QN(n113) );
  DFFR_X1 \rx_shift_reg_reg[8]  ( .D(n76), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[8]), .QN(n107) );
  DFFR_X1 \rx_shift_reg_reg[9]  ( .D(n75), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[9]), .QN(n112) );
  DFFR_X1 \rx_shift_reg_reg[10]  ( .D(n74), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[10]), .QN(n106) );
  DFFR_X1 \rx_shift_reg_reg[11]  ( .D(n73), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[11]), .QN(n111) );
  DFFR_X1 \rx_shift_reg_reg[12]  ( .D(n72), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[12]), .QN(n104) );
  DFFR_X1 \rx_shift_reg_reg[13]  ( .D(n71), .CK(clk), .RN(rst_n), .QN(n109) );
  DFFR_X1 \rx_shift_reg_reg[14]  ( .D(n70), .CK(clk), .RN(rst_n), .Q(
        rx_shift_reg[14]), .QN(n117) );
  DFFR_X1 \tx_shift_reg_reg[0]  ( .D(n69), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[0]) );
  DFFR_X1 \tx_shift_reg_reg[1]  ( .D(n68), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[1]) );
  DFFR_X1 \tx_shift_reg_reg[2]  ( .D(n67), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[2]) );
  DFFR_X1 \tx_shift_reg_reg[3]  ( .D(n66), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[3]) );
  DFFR_X1 \tx_shift_reg_reg[4]  ( .D(n65), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[4]) );
  DFFR_X1 \tx_shift_reg_reg[5]  ( .D(n64), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[5]) );
  DFFR_X1 \tx_shift_reg_reg[6]  ( .D(n63), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[6]) );
  DFFR_X1 \tx_shift_reg_reg[7]  ( .D(n62), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[7]) );
  DFFR_X1 \tx_shift_reg_reg[8]  ( .D(n61), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[8]) );
  DFFR_X1 \tx_shift_reg_reg[9]  ( .D(n60), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[9]) );
  DFFR_X1 \tx_shift_reg_reg[10]  ( .D(n59), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[10]) );
  DFFR_X1 \tx_shift_reg_reg[11]  ( .D(n58), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[11]) );
  DFFR_X1 \tx_shift_reg_reg[12]  ( .D(n57), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[12]) );
  DFFR_X1 \tx_shift_reg_reg[13]  ( .D(n56), .CK(clk), .RN(rst_n), .Q(
        tx_shift_reg[13]) );
  DFFR_X1 \tx_shift_reg_reg[14]  ( .D(n55), .CK(clk), .RN(rst_n), .QN(n126) );
  DFFR_X1 \bit_cnt_reg[0]  ( .D(n54), .CK(clk), .RN(rst_n), .Q(bit_cnt[0]), 
        .QN(n105) );
  DFFR_X1 \bit_cnt_reg[1]  ( .D(n53), .CK(clk), .RN(rst_n), .Q(bit_cnt[1]), 
        .QN(n110) );
  DFFR_X1 \bit_cnt_reg[2]  ( .D(n52), .CK(clk), .RN(rst_n), .QN(n120) );
  DFFR_X1 \bit_cnt_reg[3]  ( .D(n51), .CK(clk), .RN(rst_n), .Q(bit_cnt[3]), 
        .QN(n125) );
  DFFR_X1 \rx_data_reg[15]  ( .D(n50), .CK(clk), .RN(rst_n), .Q(rx_data[15])
         );
  DFFR_X1 \rx_data_reg[14]  ( .D(n49), .CK(clk), .RN(rst_n), .Q(rx_data[14]), 
        .QN(n124) );
  DFFR_X1 \rx_data_reg[13]  ( .D(n48), .CK(clk), .RN(rst_n), .Q(rx_data[13])
         );
  DFFR_X1 \rx_data_reg[12]  ( .D(n47), .CK(clk), .RN(rst_n), .Q(rx_data[12])
         );
  DFFR_X1 \rx_data_reg[11]  ( .D(n46), .CK(clk), .RN(rst_n), .Q(rx_data[11])
         );
  DFFR_X1 \rx_data_reg[10]  ( .D(n45), .CK(clk), .RN(rst_n), .Q(rx_data[10])
         );
  DFFR_X1 \rx_data_reg[9]  ( .D(n44), .CK(clk), .RN(rst_n), .Q(rx_data[9]) );
  DFFR_X1 \rx_data_reg[8]  ( .D(n43), .CK(clk), .RN(rst_n), .Q(rx_data[8]) );
  DFFR_X1 \rx_data_reg[7]  ( .D(n42), .CK(clk), .RN(rst_n), .Q(rx_data[7]) );
  DFFR_X1 \rx_data_reg[6]  ( .D(n41), .CK(clk), .RN(rst_n), .Q(rx_data[6]) );
  DFFR_X1 \rx_data_reg[5]  ( .D(n40), .CK(clk), .RN(rst_n), .Q(rx_data[5]) );
  DFFR_X1 \rx_data_reg[4]  ( .D(n39), .CK(clk), .RN(rst_n), .Q(rx_data[4]) );
  DFFR_X1 \rx_data_reg[3]  ( .D(n38), .CK(clk), .RN(rst_n), .Q(rx_data[3]) );
  DFFR_X1 \rx_data_reg[2]  ( .D(n37), .CK(clk), .RN(rst_n), .Q(rx_data[2]) );
  DFFR_X1 \rx_data_reg[1]  ( .D(n36), .CK(clk), .RN(rst_n), .Q(rx_data[1]) );
  DFFR_X1 \rx_data_reg[0]  ( .D(n35), .CK(clk), .RN(rst_n), .Q(rx_data[0]) );
  DFFR_X1 rx_valid_reg ( .D(N46), .CK(clk), .RN(rst_n), .Q(rx_valid) );
  DFFR_X1 miso_reg ( .D(n34), .CK(clk), .RN(rst_n), .Q(miso) );
  NOR2_X2 U3 ( .A1(n99), .A2(n97), .ZN(n98) );
  NOR2_X1 U4 ( .A1(cs_n_sync[2]), .A2(cs_n_sync[1]), .ZN(n92) );
  INV_X1 U5 ( .A(n102), .ZN(n103) );
  NAND2_X1 U6 ( .A1(cs_n_sync[2]), .A2(n118), .ZN(n1) );
  INV_X1 U7 ( .A(n1), .ZN(n99) );
  OAI21_X1 U8 ( .B1(sclk_sync[1]), .B2(n119), .A(n1), .ZN(n30) );
  NAND2_X1 U9 ( .A1(n118), .A2(n30), .ZN(n97) );
  AOI22_X1 U10 ( .A1(n99), .A2(tx_data[0]), .B1(tx_shift_reg[0]), .B2(n97), 
        .ZN(n2) );
  INV_X1 U11 ( .A(n2), .ZN(n69) );
  NAND3_X1 U12 ( .A1(n92), .A2(sclk_sync[1]), .A3(n119), .ZN(n102) );
  OAI22_X1 U13 ( .A1(n102), .A2(mosi_sync[1]), .B1(rx_shift_reg[0]), .B2(n103), 
        .ZN(n3) );
  INV_X1 U14 ( .A(n3), .ZN(n84) );
  AOI222_X1 U15 ( .A1(n97), .A2(tx_shift_reg[5]), .B1(tx_shift_reg[4]), .B2(
        n98), .C1(n99), .C2(tx_data[5]), .ZN(n4) );
  INV_X1 U16 ( .A(n4), .ZN(n64) );
  AOI222_X1 U17 ( .A1(n97), .A2(tx_shift_reg[6]), .B1(tx_shift_reg[5]), .B2(
        n98), .C1(n99), .C2(tx_data[6]), .ZN(n5) );
  INV_X1 U18 ( .A(n5), .ZN(n63) );
  AOI222_X1 U19 ( .A1(n97), .A2(tx_shift_reg[4]), .B1(tx_shift_reg[3]), .B2(
        n98), .C1(n99), .C2(tx_data[4]), .ZN(n6) );
  INV_X1 U20 ( .A(n6), .ZN(n65) );
  AOI222_X1 U21 ( .A1(n97), .A2(tx_shift_reg[8]), .B1(tx_shift_reg[7]), .B2(
        n98), .C1(n99), .C2(tx_data[8]), .ZN(n7) );
  INV_X1 U22 ( .A(n7), .ZN(n61) );
  AOI222_X1 U23 ( .A1(n97), .A2(tx_shift_reg[9]), .B1(tx_shift_reg[8]), .B2(
        n98), .C1(n99), .C2(tx_data[9]), .ZN(n8) );
  INV_X1 U24 ( .A(n8), .ZN(n60) );
  AOI222_X1 U25 ( .A1(n97), .A2(tx_shift_reg[7]), .B1(tx_shift_reg[6]), .B2(
        n98), .C1(n99), .C2(tx_data[7]), .ZN(n9) );
  INV_X1 U26 ( .A(n9), .ZN(n62) );
  AOI222_X1 U27 ( .A1(n97), .A2(tx_shift_reg[11]), .B1(tx_shift_reg[10]), .B2(
        n98), .C1(n99), .C2(tx_data[11]), .ZN(n10) );
  INV_X1 U28 ( .A(n10), .ZN(n58) );
  AOI222_X1 U29 ( .A1(n97), .A2(tx_shift_reg[12]), .B1(tx_shift_reg[11]), .B2(
        n98), .C1(n99), .C2(tx_data[12]), .ZN(n11) );
  INV_X1 U30 ( .A(n11), .ZN(n57) );
  AOI222_X1 U31 ( .A1(n97), .A2(tx_shift_reg[13]), .B1(tx_shift_reg[12]), .B2(
        n98), .C1(n99), .C2(tx_data[13]), .ZN(n12) );
  INV_X1 U32 ( .A(n12), .ZN(n56) );
  AOI222_X1 U33 ( .A1(n97), .A2(tx_shift_reg[3]), .B1(tx_shift_reg[2]), .B2(
        n98), .C1(n99), .C2(tx_data[3]), .ZN(n13) );
  INV_X1 U34 ( .A(n13), .ZN(n66) );
  AOI222_X1 U35 ( .A1(n97), .A2(tx_shift_reg[10]), .B1(tx_shift_reg[9]), .B2(
        n98), .C1(n99), .C2(tx_data[10]), .ZN(n14) );
  INV_X1 U36 ( .A(n14), .ZN(n59) );
  AOI222_X1 U37 ( .A1(n97), .A2(tx_shift_reg[1]), .B1(tx_shift_reg[0]), .B2(
        n98), .C1(n99), .C2(tx_data[1]), .ZN(n15) );
  INV_X1 U38 ( .A(n15), .ZN(n68) );
  AOI222_X1 U39 ( .A1(n97), .A2(tx_shift_reg[2]), .B1(tx_shift_reg[1]), .B2(
        n98), .C1(n99), .C2(tx_data[2]), .ZN(n16) );
  INV_X1 U40 ( .A(n16), .ZN(n67) );
  NOR3_X1 U41 ( .A1(n120), .A2(n105), .A3(n110), .ZN(n88) );
  NAND2_X1 U42 ( .A1(n88), .A2(bit_cnt[3]), .ZN(n87) );
  NOR2_X2 U43 ( .A1(n102), .A2(n87), .ZN(N46) );
  INV_X1 U44 ( .A(N46), .ZN(n86) );
  OAI22_X1 U45 ( .A1(n86), .A2(rx_shift_reg[11]), .B1(rx_data[12]), .B2(N46), 
        .ZN(n17) );
  INV_X1 U46 ( .A(n17), .ZN(n47) );
  OAI22_X1 U47 ( .A1(n86), .A2(rx_shift_reg[7]), .B1(rx_data[8]), .B2(N46), 
        .ZN(n18) );
  INV_X1 U48 ( .A(n18), .ZN(n43) );
  OAI22_X1 U49 ( .A1(n86), .A2(rx_shift_reg[6]), .B1(rx_data[7]), .B2(N46), 
        .ZN(n19) );
  INV_X1 U50 ( .A(n19), .ZN(n42) );
  OAI22_X1 U51 ( .A1(n86), .A2(rx_shift_reg[12]), .B1(rx_data[13]), .B2(N46), 
        .ZN(n20) );
  INV_X1 U52 ( .A(n20), .ZN(n48) );
  OAI22_X1 U53 ( .A1(n86), .A2(rx_shift_reg[4]), .B1(rx_data[5]), .B2(N46), 
        .ZN(n21) );
  INV_X1 U54 ( .A(n21), .ZN(n40) );
  OAI22_X1 U55 ( .A1(n86), .A2(rx_shift_reg[10]), .B1(rx_data[11]), .B2(N46), 
        .ZN(n22) );
  INV_X1 U56 ( .A(n22), .ZN(n46) );
  OAI22_X1 U57 ( .A1(n86), .A2(rx_shift_reg[9]), .B1(rx_data[10]), .B2(N46), 
        .ZN(n23) );
  INV_X1 U58 ( .A(n23), .ZN(n45) );
  OAI22_X1 U59 ( .A1(n86), .A2(rx_shift_reg[8]), .B1(rx_data[9]), .B2(N46), 
        .ZN(n24) );
  INV_X1 U60 ( .A(n24), .ZN(n44) );
  OAI22_X1 U61 ( .A1(n86), .A2(rx_shift_reg[0]), .B1(rx_data[1]), .B2(N46), 
        .ZN(n25) );
  INV_X1 U62 ( .A(n25), .ZN(n36) );
  OAI22_X1 U63 ( .A1(n86), .A2(rx_shift_reg[3]), .B1(rx_data[4]), .B2(N46), 
        .ZN(n26) );
  INV_X1 U64 ( .A(n26), .ZN(n39) );
  OAI22_X1 U65 ( .A1(n86), .A2(rx_shift_reg[5]), .B1(rx_data[6]), .B2(N46), 
        .ZN(n27) );
  INV_X1 U66 ( .A(n27), .ZN(n41) );
  OAI22_X1 U67 ( .A1(n86), .A2(rx_shift_reg[1]), .B1(rx_data[2]), .B2(N46), 
        .ZN(n28) );
  INV_X1 U68 ( .A(n28), .ZN(n37) );
  OAI22_X1 U69 ( .A1(n86), .A2(rx_shift_reg[2]), .B1(rx_data[3]), .B2(N46), 
        .ZN(n29) );
  INV_X1 U70 ( .A(n29), .ZN(n38) );
  INV_X1 U71 ( .A(n98), .ZN(n95) );
  NOR2_X1 U72 ( .A1(n105), .A2(n95), .ZN(n33) );
  NOR2_X1 U73 ( .A1(cs_n_sync[1]), .A2(n30), .ZN(n90) );
  AOI21_X1 U74 ( .B1(n92), .B2(n105), .A(n90), .ZN(n31) );
  INV_X1 U75 ( .A(n31), .ZN(n32) );
  MUX2_X1 U76 ( .A(n33), .B(n32), .S(bit_cnt[1]), .Z(n53) );
  AOI22_X1 U77 ( .A1(n99), .A2(tx_data[15]), .B1(n90), .B2(miso), .ZN(n85) );
  OAI21_X1 U78 ( .B1(n126), .B2(n95), .A(n85), .ZN(n34) );
  MUX2_X1 U79 ( .A(mosi_sync[1]), .B(rx_data[0]), .S(n86), .Z(n35) );
  AOI22_X1 U80 ( .A1(N46), .A2(n109), .B1(n124), .B2(n86), .ZN(n49) );
  MUX2_X1 U81 ( .A(rx_shift_reg[14]), .B(rx_data[15]), .S(n86), .Z(n50) );
  INV_X1 U82 ( .A(n90), .ZN(n96) );
  OAI21_X1 U83 ( .B1(n88), .B2(bit_cnt[3]), .A(n87), .ZN(n89) );
  OAI22_X1 U84 ( .A1(n96), .A2(n125), .B1(n95), .B2(n89), .ZN(n51) );
  NAND2_X1 U85 ( .A1(bit_cnt[0]), .A2(bit_cnt[1]), .ZN(n91) );
  AOI21_X1 U86 ( .B1(n92), .B2(n91), .A(n90), .ZN(n94) );
  NAND3_X1 U87 ( .A1(n120), .A2(n92), .A3(n94), .ZN(n93) );
  OAI21_X1 U88 ( .B1(n120), .B2(n94), .A(n93), .ZN(n52) );
  AOI22_X1 U89 ( .A1(bit_cnt[0]), .A2(n96), .B1(n95), .B2(n105), .ZN(n54) );
  INV_X1 U90 ( .A(n97), .ZN(n101) );
  AOI22_X1 U91 ( .A1(n99), .A2(tx_data[14]), .B1(n98), .B2(tx_shift_reg[13]), 
        .ZN(n100) );
  OAI21_X1 U92 ( .B1(n101), .B2(n126), .A(n100), .ZN(n55) );
  AOI22_X1 U93 ( .A1(n103), .A2(n109), .B1(n117), .B2(n102), .ZN(n70) );
  AOI22_X1 U94 ( .A1(n103), .A2(n104), .B1(n109), .B2(n102), .ZN(n71) );
  AOI22_X1 U95 ( .A1(n103), .A2(n111), .B1(n104), .B2(n102), .ZN(n72) );
  AOI22_X1 U96 ( .A1(n103), .A2(n106), .B1(n111), .B2(n102), .ZN(n73) );
  AOI22_X1 U97 ( .A1(n103), .A2(n112), .B1(n106), .B2(n102), .ZN(n74) );
  AOI22_X1 U98 ( .A1(n103), .A2(n107), .B1(n112), .B2(n102), .ZN(n75) );
  AOI22_X1 U99 ( .A1(n103), .A2(n113), .B1(n107), .B2(n102), .ZN(n76) );
  AOI22_X1 U100 ( .A1(n103), .A2(n108), .B1(n113), .B2(n102), .ZN(n77) );
  AOI22_X1 U101 ( .A1(n103), .A2(n114), .B1(n108), .B2(n102), .ZN(n78) );
  AOI22_X1 U102 ( .A1(n103), .A2(n121), .B1(n114), .B2(n102), .ZN(n79) );
  AOI22_X1 U103 ( .A1(n103), .A2(n115), .B1(n121), .B2(n102), .ZN(n80) );
  AOI22_X1 U104 ( .A1(n103), .A2(n122), .B1(n115), .B2(n102), .ZN(n81) );
  AOI22_X1 U105 ( .A1(n103), .A2(n116), .B1(n122), .B2(n102), .ZN(n82) );
  AOI22_X1 U106 ( .A1(n103), .A2(n123), .B1(n116), .B2(n102), .ZN(n83) );
endmodule


module spi_controller_core ( pclk, presetn, psel, penable, pwrite, paddr, 
        pwdata, prdata, pready, pslverr, spi_sclk_i, spi_cs_n_i, spi_mosi_i, 
        spi_miso_i, spi_sclk_o, spi_cs_n_o, spi_mosi_o, spi_miso_o, 
        spi_master_oe, spi_miso_oe );
  input [31:0] paddr;
  input [31:0] pwdata;
  output [31:0] prdata;
  input pclk, presetn, psel, penable, pwrite, spi_sclk_i, spi_cs_n_i,
         spi_mosi_i, spi_miso_i;
  output pready, pslverr, spi_sclk_o, spi_cs_n_o, spi_mosi_o, spi_miso_o,
         spi_master_oe, spi_miso_oe;
  wire   slave_miso_oe, reg_start, core_busy, master_done, slave_rx_valid,
         _0_net_, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;
  wire   [7:0] reg_clk_div;
  wire   [15:0] reg_tx_data;
  wire   [15:0] master_rx_data;
  wire   [15:0] slave_rx_data;
  assign pready = 1'b1;
  assign pslverr = 1'b0;

  spi_regs u_spi_regs ( .pclk(pclk), .presetn(presetn), .psel(n33), .penable(
        penable), .pwrite(n31), .paddr({paddr[31:4], n39, n37, paddr[1:0]}), 
        .pwdata({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, n29, n27, n25, n23, n21, n35, 
        pwdata[9:2], n19, pwdata[0]}), .prdata(prdata), .reg_start(reg_start), 
        .reg_master_en(spi_master_oe), .reg_clk_div(reg_clk_div), 
        .reg_tx_data(reg_tx_data), .core_busy(core_busy), .master_done(
        master_done), .master_rx_data(master_rx_data), .slave_rx_valid(
        slave_rx_valid), .slave_rx_data(slave_rx_data) );
  spi_master_DIV_WIDTH8 u_spi_master ( .clk(pclk), .rst_n(presetn), .start(
        _0_net_), .tx_data(reg_tx_data), .clk_div(reg_clk_div), .miso(
        spi_miso_i), .mosi(spi_mosi_o), .sclk(spi_sclk_o), .cs_n(spi_cs_n_o), 
        .rx_data(master_rx_data), .busy(core_busy), .done(master_done) );
  spi_slave u_spi_slave ( .clk(pclk), .rst_n(presetn), .sclk(spi_sclk_i), 
        .cs_n(spi_cs_n_i), .mosi(spi_mosi_i), .miso(spi_miso_o), .tx_data(
        reg_tx_data), .rx_data(slave_rx_data), .rx_valid(slave_rx_valid), 
        .miso_oe_BAR(slave_miso_oe) );
  INV_X1 U6 ( .A(pwdata[1]), .ZN(n18) );
  INV_X1 U7 ( .A(n18), .ZN(n19) );
  INV_X1 U8 ( .A(pwdata[11]), .ZN(n20) );
  INV_X1 U9 ( .A(n20), .ZN(n21) );
  INV_X1 U10 ( .A(pwdata[12]), .ZN(n22) );
  INV_X1 U11 ( .A(n22), .ZN(n23) );
  INV_X1 U12 ( .A(pwdata[13]), .ZN(n24) );
  INV_X1 U13 ( .A(n24), .ZN(n25) );
  INV_X1 U14 ( .A(pwdata[14]), .ZN(n26) );
  INV_X1 U15 ( .A(n26), .ZN(n27) );
  INV_X1 U16 ( .A(pwdata[15]), .ZN(n28) );
  INV_X1 U17 ( .A(n28), .ZN(n29) );
  INV_X1 U18 ( .A(pwrite), .ZN(n30) );
  INV_X1 U19 ( .A(n30), .ZN(n31) );
  INV_X1 U20 ( .A(psel), .ZN(n32) );
  INV_X1 U21 ( .A(n32), .ZN(n33) );
  INV_X1 U22 ( .A(pwdata[10]), .ZN(n34) );
  INV_X1 U23 ( .A(n34), .ZN(n35) );
  INV_X1 U24 ( .A(paddr[2]), .ZN(n36) );
  INV_X1 U25 ( .A(n36), .ZN(n37) );
  INV_X1 U26 ( .A(paddr[3]), .ZN(n38) );
  INV_X1 U27 ( .A(n38), .ZN(n39) );
  AND2_X1 U28 ( .A1(spi_master_oe), .A2(reg_start), .ZN(_0_net_) );
  NOR2_X1 U29 ( .A1(spi_master_oe), .A2(slave_miso_oe), .ZN(spi_miso_oe) );
endmodule

