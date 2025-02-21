clc; clear; close all;

t = 0:0.001:1;  % vetor tempo
K = 5;          % ganho planta
ts = 0.5;       % tempo acomodacao aa referencia
tsd = 0.1;      % tempo acomodacao ao disturbio
mp = 10;        % sobressinal entrada referencia
mpd = 5;        % sobressinal entrada disturbio
c = 50;         % raiz real
stopC = 0.02;   % criterio parada
s = tf('s');    % operador Laplace
u = 0;

for a=15:-0.2:0.2
    for b=15:-0.2:0.2
        % funcao transferencia
        a0 = 2*a+c;
        a1 = (a^2)+(b^2)+2*a*c;
        a2 = ((a^2)+(b^2))*c;
        num = [a0 a1 a2];
        den = [1 a0 a1 a2];
        TF = tf(num,den);

        y = step(TF,t);
        m = (max(y)-1)*100
        cont = size(y); % tamanho do vetor
        k1 = cont(1,1);
        while (abs(y(k1)-1))<stopC & k1>1 
        % permanece no loop ate chegar no criterio 2%
            k1 = k1-1;
        % decrementa s e varre conjunto dos sinais
        end
        Ts = t(1,k1); % transforma posicao do sinal em tempo.
        % DISTURBIO
        
    end
end