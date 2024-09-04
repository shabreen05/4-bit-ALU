# Arithmetic Logic Unit (ALU) 
An Arithmetic Logic Unit (ALU) is a fundamental building block in digital systems, particularly within the central processing unit (CPU) of a computer. It performs arithmetic and logic operations, which are the core functions necessary for most computational tasks. The ALU is crucial in executing instructions, manipulating data, and performing calculations, making it a key component in both simple microcontrollers and complex processors.

## Functions of an ALU:

1. Arithmetic Operations:

* Addition: The ALU can add binary numbers, often producing a sum and a carry-out if the result exceeds the word size.
* Subtraction: The ALU can subtract one binary number from another, typically producing a difference and a borrow-out if needed.
* Multiplication/Division: Some ALUs are designed to perform multiplication and division, though these are often implemented as separate units in more advanced processors.
  
2. Logic Operations:
   
* AND: The ALU can perform a bitwise AND operation, where each bit of the output is true if both corresponding bits of the inputs are true.
* OR: A bitwise OR operation outputs true if at least one of the corresponding input bits is true.
* XOR (Exclusive OR): Outputs true if the corresponding bits of the inputs are different.
* NOT: The ALU can invert each bit of the input, producing a bitwise complement.

3.Shift Operations:

* Logical Shift: The ALU can shift the bits of a binary number left or right, filling the vacated positions with zeros.
* Arithmetic Shift: Similar to a logical shift but preserves the sign of a binary number (important for signed numbers).
* Rotate: The bits are rotated around the end, where the bit shifted out on one end is moved to the other.

## 4-Bit-ALU

A 4-bit ALU (Arithmetic Logic Unit) is a simplified version of an ALU that operates on 4-bit binary numbers. It can perform various arithmetic and logic operations such as addition, subtraction, AND, OR, XOR, and NOT on 4-bit inputs.

### Design Code

```

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


```

### testbench code 

```
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


```
Screenshot 

![imag](img/ss_1)

![imag](img/ss_2)

![imag](img/ss_3)


#### I use EDA Playground for designing and simulating digital circuits with the following configuration:

###  Language: SystemVerilog/Verilog

   * SystemVerilog: An extension of Verilog that incorporates additional features for advanced design and verification tasks.
   * Verilog: A hardware description language used for modeling electronic systems.
     
### EDA Tool: Cadence Xcelium 23.09

   * Cadence Xcelium: A high-performance simulator for verifying digital designs, supporting various simulation and verification methodologies.
     
### Compile Options:

-timescale 1ns/1ns: Specifies that the time unit and precision for simulation are in nanoseconds.
-sysv: Indicates that SystemVerilog features should be used during compilation

