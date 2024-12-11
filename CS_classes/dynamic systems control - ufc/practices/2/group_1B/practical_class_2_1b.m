% SEMPRE UTILIZAR O COMANDO ABAIXO NO ARQUIVO PRINCIPAL
clc; clear; close all;
% Com eles, voce limpa as variaveis, fecha todos os arquivos abertos e
% limpa a tela. Isso torna mais facil e rapido a identificacao e correcao
% de erros

% variaveis
m1=4; m2=2; b=2; k1=4; k2=8;
% operador Laplace
s = tf('s');

% funcoes de transferencia
num_x1 = m2*s^2 + b*s + k2;
num_x2 = k2;
den = (m1*s^2 + k1+k2)*(m2*s^2 + b*s + k2) - k2^2;
G1 = num_x1/den;
G2 = num_x2/den;

% extraindo dados das funcoes de transferencia
[num1,den1] = tfdata(G1,'v');
[num2,den2] = tfdata(G2,'v');

% sistema G2 com realimentacao G1
G3 = feedback(G2,G1);

% sistemas G2 e G3 - resposta ao degrau unitario
step(G2,G3);
legend('G2','G3');

% Abre arquivo Simulink criado anteriormente
% simulink('aula2_1b_simulink');