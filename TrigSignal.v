module TrigSignal(clk_1m,trig);
input clk_1m;
output trig;

reg trig;
reg [16:0]flag1=0;

always @(posedge clk_1m) 
begin   
	if(flag1<15) 
		begin
			flag1<=flag1+1;
			trig<=1'b1;
		end 
	else if(flag1<100000)
		begin
			flag1<=flag1+1;
			trig<=1'b0;
        end
    else if(flag1==100000)
        begin
            flag1<=0;
            trig<=1'b0;
		end
end
endmodule 