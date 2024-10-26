%%
%   2. Projete um compensador avanço de fase para o controle de posição do 
%   motor CC da Figura 1. Considere os seguintes parâmetros de
%   implementação: Pelo método do lugar das raízes, overshoot 17% e tempo
%   de estabilização em 95% de 6s. Utilizando projeto na frequência
%   considere Kc=4 e overshoot de 17%. Despreze para o projeto da
%   frequência ao abono de 5º para este projeto. Realize uma análise
%   comparativa entre as curvas de excitação ao degrau e mostre qual destes
%   tem o melhor resultado usando índices de desempenho IAE, ISE, ITSE,
%   respostas no tempo e na frequencia.

clc; close; clear; clf;

% PARAMETROS MOTOR CC EXCITACAO SERIE
La = 100*10^(-3);   % indutancia armadura
Lf = La;            % indutancia enrolamento de campo
Ra = 0.5;           % resistencia enrolamento
Rf = Ra;            % resistencia campo
Ka = 0.2;           % constante inercia da armadura/torque
J = 1;              % momento inercia motor
B = 1;              % constante amortecimento carga
Mp = 17;            % overshoot
Ts = 6;             % Tempo de estabilizacao em 95%

% PARAMETROS PLANTA
num1 = Ka;
den1 = conv([J B], [1 0]);
den1 = conv(den1, [La+Lf Ra+Rf]);
Gs1  = tf(num1, den1);
% variaveis simulink
num_i       = 1;
den_i       = [(La+Lf) (Ra+Rf)];
num_v       = 1;
den_v       = [J B];


figure(1);
bode(Gs1);
margin(Gs1);
[Gm, PM, wgc, wpm]  = margin(Gs1);           % margin p/ valores criticos
Kcr                 = Gm;
Pcr                 = 2*pi/wgc;


% LGR
% CALCULO: zeta, wn e s1
zeta1    = sqrt((log(Mp/100)^2)/(log(Mp/100)^2+pi^2));
wn1      = 3/(zeta1*Ts);
s1       =-zeta1*wn1 +1i*wn1*sqrt(1-zeta1^2);

% CALCULO G(s1)
ng1      = polyval(num1,s1);
dg1      = polyval(den1,s1);
gp1      = ng1/dg1;
Re_s1   = real(s1);
Im_s1   = imag(s1);

% PARAMETROS CONTROLADOR
phi1     = (180/pi)*angle(s1);
phi_c1   = 180-(180/pi)*angle(gp1);               % Parametro phi
theta_p1 = (phi1-phi_c1)/2;                       % Theta do polo
theta_z1 = (phi1+phi_c1)/2;                       % Theta do zero
p_c1     = Re_s1-(Im_s1/tan((pi/180)*theta_p1));  % Polo
z_c1     = Re_s1-(Im_s1/tan((pi/180)*theta_z1));  % Zero

% CALCULO Gc(s1)
nk1 = polyval([1 -z_c1], s1);
dk1 = polyval([1 -p_c1], s1);
k1 = nk1/dk1;
K1 = abs(1/(k1*gp1));                             % encontra K

% Controlador LGR
Gc1=zpk(z_c1,p_c1,K1);
Gp1=tf(num1,den1);
Tgp1= feedback(Gp1,1);
gk1=series(Gc1,Gp1);
T1=feedback(gk1,1);
figure(1)
step(T1,Tgp1), legend('Compensado LGR','Não compensado')


% PROJETO NA FREQUENCIA
Kc = 4;                             % Valor Kc
num2 = Ka;                          % Define numerator of G(s)
den2 = conv([J B], [1 0]);
den2 = conv(den2, [La+Lf Ra+Rf]);   % Define denominator of G(s)
G2    = tf(num2, den2);             % Create G(s)
[Gm2,Pm2,wgc2,wgp2]=margin(Kc*G2);  % Calculate gain margin and bode phase

z2    = 0.55;
dpm  = atand(2*z2/sqrt(-2*z2^2+sqrt(1+4*z2^4)));
                                    % Determine dpm from zeta z
dif  = dpm - Pm2;                     
phi2  = dif*pi/180;                  % Difference between gain margins
alfa2 = (1+sin(phi2))/(1-sin(phi2));
T2    = 1/(sqrt(alfa2)*wgc2);
nk2   = [alfa2*T2 1];
dk2   = [T2 1];

% Controlador
w=logspace(-1,2,100); % define o vetor de dados na forma logarítmica
Gc2  = tf(Kc*nk2,dk2);
Gp2  = tf(num2,den2);
Tgp2 = feedback(Gp2,1);
gk2  = series(Gc2,Gp2);
T2   = feedback(gk2,1);
figure(2)
step(T2,Tgp2), legend('Compensado FREQUÊNCIA','Não compensado')
% figure(3)
% bode(gk2,Gp2,w), legend('Comp FREQUENCIA','N Comp')
figure(3)
step(T1,Tgp1,T2), legend('Compensado LGR','Não compensado',...
    'Compensado FREQUÊNCIA')

figure(4)
rlocus(Tgp1)
figure(5)
rlocus(T2)
figure(6)
bode(T1,Tgp1,T2), legend('Compensado LGR','Não compensado',...
    'Compensado FREQUÊNCIA')

figure(7)
Kq1=2;
A1=Kq1*Gs1/(1+Kq1*Gs1);
Kq2=8;
A2=Kq2*Gs1/(1+Kq2*Gs1);
A3=Gs1/(1+Gs1);

step(A1,A2,A3), legend('K=2','K=8','Não compensado')

% SIMULACAO SIMULINK
mdl     = "q2simulink";
open_system(mdl)
sim("q2simulink")


% INDICES DE DESEMPENHO
% Extrair dados gerados por 'To workspace'
tout    = ans.tout1;
e1      = ans.e1;
e2      = ans.e2;
dt      = diff(tout);
% ISE
ISE1    = (e1(1:end-1).*e1(1:end-1))'*dt;
ISE2    = (e2(1:end-1).*e2(1:end-1))'*dt;
% IAE
IAE1    = abs(e1(1:end-1))'*dt;
IAE2    = abs(e2(1:end-1))'*dt;
% ITSE
ITSE1   = (tout(1:end-1).*(e1(1:end-1).*e1(1:end-1)))'*dt;
ITSE2   = (tout(1:end-1).*(e2(1:end-1).*e2(1:end-1)))'*dt;