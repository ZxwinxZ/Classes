% script RR_Wheatstone_Inductors.m modified by Thien Truong
% Computes the currents and intermediate nodal voltages of a Wheatstone Bridge with two inductors.
% Written by Thien Truong, modified from the code by T Bewley provided at the RR codebase.

syms L5 s V0; R1=1e3; R4=1e3; L2=1e-5; R3=1e5;
A=[1 -1 -1 0 0 0 0 0; 0 0 1 1 0 -1 0 0; 0 1 0 -1 -1 0 0 0; 0 R1 0 0 0 0 1 0; ...
   0 0 L2*s 0 0 0 0 1; 0 0 0 0 0 L5*s 0 -1; 0 0 0 0 R4 0 -1 0; 0 0 0 R3 0 0 -1 1];
b=[0; 0; 0; V0; V0; 0; 0; 0]; x=A\b
