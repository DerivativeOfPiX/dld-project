module v_counter(clk, count,enable_v);

    input clk;
    output [9:0] count;
    reg [9:0] count;
    input enable_v;

    always @ (posedge clk)
        begin 
            if (count < 524)
                if(enable_v == 1'b1)
                    begin
                        count <= count + 1;
                    end
                else
                    count <= count;
            else
                begin
                    count <= 0;
                end
        end
    endmodule