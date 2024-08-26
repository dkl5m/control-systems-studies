% Transformacao de similaridade
close all;clear;

% matrizes originais
A = [0 1;-0.2 1.2]; b = [0;1]; c = [5 10]; d = 0;
% gera sistema discreto com as matrizes originais
sys = ss(A,b,c,d,-1);

P = [2 0;0 3]; % matriz similaridade
% novas matrizes
At = inv(P)*A*P; bt = inv(P)*b; ct = c*P; dt = 0;
% gera sistema discreto com as novas matrizes
syst = ss(At,bt,ct,dt,-1);

% simulacao resposta impulso
[y,t,x] = impulse(sys); % representacao original
[yt,tt,xt] = impulse(syst); % representacao transformada