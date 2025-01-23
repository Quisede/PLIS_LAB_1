`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2024 15:37:29
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main(
    input x, y, z, k, l,
    output lut_output, simple_output
    );
    
    wire lut_o1, lut_o2, lut_o3, lut_o4, lut_o5, lut_o6;
    
    parameter I0 = 16'haaaa;
    parameter I1 = 16'hcccc;
    
    assign simple_output = !x || !y || (z && (!(!k && l)));
    
    //лут НЕ k
    LUT1 #(
      .INIT(2'b01)  // Specify LUT Contents
   ) lut_notK (
      .O(lut_o1),   // LUT general output
      .I0(k)  // LUT input
   );
   
   //лут НЕ k и l
   LUT2 #(
      .INIT(4'b1000)  // Specify LUT Contents
   ) lut_notKandL (
      .O(lut_o2),   // LUT general output
      .I0(lut_o1), // LUT input
      .I1(l)  // LUT input
   );
   
   //лут НЕ НЕ k и l = one
   LUT1 #(
      .INIT(2'b01)  // Specify LUT Contents
   ) lut_One (
      .O(lut_o3),   // LUT general output
      .I0(lut_o2)  // LUT input
   );
   /*
   //лут Z и One
   LUT2 #(
      .INIT(4'b1000)  // Specify LUT Contents
   ) lut_ZandOne (
      .O(lut_o4),   // LUT general output
      .I0(z), // LUT input
      .I1(lut_o3)  // LUT input
   );
   
   
   //лут НЕ y ИЛИ ZandOne = Two
   LUT2 #(
      .INIT(4'b1110)  // Specify LUT Contents
   ) lut_Two (
      .O(lut_o6),   // LUT general output
      .I0(lut_o5), // LUT input
      .I1(lut_o4)  // LUT input
   );
  
   
   //лут НЕ X ИЛИ Two
   LUT2 #(
      .INIT(4'b1110)  // Specify LUT Contents
   ) lut_notXorTwo (
      .O(lut_o8),   // LUT general output
      .I0(lut_o7), // LUT input
      .I1(lut_o6)  // LUT input
   );
   */
   
   //лут НЕ y
   LUT1 #(
      .INIT(2'b01)  // Specify LUT Contents
   ) lut_notY (
      .O(lut_o4),   // LUT general output
      .I0(y)  // LUT input
   );
   
   //лут НЕ x
   LUT1 #(
      .INIT(2'b01)  // Specify LUT Contents
   ) lut_notX (
      .O(lut_o5),   // LUT general output
      .I0(x)  // LUT input
   );
   
   //лут на 4 входа
   LUT4 #(
      .INIT(16'hFFF8)  // Specify LUT Contents
   ) LUT4_final (
      .O(lut_o6),   // LUT general output
      .I0(lut_o3), // LUT input
      .I1(z), // LUT input
      .I2(lut_o4), // LUT input
      .I3(lut_o5)  // LUT input
   );
   
   assign lut_output = lut_o6;
endmodule
