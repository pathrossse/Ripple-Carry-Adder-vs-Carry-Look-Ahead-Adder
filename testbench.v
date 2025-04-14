module testbench();
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum_RCA, Sum_CLA;
    wire Cout_RCA, Cout_CLA;

    // Instantiate the RCA
    ripple_carry_adder_4bit RCA (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum_RCA),
        .Cout(Cout_RCA)
    );

    // Instantiate the CLA
    carry_lookahead_adder_4bit CLA (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum_CLA),
        .Cout(Cout_CLA)
    );

    initial begin
        // Test Case 1
        A = 4'b0000; B = 4'b0000; Cin = 0;
        #10;
        // Test Case 2
        A = 4'b0011; B = 4'b0001; Cin = 0;
        #10;
        // Test Case 3
        A = 4'b0110; B = 4'b0101; Cin = 1;
        #10;
        // Test Case 4
        A = 4'b1111; B = 4'b1111; Cin = 1;
        #10;
        // End simulation
        $finish;
    end

    initial begin
        // Monitor outputs
        $monitor("A=%b B=%b Cin=%b | RCA Sum=%b Cout=%b | CLA Sum=%b Cout=%b",
                 A, B, Cin, Sum_RCA, Cout_RCA, Sum_CLA, Cout_CLA);
    end
endmodule
