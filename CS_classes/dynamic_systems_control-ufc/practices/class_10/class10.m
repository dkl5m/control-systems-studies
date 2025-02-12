clc; clear; close all;

s = tf('s'); % Definição da variável de Laplace
K = 1; % Inicialização de K
G = K / (s * (s^2 + 2*s + 1));

OS = 0.25; Ts = 2;
zeta = -log(OS) / sqrt(pi^2 + log(OS)^2); % Cálculo do fator de amortecimento
wn = 4 / (zeta * Ts); % Aproximando tempo de acomodação em 2 segundos

% Ajustando K para satisfazer o valor desejado
K_val = wn^2; % Considerando que a equação característica é (s^2 + 2s + 1)
G = K_val / (s * (s^2 + 2*s + 1));
G = minreal(G);

% Cálculo do erro em regime para entrada rampa
% O erro em regime para uma entrada rampa é dado por:
% e_ss = 1 / Kv, onde Kv é o ganho de velocidade
Kv = dcgain(s*G); % Cálculo do ganho de velocidade

% Ajustando K para satisfazer o erro desejado (erro de 1.25/s)
K_adjusted = 1.25 / Kv; % Corrigindo erro no ajuste de K
G = K_adjusted / (s * (s^2 + 2*s + 1));
G = minreal(G);
% bode(G)

%%
[mf,pm,wcg,wcp] = margin(G);
phase = -96;
pm = 180+phase;
alpha = (1 + sin(deg2rad(45 - pm))) / (1 - sin(deg2rad(45 - pm)));
% bode(G*sqrt(alpha))
% wcp = 1;
T = 1 / (sqrt(alpha) * wcp);
D = (alpha * T * s + 1) / (T * s + 1);
Gc = D * G;
bode(G, D, Gc)