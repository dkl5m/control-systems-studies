clear; close all; clc;

% variaveis
k = 5; m = 5; J = 1; R = 10;
b = 0.5; km = 1;

% matrizes
A = [0, 1, 0, 0;
    -2*k*R^2, -b, 2*k*R, 0;
    0, 0, 0, 1;
    (2*k*R)/m, 0, (-2*k)/m, 0];
B = [0; km/(R*J); 0; 0];
C = [0, 0, 1, 0];
D = 0;

% sys = ss(A, B, C, D);
% [nump, denp] = ss2tf(A,B,C,D);
% g = tf(nump,denp);

% step(sys)
% step(sys, g)
% legend('sys', 'g')

% [z, p, k] = ss2zp(A, B, C, D)