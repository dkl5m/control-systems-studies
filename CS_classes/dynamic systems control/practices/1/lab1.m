M=1;
b=1;
k=1;

syms s U;

A = [M*s^2+b*s+k];
B = [U];

x = linsolve(A,B)
%%

M1=1;
M2=1;
b1=1;
b2=1;
k1=1;
k2=1;

syms s U1 U2;

A1 = [M1*s^2+(b1+b2)*s+(k1+k2), -(b2*s+k2); -(b2*s+k2), M2*s^2+b2*s+k2];
B1 = [U1; U2];

x_s = linsolve(A1,B1)