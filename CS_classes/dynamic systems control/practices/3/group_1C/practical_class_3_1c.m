clear; close all; clc;

% variaveis
R = 10;
L = 5;
C = 5e-3;

A = [0, -1/L; 1/C, -1/(R*C)];
B = [1/L; 0];
c = [0, 1/R];
D = 0;
c2 = [0 -1];
D2 = 1;

sys = ss(A,B,c,D)
% step(sys)
% [num,den] = ss2tf(A,B,c,D);
% sys2 = tf(num,den)
% step(sys2)
% step(sys,sys2)
% legend('sys','sys2')

[num2,den2] = ss2tf(A,B,c2,D2);
sys3 = tf(num2,den2)
step(sys3)

