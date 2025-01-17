%% Sistema primeira ordem
clear; close all; clc;

% dados
data2 = load('EX2_01C.dat');

% variaveis
t1 = 716;    % ponto onde corta eixo x
t2 = 1973;   % ponto que atinge 63.2% do ganho
t3 = 2572;   % ponto onde atinge valor do ganho
t4 = 1315;   % ponto que atinge 28.2% do ganho
K = 2;       % ganho

% Coeficientes de cada metodo
% Hagglund
theta_HAG = t1;
tau_HAG = t2 - t1;
% Smith
tau_smith = 1.5*(t2 - t4);
theta_smith = t2 - tau_smith;
% Ziegler-Nichols
theta_zn = t1;
tau_zn = t3 - t1;

% funcoes transferencia
s = tf('s'); % operador Laplace
g_HAG = exp(-s*theta_HAG)*K/(tau_HAG*s+1);
g_smith = exp(-s*theta_smith)*K/(tau_smith*s+1);
g_zn = exp(-s*theta_zn)*K/(tau_zn*s+1);

% grafico
figure(1), plot(data2), legend('data2'), hold on;
step(g_HAG, 'r', g_smith, 'y', g_zn, 'k');
legend('data2', 'g_{HAG}', 'g_{smith}', 'g_{zn}'), hold off;

%% Sistema oscilatorio
clear; close all; clc;

% dados
data1 = load('EX1_01C.dat');

% variaveis
K = 1;          % ganho
Mp1 = 0.61;     % maximo percentual overshoot primeiro pico
Mp2 = 0.24;     % maximo percentual overshoot segundo pico
csi = -log(Mp1)/(sqrt(pi^2+log(Mp1)^2)); % coeficiente amortecimento
Tp = 36 - 15;   % tempo pico 2 - tempo pico 1
wn = (2*pi)/(Tp*sqrt(1-csi^2)); % frequencia natural

% funcoes transferencia
s = tf('s');    % operador Laplace
g_osc = (K*wn^2)/(s^2 + 2*csi*wn*s + wn^2);

% grafico
figure(1), plot(data1), legend('data1'), hold on;
step(g_osc, 'r'), legend('data1', 'g_{osc}'), hold off;