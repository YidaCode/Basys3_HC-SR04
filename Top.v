module Top(clk_100m,Trig, Echo, distance,sel);
input clk_100m,Echo;
output Trig;
output [6:0] distance;
output [3:0] sel;

wire clk_1m;
wire [19:0] dis;
wire [1:0] state;
wire clk_1k;

Clk1m u0(.clkout(clk_1m), .clkin(clk_100m)); // 100分频
counter_1000 u3(.clkout(clk_1k), .clkin(clk_1m),.statechange(state));
TrigSignal u1(.clk_1m(clk_1m),.trig(Trig));
PosCounter u2(.clk_1m(clk_1m),.echo(Echo),.dis_count(dis));
Showdigit u4(.in(dis),.LED_activating_counter(state),.out1(distance[6:0]),.out2(sel[3:0]));


endmodule // Top