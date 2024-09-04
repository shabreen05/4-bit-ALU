// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module ALU_4bit_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] ALU_Sel;

    // Outputs
    wire [3:0] ALU_Out;
    wire Carry_Out;
    wire Zero;

    // Instantiate the Unit Under Test (UUT)
    ALU_4bit uut (
        .A(A), 
        .B(B), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .Carry_Out(Carry_Out), 
        .Zero(Zero)
    );

    initial begin
        // VCD dump setup
        $dumpfile("dump.vcd");        // Name of the VCD file
        $dumpvars(0, ALU_4bit_tb);    // Dump all variables in the testbench

        // Monitor the values of inputs and outputs
        $monitor("Time = %0t : A = %b, B = %b, ALU_Sel = %b | ALU_Out = %b, Carry_Out = %b, Zero = %b", 
                 $time, A, B, ALU_Sel, ALU_Out, Carry_Out, Zero);

        // Test Cases

        // Test Addition: 3 + 2 = 5
        A = 4'b0011; B = 4'b0010; ALU_Sel = 3'b000; #10;

        // Test Subtraction: 5 - 3 = 2
        A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b001; #10;

        // Test AND: 5 & 3 = 1
        A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b010; #10;

        // Test OR: 5 | 3 = 7
        A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b011; #10;

        // Test XOR: 5 ^ 3 = 6
        A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b100; #10;

        // Test NOT: ~5 = 10
        A = 4'b0101; ALU_Sel = 3'b101; #10;

        // Test Zero flag: 4 - 4 = 0
        A = 4'b0100; B = 4'b0100; ALU_Sel = 3'b001; #10;

        // End the simulation
        $finish;
    end

endmodule
