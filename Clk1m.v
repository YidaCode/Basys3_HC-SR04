module Clk1m(clkin,clkout);
input clkin;
output clkout;
reg clkout;
reg [6:0]flag1=0;

always @(posedge clkin) 
begin   
	if(flag1<50) 
		begin
			flag1<=flag1+1;
			clkout<=1'b1;
		end 
	else if(flag1<100)
		begin
			flag1<=flag1+1;
			clkout<=1'b0;
        end
    else if(flag1==100)
        begin
            flag1<=0;
            clkout<=1'b1;
		end
end
endmodule