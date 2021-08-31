% Script RR_Colpitts.m modified by Thien Truong
% Determine a3, a4, and w2 from the parameters of the circuit {Ri;Ci;Li} noting that the Barkhausen criterion is
% given by a4 <= 0.
% Written by Thien Truong, modified from the code by T Bewley provided at the RR codebase.

clear; syms C1 C2 L3 R4 R5 R6 R8 I1 I2 I3 I4 I5 I6 I7 I8 Va Vb Vs Vout Vout0 Va0 I30 s 
eqn1 = 'I3=I4'; eqn5 = 'I2=-C2*(s*Va-Va0)'; eqn9 = '-Vs=R6*I6';
eqn2 = 'I5=I6'; eqn6 = 'Va-Vb=L3*(s*I3-I30)'; eqn10 = 'I1=C1*(s*Vout-Vout0)';
eqn3 = 'I2=I3+I5'; eqn7 = 'Vb-Vout=R4*I4'; eqn11 = 'I6+I7=I8';
eqn4 = 'I4+I8=I1'; eqn8 = 'Va=R5*I5'; eqn12 = 'Vs-Vout=R8*I8';
SOL=solve(str2sym(eqn1),str2sym(eqn2),str2sym(eqn3),str2sym(eqn4),str2sym(eqn5),...
str2sym(eqn6),str2sym(eqn7),str2sym(eqn8),str2sym(eqn9),str2sym(eqn10),...
str2sym(eqn11),str2sym(eqn12),I1,I2,I3,I4,I5,I6,I7,I8,Va,Vb,Vs,Vout); Vout = SOL.Vout

eqn13 = 'a2 = (C2*L3*R5 + C1*L3*R8 + C1*C2*R4*R5*R8)/(C1*C2*L3*R5*R8)';
eqn14 = 'a1 = (L3 + C2*R4*R5 + C1*R4*R8 + C1*R5*R8 + C2*R5*R8)/(C1*C2*L3*R5*R8)';
eqn15 = 'a0 = (R4+R5+R6+R8)/(C1*C2*L3*R5*R8)';
eqn16 = 'q = a1 - (a2^2)/3';
eqn17 = 'r = a0 + 2*(a2^3)/27 -a2*a1/3';
eqn18 = 'd = (r^2)/4 + (q^3)/27';
eqn19 = 'a3 = a2/3 + (-r/2 + sqrt(d))^1/3 - (-r/2 - sqrt(d))^1/3';
eqn20 = 'a4 = a2 - a3';
eqn21 = 'w2^2 = a0/a3';
SOL1=solve(str2sym(eqn13),str2sym(eqn14),str2sym(eqn15),str2sym(eqn16),str2sym(eqn17),str2sym(eqn18),...
    str2sym(eqn19),str2sym(eqn20),str2sym(eqn21));
a0 = SOL1.a0
a1 = SOL1.a1
a2 = SOL1.a2
a3 = SOL1.a3
a4 = SOL1.a4
w2 = SOL1.w2
