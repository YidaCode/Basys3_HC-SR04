module counter_1000(clkin,clkout,statechange);
input clkin;
output clkout,statechange;
reg clkout;
reg [9:0] flag1=0;
reg [1:0] statechange = 0;
always @(posedge clkin) 
begin   
	if(flag1<500) 
		begin
			flag1<=flag1+1;
			clkout<=1'b1;
		end 
	else if(flag1<1000)
		begin
			flag1<=flag1+1;
			clkout<=1'b0;
        end
    else if(flag1==1000)
        begin
            flag1<=0;
            clkout<=1'b1;
		end
end

always @(posedge clkout)
begin 
    if(statechange<3)
        statechange <= statechange + 1;
    else
        statechange <= 0;
end
endmodule