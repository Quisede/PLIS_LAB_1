`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2024 17:40:55
// Design Name: 
// Module Name: TB_main
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


module TB_main();

    reg [4:0]q = 0;
    wire lut_o, simple_o;
    
    always
    #5 q <= q + 5'h1;
    
    main utt(
    .x(q[0]),
    .y(q[1]),
    .z(q[2]),
    .k(q[3]),
    .l(q[4]),
    .lut_output(lut_o),
    .simple_output(simple_o)
    );
endmodule
