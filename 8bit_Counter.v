module counter (clk_in, nrst_in, en_ctrl_in, set_ctrl_in, up_ctrl_in, counter_in, counter_out, ovf_out);

input wire clk_in,nrst_in,en_ctrl_in,set_ctrl_in,up_ctrl_in;
input wire [7:0] counter_in;
output reg [7:0] counter_out;
output reg ovf_out;

always @(negedge nrst_in) begin
counter_out <= 8'b0;
end

always @(posedge clk_in)begin

if(en_ctrl_in && set_ctrl_in) counter_out<=counter_in;
else if (en_ctrl_in && up_ctrl_in) counter_out<=counter_out+1;
else if (en_ctrl_in && !up_ctrl_in) counter_out<=counter_out-1;
else counter_out<=counter_out;

if(counter_out == 8'hff) ovf_out <= 1;
else ovf_out <=0;
end


endmodule