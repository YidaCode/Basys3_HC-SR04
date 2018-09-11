module PosCounter(clk_1m,echo,dis_count);
input clk_1m,echo;
output dis_count;

reg [19:0] dis_count;
reg [19:0] count;
reg [19:0] countfinal;

always@(posedge clk_1m)
begin 
    if(echo == 1'b1)
    begin
        count <= count+1;
        countfinal <= count;
    end
    else 
    begin
        dis_count <= countfinal *120 >> 6;
        count <= 0;
    end
end 



endmodule // PosCounter