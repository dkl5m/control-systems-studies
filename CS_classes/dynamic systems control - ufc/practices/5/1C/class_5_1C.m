% Modelo primeira ordem
clear; close all; clc;

% variaveis
tSample = 0.1;              % tempo amostragem
sim = sim('class_5_1C.slx');   % simulink
in = sim.in;                % entrada
out = sim.out;              % saida
time = sim.time;            % tempo simulacao
tFinal = length(out);       % stop time simulink
K = out(tFinal)/in(tFinal); % ganho

% step
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

tau = tTau - tStep;
tau = tau*tSample;
G   = tf(K,[tau 1]);
figure(1), hold on, grid on, plot(time,out);
step(G, 'r'), legend('Simulink output','Script output'),hold off;

%% Modelo segunda ordem
clear; close all; clc;

% variaveis
tSample = 0.1;              % tempo amostragem
K = 1;                      % ganho
wn = 2;                     % frequencia natural
qsi = 0.5;                  % fator de amortecimento

% funcao transferencia
num = K*wn^2;               % numerador
den = [1 2*qsi*wn wn^2];    % denominador
G2 = tf(num,den);           % funcao transferencia

% simulacao
sim = sim('class_5.slx');   % simulink
in = sim.in1;               % entrada
out2 = sim.out1;             % saida
time = sim.time1;           % tempo simulacao
tFinal = length(out2);       % stop time simulink

% step
for i=1:tFinal
    if in(i) ~= 0
        tStep = i;
        break
    end
end

% tempo pico
[peak,KPeak] = max(out2);
tPeak = (KPeak-tStep)*tSample;

% percentual de sobressinal (Mp)
Mp = ((peak - out2(tFinal))/(out2(tFinal)))*100;

% fator de amortecimento
qsi_e = (-log(Mp/100))/(sqrt((pi^2)+log(Mp/100)^2));

% frequencia natural
wn_e = pi/(tPeak*sqrt(1-qsi_e^2));

% tempo de assentamento
tSet = 4/(wn_e*qsi_e);

% ganho estimado
Ke = out2(tFinal)/in(tFinal);

Ge = tf(Ke*wn_e^2, [1 2*qsi_e*wn_e wn_e^2]);

step(G2,Ge);