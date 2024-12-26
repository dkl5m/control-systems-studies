clc; clear; close all;

% Parametros
MP = 0.05;                                      % max overshoot
zeta = 0.7;                                     % damping ratio
sigma = 0.75;            
t5 = 3/sigma;                                   % tempo acomodacao 5%
theta = acosd(zeta);

% Posicoes polo, zero
c1 = sigma;
c2 = 1 - sigma;
c3 = 3 - sigma;
alpha1 = 180 - theta;
alpha2 = atand(sigma/c2);
alpha3 = atand(sigma/c3);
beta = 180 - (alpha1+alpha2+alpha3);
o = tan(beta)*sigma;
cbeta = sigma/tand(beta);
z = 1 + o;
d1 = sqrt((sigma^2)+(c1^2));
d2 = sqrt((sigma^2)+(c2^2));
d3 = sqrt((sigma^2)+(c2+cbeta+c3)^2);
dbeta = sqrt((sigma^2)+(c2+cbeta)^2);

% Funcoes transferencia
num = 2;
den = conv([1 1],[1 3]);
K = (d1*d2*d3)/dbeta;                           % test K = 3
numC =[1 z];
denC = [1 0];
G = tf(num,den);                                % test KG = tf(3*num,den)
C = tf(K*numC,denC);
GC = feedback(G*C,1);

step(G,GC), legend('G','GC');

%%
clc; clear; close all;

% Parametros
MP = 0.05;                                      % max overshoot
zeta = 0.7;                                     % damping ratio
sigma = 0.75;            
t5 = 3/sigma;                                   % tempo acomodacao 5%
theta = acosd(zeta);

% Posicoes polo, zero
c1 = sigma;
c2 = 1 - sigma;
c3 = 3 - sigma;
alpha1 = 180 - theta;
alpha2 = atand(sigma/c2);
alpha3 = atand(sigma/c3);
beta = 180 - (alpha1+alpha2+alpha3);
o = tan(beta)*sigma;
cbeta = sigma/tand(beta);
z = 1 + o;

% G nominal
num = 2;
den = conv([1 1],[1 3]);
Gn = tf(num,den);
epsilon = -0.1:0.01:0.1;

error = 0;

for i = 1:length(epsilon)

    % G (i)
    num = 2;
    den = conv([1 (1+epsilon(i))],[1 3]);
    G(i) = tf(num,den);


    % control C
    K = 2 + 2*epsilon(i);
    numC =[1 z];
    denC = [1 0];
    C(i) = tf(K*numC,denC);


    Ci = C(i);
    Gi = G(i);

    Gk = feedback(Gi*Ci,1);
    % Gk = Gk(i);

    [mag, phase, omega] = bode(Gk)
    mag = squeeze(mag);  % Remover a dimensão extra
    phase = squeeze(phase);  % Remover a dimensão extra
    omega = squeeze(omega);  % Remover a dimensão extra

    % Agora, podemos combinar os valores em uma matriz
    result = [omega, mag, phase];

    % Exibir o resultado
    disp(result);
end


