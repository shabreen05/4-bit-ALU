// Code your design here
module ALU_4bit (
    input [3:0] A,          // 4-bit input A
    input [3:0] B,          // 4-bit input B
    input [2:0] ALU_Sel,    // 3-bit ALU operation selector
    output reg [3:0] ALU_Out, // 4-bit ALU output
    output reg Carry_Out,   // Carry-out flag
    output Zero             // Zero flag
);

    assign Zero = (ALU_Out == 4'b0000); // Zero flag is set when ALU_Out is 0

    always @(*) begin
        Carry_Out = 1'b0; // Default value for carry-out
        case (ALU_Sel)
            3'b000: {Carry_Out, ALU_Out} = A + B;  // Addition
            3'b001: {Carry_Out, ALU_Out} = A - B;  // Subtraction
            3'b010: ALU_Out = A & B;               // AND
            3'b011: ALU_Out = A | B;               // OR
            3'b100: ALU_Out = A ^ B;               // XOR
            3'b101: ALU_Out = ~A;                  // NOT 
            default: ALU_Out = 4'b0000;            // Default case
        endcase
    end
endmodule
