`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2021 06:56:26 PM
// Design Name: 
// Module Name: clk_anim
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


module clk_anim(
    input clk,
    output clk_d
    );
    
  parameter div_value = 12;
  reg clk_d;
  reg count;
  initial begin
    clk_d = 0;
    count = 0;
  end 
  always @(posedge clk)
    begin
      if(count == div_value)
        count <= 0;
      else
        count <= count + 1;
    end
  
  always @(posedge clk)
    begin
      if(count == div_value)
        clk_d <= ~clk_d;
    end
endmodule
