%%
% Questao 1
%       Projete um controlador de posição PID pelo 2º Método de Ziegler
%   Nichols para o Motor CC com excitação Série com controle da tensão de
%   entrada com os seguintes parâmetros: La=Lf=100mH, Ra=Rf=0,5 Ohms,
%   Ka=0,2, J=1 e B=1. Faça uma análise comparativa de desempenho com as
%   seguintes configurações : PID, I-PD, PI-D e mostre qual a melhor
%   configuração para o controle do motor. Explique a teoria didaticamente
%   e que seja reprodutível, de modo ao leitor reproduzir o que foi
%   proposto. Realize uma análise comparativa entre as curvas de excitação 
%   ao degrau e mostre qual destes tem o melhor resultado usando índices
%   de desempenho IAE, ISE, ITSE, respostas no tempo e na frequencia.

% Paginas internet
%   https://www.mathworks.com/help/slcontrol/ug/...
%         ...create-i-pd-and-pi-d-controllers.html
%   https://www.mathworks.com/help/control/ug/dc-motor-control.html

% https://www.allaboutcircuits.com/technical-articles/an-introduction...
% ...-to-control-systems-designing-a-pid-controller-using-matlabs/

% Praticas Matlab Controle Analogico
% Pratica 1 - Modelos em funcao de transferencia
% Pratica 6 - Controle PI e PID por ZN
%%
clc; close all; clear;
% Modelo motor cc excitacao serie

% VARIAVEIS
La  = 100*10^(-3);   % indutancia armadura
Lf  = La;            % indutancia enrolamento de campo
Ra  = 0.5;           % resistencia enrolamento
Rf  = Ra;            % resistencia campo
Ka  = 0.2;           % constante inercia da armadura/torque
J   = 1;             % momento inercia motor
B   = 1;             % constante amortecimento carga


% FUNCAO TRANSFERENCIA
num         = Ka;
den         = conv([J B], [1 0]);
den         = conv(den, [La+Lf Ra+Rf]);
Gs          = tf(num, den);
% variaveis simulink
num_i       = 1;
den_i       = [(La+Lf) (Ra+Rf)];
num_v       = 1;
den_v       = [J B];


% ZIEGLER NICHOLS 2º METODO
% Kcr = Mg, Pcr = (2*pi)/wgc

figure(1);
bode(Gs);
margin(Gs);
[Gm, PM, wgc, wpm]  = margin(Gs); % margin p/ valores criticos
Kcr                 = Gm;
Pcr                 = 2*pi/wgc;
% Tabela PID-ZN
Kp          = 0.6*Kcr;                   % Proporcional
Ti          = 0.5*Pcr;                   % Integral
Td          = Ti/4;                      % Derivativo
s           = tf('s'); % Operador Laplace
Gc          = Kp*(1+(1/(Ti*s))+Td*s);    % Funcao controle
% PID
GcPID       = series(Gc, Gs);
TPID        = feedback(GcPID,1);
 figure(2);
 step(TPID), grid, title('Resposta ao degrau unitario');
% PI-D
GcPIbD      = Kp*(1+(1/(Ti*s)));
TPIbD       = GcPIbD*Gs/(1+Gc*Gs);
 figure(3);
 step(TPIbD), grid, title('Resposta ao degrau unitario');
% I-PD
GcIbPD      = Kp*(1/(Ti*s));
TIbPD       = GcIbPD*Gs/(1+Gc*Gs);
 figure(4);
 step(TIbPD), grid, title('Resposta ao degrau unitario');

% SIMULACAO SIMULINK
mdl     = "q1simulink";
open_system(mdl)
sim("q1simulink")

% INDICES DE DESEMPENHO
% Extrair dados gerados por 'To workspace'
tout    = ans.tout1;
e1      = ans.e1;
e2      = ans.e2;
e3      = ans.e3;
dt      = diff(tout);
% ISE
ISE1    = (e1(1:end-1).*e1(1:end-1))'*dt;
ISE2    = (e2(1:end-1).*e2(1:end-1))'*dt;
ISE3    = (e3(1:end-1).*e3(1:end-1))'*dt;
% IAE
IAE1    = abs(e1(1:end-1))'*dt;
IAE2    = abs(e2(1:end-1))'*dt;
IAE3    = abs(e3(1:end-1))'*dt;
% ITSE
ITSE1   = (tout(1:end-1).*(e1(1:end-1).*e1(1:end-1)))'*dt;
ITSE2   = (tout(1:end-1).*(e2(1:end-1).*e2(1:end-1)))'*dt;
ITSE3   = (tout(1:end-1).*(e3(1:end-1).*e3(1:end-1)))'*dt;