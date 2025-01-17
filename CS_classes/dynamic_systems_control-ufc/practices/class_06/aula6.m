clc; % limpa tela

ra = 2.4; la = 10.43e-3; Jm = 3.79;
kphi = 1.28; Fm = 0.0078; % variaveis

A = [-ra/la -kphi/la; kphi/Jm -Fm/Jm];
B = [1/la 0; 0 1/Jm];
C = [1 0];
D = [0 0]; % matrizes

T = 0:1:100; % vetor tempo
U = [ones(size(T))' zeros(size(T))']; % entrada
Y = lsim(A, B, C, D, U, T); % cria simulacao
% plot(T, Y, 'r', 'LineWidth', 2); % plota simulacao

nu = 1; % entrada
W = logspace(-1, 3, 500); % escala de frequencia
[Ampl, Fase] = bode(A, B, C, D, nu, W);
figure
subplot(2, 1, 1) % grafico 1 do subplot
semilogx(W, 20*log10(Ampl)); % Amplitude em dB 
subplot(2, 1, 2) % grafico 2 do subplot
semilogx(W, Fase); % Fase em graus

eig(A)