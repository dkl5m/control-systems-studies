clear; close all; clc;

% variaveis
A_t = 5;    % area tanque
A_v = 0.5;  % area valvula
alpha = 1;  % variavel fluxo valvula
                % 1 = completamente aberta
                % 0 = completamente fechada
g = 9.81;   % gravidade
u_0 = 1;    % entrada inicial
% altura inicial
h_0 = (u_0/(alpha*A_v*sqrt(2*g)))^2;

% matrizes de estado
A = -(alpha*A_v*sqrt(2*g))/(2*A_t*sqrt(h_0));
B = 1/A_t;
C = 1;
D = 0;

% 1 e 2
sys = ss(A,B,C,D)
figure(1)

% 3
[num, den] = ss2tf(A,B,C,D);
sys2 = tf(num,den)
step(sys, sys2)
legend('sys','sys2')

