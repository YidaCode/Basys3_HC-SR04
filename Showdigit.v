module Showdigit(in,LED_activating_counter,out1,out2);
input [19:0] in;
input [1:0] LED_activating_counter;
output reg [6:0] out1;
output reg [3:0] out2;

reg [3:0] outnumber;

always @(*)
begin
    case(LED_activating_counter)
    2'b00: 
    begin
        out2 = 4'b0111; 
        outnumber = in/10000;//百位
    end
    2'b01: 
    begin
        out2 = 4'b1011; 
        outnumber = (in / 1000)%100;//十位   
    end
    2'b10: 
    begin
        out2 = 4'b1101; 
        outnumber = ((in / 100)%10);//个位
    end
    2'b11: 
    begin
        out2 = 4'b1110; 
        outnumber = ((in / 10)%10);//0.1
    end
    default: out2 = 4'b1111; // "0"
    endcase
end

always@(*)
begin
    case(outnumber)
    4'b0000: out1 = 7'b0000001; // "0"     
    4'b0001: out1 = 7'b1001111; // "1" 
    4'b0010: out1 = 7'b0010010; // "2" 
    4'b0011: out1 = 7'b0000110; // "3" 
    4'b0100: out1 = 7'b1001100; // "4" 
    4'b0101: out1 = 7'b0100100; // "5" 
    4'b0110: out1 = 7'b0100000; // "6" 
    4'b0111: out1 = 7'b0001111; // "7" 
    4'b1000: out1 = 7'b0000000; // "8"     
    4'b1001: out1 = 7'b0000100; // "9" 
    default: out1 = 7'b0000001; // "E"
    endcase
end
endmodule // showdigit