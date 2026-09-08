
module alu_8bit(
       input [7:0] A,
       input [7:0] B,
       input [2:0] op,
       output reg zero, carry,
       output reg [7:0] result
    );
reg [8:0] temp;

always@ (*)
begin 
 result = 8'b0;
 temp = 9'b0;
 carry = 1'b0;
 zero = 1'b0;
 case(op)
   3'b000: 
       begin 
         temp = A+B;
         result = temp[7:0];
         carry = temp[8];
       end
    3'b001: 
        begin 
          result = A- B;
          carry = 1'b0;
        end
     3'b010: 
           result = A & B;
         
      3'b011:
           result = A|B; 
      
      3'b100:
           result = A^B;
          
      3'b101:
            result = ~A;
            
      3'b110:
            result = A<<1; // Left Shift 
          
       3'b111:
            result = A>>1; // Right Shift
       endcase
   if(result == 8'b0)
      zero = 1;
   else 
      zero = 0;           
end

endmodule
