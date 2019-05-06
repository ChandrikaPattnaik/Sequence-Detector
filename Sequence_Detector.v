module Sequence_Detector (x,clk,reset,z);
input x,clk,reset;
output z;
reg [0:2] ps,ns;
reg z;
always@(posedge clk or posedge reset)
begin
if(reset) ps <= 3'b0;
else ps <= ns;
end
always@(ps or x)
case(ps)
3'b0:begin z = x?0:0; ns = x?3'b0:3'b1; end
3'b1:begin z = x?0:0; ns = x?3'b10:3'b1; end
3'b10:begin z = x?0:0; ns = x?3'b11:3'b1; end
3'b11:begin z = x?0:0; ns = x?3'b0:3'b100; end
3'b100:begin z = x?1:0; ns = x?3'b10:3'b1; end
endcase
endmodule