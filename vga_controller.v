`include "v_counter.v"
`include "h_counter.v"
`include "clk_div.v"
`include "vga_sync.v"
`include "pixel_gen.v"

module vga_controller(clk, clk_d, h_sync, v_sync, red, green, blue);
  input clk;
  output clk_d;
  output h_sync;
  output v_sync;
  output [3:0] red;
  output [3:0] green;
  output [3:0] blue; 
  
  wire clk_d;
  wire [9:0] h_count;
  wire trig_v;
  wire [9:0] v_count;
  wire h_sync, v_sync, video_on;
  wire [9:0] x_loc;
  wire [9:0] y_loc;
  
  clk_div c1(clk, clk_d);
  h_counter h1(clk_d, h_count, trig_v);
  v_counter v1(clk_d, v_count, trig_v);
  vga_sync vg1(h_count, v_count, h_sync, v_sync, video_on, x_loc, y_loc);
  pixel_gen pg(clk_d, x_loc, y_loc, video_on, red, green, blue);
endmodule