module h_counter(clk,count, trig_v);

    input clk;
    output [9:0] count;
    reg [9:0] count;
    output trig_v;
    reg trig_v;

    initial count = 0; 
    initial trig_v = 0;
    always @ (posedge clk)
        begin 
            if (count < 799)
                begin
                    count <= count + 1;
                    trig_v <= 0;
                end
            else
                begin
                    count <= 0;
                    trig_v <= 1;
                end
        end
    endmodule  