clc; clear; close all;

% (1)
R = 2*10^3; L = 2; C = 2*10^(-3);
num1 = 1;
den1 = [L*C L/R 1];
H1 = tf(num1, den1)
figure(1), bode(H1)
wn = 1/sqrt(L*C)
allmargin(H1)

% (2)
R1 = 5*10^3; R2 = 10*10^3;
C1 = 0.1*10^(-6); C2 = 0.1*10^(-6);
num2 = [-C1*R2 0];
den2 = [C1*R1*C2*R2 (C1*R1+C2*R2) 1];
H2 = tf(num2, den2)
figure(2), bode(H2)
allmargin(H2)

% (3)
R3 = 20*10^3; R4 = 400*10^3;
C3 = 1.25*10^(-6); C4 = 15.625*10^(-9);
num3 = [-C3*R4 0];
den3 = [C3*R3*C4*R4 (C3*R3+C4*R4) 1];
H3 = tf(num3, den3)
figure(3), bode(H3)
allmargin(H3)