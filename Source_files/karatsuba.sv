module karatsuba_recurse #(
    parameter WIDTH=233,
    parameter THRESHOLD=29
) (
    // Inputs A, B
    input  logic [WIDTH-1:0] A,
    input  logic [WIDTH-1:0] B,

    // Output M = A*B 
    output logic [2*WIDTH-2:0] M
);

    generate
        if (WIDTH < THRESHOLD) begin : WleT1
            // Perform school-book multiplication when Width <= Threshold
            karatsuba_schoolbook #(.WIDTH(WIDTH)) booth_multiplier(
                .A(A),
                .B(B),
                .M(M)
            );
        end else begin : WgT1

            if (WIDTH[0] == 1'b1) begin
                // If Width is odd

                logic [WIDTH-1:0] M2;   // M2 = Al*Bl
                logic [WIDTH-3:0] M1;   // M1 = Ah*Bh
                logic [WIDTH-1:0] M3;   // M3 = (Ah+Al)*(Bh+Bl)

                logic [WIDTH/2:0]   Al; // Lower split
                logic [WIDTH/2:0]   Bl;
                logic [WIDTH/2-1:0] Ah; // Higher split
                logic [WIDTH/2-1:0] Bh;
                logic [WIDTH/2:0]   S1;     // Ah+Al
                logic [WIDTH/2:0]   S2;     // Bh+Bl

                assign Al = A[WIDTH/2:0];
                assign Bl = B[WIDTH/2:0];

                assign Ah = A[WIDTH-1:WIDTH/2+1];
                assign Bh = B[WIDTH-1:WIDTH/2+1];

                assign S1 = Al ^ Ah;
                assign S2 = Bl ^ Bh;

                karatsuba_recurse #(.WIDTH(WIDTH/2), .THRESHOLD(THRESHOLD)) u_karatsuba_Ah_Bh (
                    .A(Ah),
                    .B(Bh),
                    .M(M1)
                ); // Ah*Bh

                karatsuba_recurse #(.WIDTH(WIDTH/2+1), .THRESHOLD(THRESHOLD)) u_karatsuba_Al_Bl (
                    .A(Al),
                    .B(Bl),
                    .M(M2)
                ); // Al*Bl

                karatsuba_recurse #(.WIDTH(WIDTH/2+1), .THRESHOLD(THRESHOLD)) u_karatsuba_S1_S2 (
                    .A(S1),
                    .B(S2),
                    .M(M3)
                );  // (Ah+Al)*(Bh+Bl)

                // Comments written for GF(2^233)

                assign M[WIDTH/2:0] /*116:0*/ = M2[WIDTH/2:0];     // 116:0

                assign M[WIDTH:WIDTH/2+1] /*233:117*/ = M2[WIDTH-1:WIDTH/2+1] /*232:117*/ ^ M2[WIDTH/2:0] /*116:0*/ ^ M1[WIDTH/2:0] /*116:0*/ ^ M3[WIDTH/2:0] /*116:0*/;

                assign M[2*WIDTH-2:WIDTH+1] /*464:234*/ = M2[WIDTH-1:WIDTH/2+1] /*232:117*/ ^ M1[WIDTH-3:WIDTH/2+1] /*230:117*/ ^ M3[WIDTH-1:WIDTH/2+1] /*232:117*/ ^ M1[WIDTH-3:0] /*230:0*/;

            end else begin

                // If Width is even

                logic [WIDTH-2:0] M2;   // M2 = Al*Bl
                logic [WIDTH-2:0] M1;   // M1 = Ah*Bh
                logic [WIDTH-2:0] M3;   // M3 = (Ah+Al)*(Bh+Bl)

                logic [WIDTH/2-1:0]   Al;
                logic [WIDTH/2-1:0]   Bl;
                logic [WIDTH/2-1:0]   Ah;
                logic [WIDTH/2-1:0]   Bh;
                logic [WIDTH/2-1:0]   S1;     // Ah+Al
                logic [WIDTH/2-1:0]   S2;     // Bh+Bl

                assign Al = A[WIDTH/2-1:0];
                assign Bl = B[WIDTH/2-1:0];

                assign Ah = A[WIDTH-1:WIDTH/2];
                assign Bh = B[WIDTH-1:WIDTH/2];

                assign S1 = Al ^ Ah;
                assign S2 = Bl ^ Bh;

                karatsuba_recurse #(.WIDTH(WIDTH/2), .THRESHOLD(THRESHOLD)) u_karatsuba_Ah_Bh (
                    .A(Ah),
                    .B(Bh),
                    .M(M1)
                ); // Ah*Bh

                karatsuba_recurse #(.WIDTH(WIDTH/2), .THRESHOLD(THRESHOLD)) u_karatsuba_Al_Bl (
                    .A(Al),
                    .B(Bl),
                    .M(M2)
                ); // Al*Bl

                karatsuba_recurse #(.WIDTH(WIDTH/2), .THRESHOLD(THRESHOLD)) u_karatsuba_S1_S2 (
                    .A(S1),
                    .B(S2),
                    .M(M3)
                ); // (Ah+Bh)*(Al+Bl)

                // Comments written for GF(2^116)

                assign M[WIDTH/2-1:0] /*57:0*/ = M2[WIDTH/2-1:0];     // 57:0

                assign M[WIDTH-1:WIDTH/2] /*115:58*/ = M2[WIDTH-2:WIDTH/2] /*114:58*/ ^ M2[WIDTH/2-1:0] /*57:0*/ ^ M1[WIDTH/2-1:0] /*57:0*/ ^ M3[WIDTH/2-1:0] /*57:0*/;

                assign M[2*WIDTH-2:WIDTH] /*230:116*/ = M2[WIDTH-2:WIDTH/2] /*114:58*/ ^ M1[WIDTH-2:WIDTH/2] /*114:58*/ ^ M3[WIDTH-2:WIDTH/2] /*114:58*/ ^ M1[WIDTH-2:0] /*114:0*/;


            end

        end

    endgenerate

