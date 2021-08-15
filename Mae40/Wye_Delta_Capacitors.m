% script Wye_Delta_Capacitors.m modified by Thien Truong.
% Computes the equivalent resistance of a Wheatstone Bridge of capacitors by applying the Wye Delta transformation.
% Written by Thien Truong, modified from the code by T Bewley provided at the RR codebase.
  
syms C1 C2 C3 C4 C5 Ca Cb Cc
eqn1='(1/Ca + 1/Cb) == 1/(1/(1/C1) + 1/(1/C2 + 1/C3))'
eqn2='(1/Ca + 1/Cc)==1/(1/(1/C2) + 1/(1/C1 + 1/C3))'
eqn3='(1/Cb + 1/Cc)==1/(1/(1/C3) + 1/(1/C1 + 1/C2))'
A=solve(str2sym(eqn1),str2sym(eqn2),str2sym(eqn3),Ca,Cb,Cc);
B=solve(str2sym(eqn1),str2sym(eqn2),str2sym(eqn3),C1,C2,C3);
Ca = simplify(A.Ca), Cb = simplify(A.Cb), Cc = simplify(A.Cc)
simplify(1/Ca + 1/(1/(1/Cb + 1/C4) + 1/(1/Cc + 1/C5)))
C1 = simplify(B.C1), C2 = simplify(B.C2), C3 = simplify(B.C3)
