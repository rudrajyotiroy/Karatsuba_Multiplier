## RECURSIVELY PARAMETRIZED SYNTHESIZABLE KARATSUBA MULTIPLIER FOR HARDWARE SECURITY APPLICATIONS

# ACKNOWLEDGEMENT

This project is performed as a part of Hardware Security (CS60004) course in IIT Kharagpur during Spring Semester of 2022. Many thanks to Prof. Debdeep Mukhopadhyay for designing this awesome course, providing amazing insights into different aspects of both "Hardware for Security" and "Security for Hardware" and guiding us through the project.
NAME : RUDRAJYOTI ROY
ROLL : 18EC10047
DATE SUBMITTED : 03/02/2022

# INTRODUCTION

The Karatsuba algorithm is a fast multiplication algorithm that uses a divide and conquer approach to multiply two numbers. 
This happens to be the first algorithm to demonstrate that multiplication can be performed at a lower complexity than O(N^2) which is by following the classical multiplication technique. Using this algorithm, multiplication of two n-digit numbers is reduced from O(N^2) to O(N^(log 3)).
Here, we have presented recursive parametrized hardware implementation of Karatsuba Multiplier for Galois field multiplication operation, which is widely used for implementing AES protocol in ASICs and FPGAs. 
Due to unavailability of a golden reference, the reference model is obtained from https://cse.iitkgp.ac.in/~debdeep/osscrypto/eccpweb/downloads/ksgen_verilog.tar.gz (C code executed for N = 233 Hybrid Karatsuba).

# FILE SUMMARY

Irreducible polynomial used : x^233 + x^74 + 1 = 0
Source_files/
    karatsuba.sv : Recursive karatsuba multiplier upto input bit length 29 
                   (Recursive karatsuba is more optimized only for bit lengths greater than 29)
                   Schoolbook multiplier for bit length lesser than 29
                   Modulo 233 calculator (hardcoded)
    ks233.sv : Reference model (obtained from above link)
    TESTBENCH.sv : Testbench generates random inputs and compares the output value for the two models.

