%% 1-a
clc; clear; close all;

% Planta: G(s) = K / (s * (s^2 + 2s + 1));
s = tf('s');    % Definição da variavel de Laplace
K = 1;          % Inicializacao de K
G1 = K / (s * (s^2 + 2*s + 1));

% (a) Determina ganho K para OS = 25%
OS = 0.25;      % overshoot 25%
zeta = -log(OS) / sqrt(pi^2 + log(OS)^2); % fator amortecimento
% Relacao entre zeta e a frequencia natural wn:
Ts = 2;         % tempo de acomodacao 2s
wn = 4 / (zeta * Ts);
% Ajustando K para valor desejado
K_val = wn^2; % Considerando eq caracteristica (s^2 + 2s + 1)
G = K_val / (s * (s^2 + 2*s + 1));
G = minreal(G);

%% 1-b
% (b) Calculo do erro em regime para entrada rampa
% O erro em regime para uma entrada rampa:
% e_ss = 1 / Kv, onde Kv = ganho de velocidade (coef. de erro de posicao)
Kv = dcgain(s*G); % Calcula ganho de velocidade

% Ajustando K para satisfazer o erro desejado (erro de 1.25/s)
K_adjusted = 1.25 / Kv; % Corrigindo erro no ajuste de K
G = K_adjusted / (s * (s^2 + 2*s + 1));
G = minreal(G);

%% 1-c 
% Projeto compensador avanco fase
% margem de fase >= 45°
% C(s) = (alpha * T * s + 1) / (T * s + 1), onde alpha > 1
% Verificacao da margem de fase antes da compensação
[mf,pm,wcg,wcp] = margin(G);
reqpm = 45; % margem fase requerida

if pm < reqpm && wcp > 0
    % Ajuste do compensador
    sf = 5; % fator seguranca
    alpha = (1 + sin(deg2rad(reqpm + sf - pm))) / (1 - sin(deg2rad(reqpm + sf - pm))); 
    T = 1 / (sqrt(alpha) * wcp);
    C = (alpha * T * s + 1) / (T * s + 1);
    CG = C * G;
else
    CG = G;
end

%% 1
% Mostra diagrama Bode completo com G, C e C*G
bode(G1,C,CG), grid, legend('G', 'C', 'C*G');

%% Simulação do sistema
% Criamos a malha fechada do sistema compensado
T_closed = feedback(CG, 1);

% Verificar estabilidade
poles_T_closed = pole(T_closed);
if any(real(poles_T_closed) > 0)
    warning('O sistema em malha fechada é instável. Verifique os parâmetros do compensador.');
else
    disp('O sistema em malha fechada é estável.');
end

% Simulação no tempo
t = 0:0.01:10;
r = t; % Entrada rampa
[y, t_out, x] = lsim(T_closed, r, t);

% Plot da resposta
figure;
plot(t_out, y, 'b', 'LineWidth', 2);
hold on;
plot(t, r, 'r--', 'LineWidth', 1.5);
grid on;
legend('Saída do sistema', 'Entrada rampa');
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta do Sistema Compensado');