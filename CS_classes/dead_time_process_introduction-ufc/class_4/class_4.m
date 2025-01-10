% Class_4 = Filtered Smith Predictor (Continuous)
clear; close all; clc;

% specs
% G(s) = 2/(3s + 1); C = k*(s+z)/s;
% Mp = 0.05; ts = 4;

% Plant variables
nump = 2;                           % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay
G = tf(nump,denp);                  % plant tf
Gd = tf(nump,denp,'InputDelay',h);  % delayed plant tf

% step(G)

% Smith Predictor variables
% By rootlocus, z = 0.9839
% By |C*G| = 1, k = 5.3360
z = 0.9839;                         % controller zero
k = 5.3360;                         % controller gain
s = tf('s');                        % Laplace operator
C = k*(s+z)/s;                      % PD controller
Gc = C*G;                           % controlled plant without delay tf
% Hry = (C*G)/(1+C*G)

% 
% %data
% Tm1=22; Tm2=32; DL=30; ww=logspace(-3,2,300);
% % %controller
% % denc=[1 0.2 0]; numc=-0.73*conv([1 0.027],[1 0.02]);
% % %process
% % denp=conv([30 1],[60 1]); nump=-12;
% %loop
% % for i=1:300
% %     w=ww(i); deltaP(i)=abs(exp(-30*j*w)-1);
% %     e(i)=1/deltaP(i);
% %     M1(i)=1/abs(1+Tm1*j*w);M2(i)=1/abs(1+Tm2*j*w);
% %     C(i)=(polyval(numc,j*w))/(polyval(denc,j*w));
% %     P(i)=(polyval(nump,j*w))/(polyval(denp,j*w));
% %     H(i)=abs(C(i)*P(i))/abs(1+C(i)*P(i));
% %  end
% % for i=1:300
% %     w=ww(i); deltaP(i)=abs(exp(-30*j*w)-1);
% %     e(i)=1/deltaP(i);
% %     M1(i)=1/abs(1+Tm1*j*w);M2(i)=1/abs(1+Tm2*j*w);
% %     X(i)=k*(j*w+z)/(j*w);
% %     P(i)=nump/(polyval(denp,j*w));
% %     % H(i)=abs(C(i)*P(i))/abs(1+C(i)*P(i));
% %     % Se C(i) e P(i) são funções de transferência, calcule o módulo em uma frequência específica
% %     omega = i; % frequência de exemplo, ajuste conforme necessário
% %     H(i) = abs(freqresp(X(i) * P(i), omega)) / abs(1 + freqresp(X(i) * P(i), omega));
% % 
% %  end

% Filtered Smith Predictor variables
tau = 1.5;
Tf = 2;
Tn = 3;
Tr = 1.5;           % constante tempo desejada em malha fechada

%beta = (1-(1-Tf/Tn)*(1-Tr/Tn)*exp(-h/Tn))*Tn;
F = tf(1, [tau 1]);                 % filter

beta = (1-exp(-h/Tn)*(1-Tf/Tn)^2)*Tn;
F1 = tf( conv([Tr 1],[beta 1]), conv([tau 1],[tau 1]));                 % filter

sim = sim("class_4_simulink.slx");
fsp_time = sim.fsp_time;

% plot FSP
fsp_u = sim.fsp_u;
fsp_c = sim.fsp_c;
fsp_y = sim.fsp_y;

figure(1);
plot(fsp_time, fsp_u, '--k', 'LineWidth', 1.7), hold on;
plot(fsp_time, fsp_c, 'b', 'LineWidth', 1.7);
plot(fsp_time, fsp_y, 'r', 'LineWidth', 1.7);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com FSP'), hold off;

% plot FSP com perturbacoes
fsp_u1 = sim.fsp_u1;
fsp_c1 = sim.fsp_c1;
fsp_y1 = sim.fsp_y1;

figure(2);
plot(fsp_time, fsp_u1, '--k', 'LineWidth', 1.7), hold on;
plot(fsp_time, fsp_c1, 'b', 'LineWidth', 1.7);
plot(fsp_time, fsp_y1, 'r', 'LineWidth', 1.7);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com FSP e perturbações'), hold off;

% Índices de Robustez
W=logspace(-3,3,600);
w = 1j*W;
MdP=abs(exp(-lambda*Ln*w)-1); % Incerteza multiplicativa
% MdP=abs((2.*sin(w.*lambda./2)).*(cos(lambda.*w/2)+j.*sin(lambda.*w./2)));
%MdP = abs(2*sin(W*lambda/2));


% ws = logspace(-1, log10(pi), 1000);
% dP = abs(freqresp((G-G)))