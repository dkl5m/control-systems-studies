% Modelo primeira ordem
clear; close all; clc;

% variaveis
tSample = 0.1;              % tempo de amostragem
sim = sim('class_5_2D.slx');% simulacao do simulink
in = sim.input;             % entrada
out = sim.output;           % saida
time = sim.time;            % tempo de simulacao
tFinal = length(out);       % stop time simulink
K = out(tFinal)/in(tFinal); % ganho

% step - entrada degrau unitario
for i=1:tFinal
    if in(i) ~= 0
        tStep = i;
        break
    end
end

% tau - constante tempo 63.2%
for i=1:tFinal
    if out(i) >= (1-1/exp(1))*out(tFinal)
        tTau = i-1;
        break
    end
end
tau = (tTau - tStep)*tSample;

% funcao transferencia
G   = tf(K,[tau 1]);

% graficos
figure(1), hold on, grid on, plot(time, out);
step(G, 'r'), legend('Simulink output', 'Script output'), hold off;

%% Modelo segunda ordem
clear; close all; clc;

% variaveis - script/simulink
tSample = 0.1;                  % tempo de amostragem
K = 2;                          % ganho
wn = 3;                         % frequencia natural
qsi = 0.5;                      % fator de amortecimento

% funcao transferencia - script
num = K*wn^2;                   % numerador
den = [1 2*qsi*wn wn^2];        % denominador
G2 = tf(num, den);              % funcao transferencia

% simulacao - simulink
sim = sim('class_5_2D.slx');    % simulacao do simulink
in = sim.input1;                % entrada
out = sim.output1;              % saida
time = sim.time1;               % tempo de simulacao
tFinal = length(out);           % stop time simulink

% step - entrada degrau unitario
for i=1:tFinal
    if in(i) ~= 0
        tStep = i;
        break
    end
end

% variaveis estimadas - simulink
K_e = out(tFinal)/in(tFinal);   % ganho
[peak, KPeak] = max(out);       % valor de pico
tPeak = (KPeak-tStep)*tSample;  % tempo de pico
% percentual de sobressinal (Mp)
Mp = ((peak - out(tFinal))/out(tFinal))*100;
% fator de amortecimento
qsi_e = (-log(Mp/100))/(sqrt(pi^2+(log(Mp/100))^2));
% frequencia natural
wn_e = pi/(tPeak*sqrt(1-qsi_e^2));
% tempo de assentamento 2%
tSet = 4/(wn_e*qsi_e);

% funcao transferencia estimada - simulink
num_e = K_e*wn_e^2;
den_e= [1 2*qsi_e*wn_e wn_e^2];
G_e = tf(num_e, den_e);

% grafico
figure(1), step(G2, G_e), legend('tf script', 'tf simulink');