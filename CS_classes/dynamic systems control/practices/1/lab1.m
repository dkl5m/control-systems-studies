M1=1;
M2=1;
b1=1;
b2=1;
k1=1;
k2=1;

syms s U1 U2;

A = [M1*s^2+(b1-b2)*s+(k1-k2), b2*s+k2; -(b2*s+k2), M2*s^2+b2*s+k2];
B = [U1; U2];

x_s = linsolve(A,B)