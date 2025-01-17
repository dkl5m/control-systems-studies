% Sistema de primeira ordem
clear; close all; clc;

% dados
data1 = load("EX2_02D.dat");

% variaveis
t1 = 1959;  % ponto onde corta o eixo x
t2 = 4330;  % ponto que atinge 63.2% do ganho
t3 = 5672;  % ponto que atinge o ganho
t4 = 3059;  % ponto que atinge 28.3% do ganho
K = 10;     % ganho

% coeficientes de cada metodo
% Hagglund
theta_HAG = t1;
tau_HAG = t2 - t1;
% Smith
tau_sm = 1.5*(t2-t1);
theta_sm = t2 - tau_sm;
% Ziegler-Nichols
theta_zn = t1;
tau_zn = t3 - t1;

% funcoes de transferencia
s = tf('s'); % operador Laplace
g_HAG = exp(-s*theta_HAG)*K/(tau_HAG*s+1);
g_sm = exp(-s*theta_sm)*K/(tau_sm*s+1);
g_zn = exp(-s*theta_zn)*K/(tau_zn*s+1);

% grafico
figure(1), plot(data1), hold on;
step(g_HAG, 'r', g_sm, 'y', g_zn, 'k');
legend('data1', 'g_{HAG}', 'g_{Smith}','g_{ZN}'), hold off;

%% Sistema 2
clear; close all; clc;

% dados
data2 = load("EX1_02D.dat");

% variaveis
K = 1;                                % ganho
T1 = 27;
T2 = 69;
ymax = 1.37;
y2 = 1.05;
Tp = T2 - T1;
a = ymax - K;
ad = y2 - K;
d = ad/a;
csi = 1/(sqrt(1+(2*pi/log(d))^2));   % coeficiente de amortecimento
wn = (2*pi)/(Tp*sqrt(1-csi^2));      % frequencia natural

% funcoes transferencia
s = tf('s');                        % operador Laplace
g_osc = exp(-6*s)*(K*wn^2)/(s^2 + 2*csi*wn*s + wn^2);

% grafico
figure(1), plot(data2), hold on;
step(g_osc, 'r'), legend('data2', 'g_{osc}'), hold off;