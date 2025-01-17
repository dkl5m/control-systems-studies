clc; clear; close all;

m1 = 4;
k1 = 2;
b1 = 8;
m2 = 2;
k2 = 4;
b2 = 7;

g1 = tf(1, [m1 (b1+b2) (k1+k2)]);
g2 = tf(-1, [b2 k2]);
g3 = g2;
g4 = tf(1, [m2 b2 k2]);

% step(g1,g2,g4)

g5 = parallel(g1,g3)
series(g1,g2)
g6 = feedback(g1,1)
step(g1,g6)