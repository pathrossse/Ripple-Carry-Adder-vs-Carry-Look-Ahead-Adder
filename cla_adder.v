module full_adder (
    input A, B, Cin,
    output Sum, Cout
);

    assign Sum = A ^ B ^ Cin;        // Sum = A XOR B XOR Cin
    assign Cout = (A & B) | (Cin & (A ^ B));  // Cout = AB + Cin(A XOR B)

endmodule

module carry_lookahead_adder_4bit (
    input [3:0] A, B,
    input Cin,    output [3:0] Sum,
    output Cout
);

    wire [3:0] G, P;  // Generate and Propagate signals
    wire C1, C2, C3;  // Internal carry signals

    // Generate and Propagate Logic
    assign G = A & B;            // Generate: Gi = Ai & Bi
    assign P = A | B;            // Propagate: Pi = Ai | Bi

    // Carry Look-Ahead Logic
    assign C1 = G[0] | (P[0] & Cin);               // C1 = G0 + P0 * Cin
    assign C2 = G[1] | (P[1] & C1);                // C2 = G1 + P1 * C1
    assign C3 = G[2] | (P[2] & C2);                // C3 = G2 + P2 * C2
    assign Cout = G[3] | (P[3] & C3);              // Cout = G3 + P3 * C3

    // Sum Calculation
    assign Sum[0] = A[0] ^ B[0] ^ Cin;             // Sum0 = A0 XOR B0 XOR Cin
    assign Sum[1] = A[1] ^ B[1] ^ C1;              // Sum1 = A1 XOR B1 XOR C1
    assign Sum[2] = A[2] ^ B[2] ^ C2;              // Sum2 = A2 XOR B2 XOR C2
    assign Sum[3] = A[3] ^ B[3] ^ C3;              // Sum3 = A3 XOR B3 XOR C3

endmodule