endmodule

module karatsuba_schoolbook #(
    parameter WIDTH=29
)
(
    // Inputs A, B
    input  logic [WIDTH-1:0] A,
    input  logic [WIDTH-1:0] B,

    // Output M = A*B 
    output logic [2*WIDTH-2:0] M
);
    wire [2*WIDTH-2:0] rows [0:WIDTH-1]; //Stores the rows of the partial products
    wire [2*WIDTH-2:0] acc [0:WIDTH-1]; //The product accumulates here 
    genvar i;
    generate
        for(i=0; i<WIDTH; i=i+1)
        begin
            if(i > 0)
                assign rows[i][i-1:0] = 0; // Assign all lower bits 0
            assign rows[i][WIDTH+i-1:i] = A & {WIDTH{B[i]}}; // A is partial product if B[i] is 1
            if(i < WIDTH - 1)
                assign rows[i][2*WIDTH-2:WIDTH+i] = 0; // Assign all higher bits 0

            if(i == 0)
                assign acc[i] = rows[i];
            else
                assign acc[i] = acc[i-1] ^ rows[i]; //Accumulate the partial product sums (XOR)
        end

        assign M = acc[WIDTH-1]; // Get the final product out
    endgenerate

endmodule

module modulo233(a, out);

input wire [464:0] a;
output wire [232:0] out;
wire [232:0] t1, t2, t3, t4; 
//Reducing polynomial is x^233 + x^74 + 1
//Following ppt

assign t1[231:0] = a[464:233];
assign t1[232] = 0;

assign t2[232:74] = a[391:233];
assign t2[73] = 0;
assign t2[72:0] = a[464:392];

assign t3[146:74] = a[464:392];
assign t3[232:147] = {86{0}};
assign t3[73:0] = {74{0}};
// Finally XOR all the terms
assign out = a[232:0] ^ t1 ^ t2 ^ t3;

endmodule