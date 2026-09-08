
module alu_8bit_tb;
reg [7:0]A; reg [7:0]B; reg [2:0]op; 
wire zero, carry; wire [7:0]result;
alu_8bit uut (.A(A),.B(B),.op(op),.zero(zero),.carry(carry),.result(result));
initial 
begin 
$monitor($time,"A=%b, B=%b, op=%b, zero=%b, carry=%b, result=%b,temp=%b",
            A,B,op,zero,carry,result,uut.temp);

// Addition 
#5  A = 10; B = 5; op = 3'b000;  
#10 A = 255; B = 1;  
#10 A = 0; B = 0;
#10 A = 255; B = 255;

// Subtraction  
#10 A = 10; B = 5; op = 3'b001;  
#10 A = 5; B = 5; 
#10 A = 5; B = 10; 
#10 A = 0; B = 1; 

// AND  
#10 A = 8'b11001100; B = 8'b10101010; op = 3'b010; 

// OR
#10 A = 8'b11001100; B = 8'b10101010; op = 3'b011; 

// XOR
#10 A = 8'b11001100; B = 8'b10101010; op = 3'b100;

// NOT 
#10 A = 8'b11001100; op = 3'b101; 
#10 A = 8'b00000000;  

// Left Shift
#10 A = 8'b00001101; op = 3'b110; 
#10 A = 8'b10000001;

// Right Shift
#10 A = 8'b00001101; op = 3'b111;  
#10 A = 8'b10000001;

#10 $finish;
end
endmodule
