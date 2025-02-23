clc; clear; close all;

% EXEMPLO
% Projetar um controlador PID 2DOF
% ts < 0.5; mp < 10%; tsd < 0.1; mpd < 5%.

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
        % funcao transferencia Planta
        a0 = 2*a+c;
        a1 = (a^2)+(b^2)+2*a*c;
        a2 = ((a^2)+(b^2))*c;
        num = [a0 a1 a2];
        den = [1 a0 a1 a2];
        G = tf(num,den);

        y = step(G,t);
        m = (max(y)-1)*100;
        cont = size(y); % tamanho do vetor
        k1 = cont(1,1);

        while (abs(y(k1)-1))<stopC && k1>1 
        % permanece no loop ate chegar no criterio parada
            k1 = k1-1;
        % decrementa s e varre o conjunto dos sinais obtidos
        % ao aplicar o step de tras pra frente
        end

        Ts = t(1,k1); % transforma posicao do sinal em tempo.
        
        % DISTURBIO
        numd = [K 0];
        Gd = tf(numd,den);
        D = step(Gd,t);
        md = max(D)*100;

        k1 = cont(1,1);

        while (D(k1)<stopC & k1>1)
            k1 = k1-1;
        end
        
        Tsd = t(1,k1); % transforma a posicao do sinal em tempo.
        
        if m<mp && Ts<ts && Tsd<tsd && md<mpd
            figure(1) % entrada em degrau sistema
            plot(t,y); grid;

            figure(2) % entrada em degrau disturbio
            plot(t,D); grid;

            figure(3) % entrada em degrau disturbio
            u=step(1/(s),t);
            y=lsim(G,u,t);
            plot(t,y);

            hold on
            plot(t,u);
            grid;

            figure(4) % entrada em aceleracao
            u=step(1/(s*s),t);
            y=lsim(G,u,t);
            plot(t,y);

            hold on
            plot(t,u);
            grid;

            u=1;
            sol_R = [a; b; c; m; Ts];
            sol_D = [md; Tsd];
            break;
        end % requisitos de controle
        
        if m<mp && Ts<ts && Tsd<tsd && md<mpd
            break;
        end
    end % for b

    if m<mp && Ts<ts && Tsd<tsd && md<mpd
            break;
    end
end % for a

if u == 1
    G = tf(num,den);
    sol_R
    sol_D
    gama1=a0/K;
    alpha1=a1/K;
    beta1=a2/K;

    gama2=-3/5;
    alpha2=-2/5;
    beta2=0;

    num2=[gama1 alpha1 beta1];
    den2=[1 0];
    G2=tf(num2,den2);
    
    num3=[gama2 alpha2 beta2];
    den3=[1 0];
    G3=tf(num3,den3);
end
('Acabou')