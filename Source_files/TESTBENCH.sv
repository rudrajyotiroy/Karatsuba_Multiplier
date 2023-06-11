`timescale 1ns / 1ps
`include "ks233.v"
`include "karatsuba.sv"
module KaratSuba_test;
// Inputs
reg[232:0] a,b,r1,r2;
// Outputs
wire[464:0] p, q;
integer i;
integer N_RUNS = 10;

ks233 reference(a, b, q); // Instantiate the reference model
karatsuba_recurse k(a, b, p); // Instantiate the unit under test

modulo233 multmod(p, r1); // Modulo operation to bring back to field
modulo233 refmod(q, r2); // Modulo operation to bring back to field

initial begin
$monitor("Time=%5d, First Number = %d, Second Number = %d, Reference Product = %d, My Product = %d", $time, a,b,r1,r2);
// Initialize Inputs

for(i=0;i<N_RUNS;i=i+1)
    begin
        // Generate random sequence
        a[31:0] = $urandom;
        b[31:0] = $urandom;
        a[63:32] = $urandom;
        b[63:32] = $urandom;
        a[95:64] = $urandom;
        b[95:64] = $urandom;
        a[127:96] = $urandom;
        b[127:96] = $urandom;
        a[159:128] = $urandom;
        b[159:128] = $urandom;
        a[191:160] = $urandom;
        b[191:160] = $urandom;
        a[223:192] = $urandom;
        b[223:192] = $urandom;
        a[232:224] = $urandom;
        b[232:224] = $urandom;
        #100;
    end

$finish;
end

initial
begin
$dumpfile("karatsuba_data_instance.vcd");
$dumpvars;
end
endmodule