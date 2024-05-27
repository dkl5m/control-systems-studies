% Questao 4 - enunciado
% Implemente em Matlab a reposta ao degrau do modelo do conversor Buck
% 10V-5V, 2,5W-25W, 100KHz para os seguintes parâmetros: C=100uF, L=100uH,
% Rc=0,5 ohms, referência de saída 5V. Considere uma comparação com um
% compensador tipo PID avanço-atraso de fase por LGR para os seguintes
% parâmetros de projeto: overshoot 5% e tempo de estabilização 98% de 1ms.
% Lembrando que o modelo do PID avanço-atraso proposto é definido por
%        𝐼𝐷 = 𝐾𝑃 + 𝐾𝐼/𝑠 + 𝐾𝐷 𝑠 = 𝐾(𝑠 + 𝑎)(𝑠 + 𝑏)/s               (1)
% Projete um compensador avanço-atraso na frequência do tipo
%        𝑐(𝑠) = 𝐾𝑐*(𝛼1𝑇1𝑠 + 1)/(T1𝑠 + 1)*( 𝛼2𝑇2𝑠 + 1)/(T2𝑠 + 1)   (2)
% em que 𝛼 e 𝛽 são constantes de compensação avanço-atraso respectivamente,
% 𝑇1, 𝑇2 são constantes de tempo de ajuste na frequência. Implemente tal
% circuito no simulink usando circuitaria do simscape incluindo a
% configuração do compensador avanço atraso de fase conforme livro do Ogata
% tanto para configuração PID como para o compensador na frequencia.
% Realize uma análise comparativa entre as curvas de excitação ao degrau e
% mostre qual destes tem o melhor resultado usando índices de desempenho
% IAE, ISE, ITSE, respostas no tempo e na frequencia.

close all, clear all, clc

clc;close;clear;
% Parametros conversor buck
Vi = 10;        % Tensao de entrada (V)
Vo = 5;         % Tensao de saída (V)
Po = 2.5;       % Potência de saída (W)
L = 100e-6;     % Indutância (H)
C = 100e-6;     % Capacitância (F)
Rc = 0.5;       % Resistência serie capacitor (ohms)
f = 100e3;      % Frequência de comutação (Hz)
d = Vo/Vi;
pos = 10;       % Percentual overshoot
Ts = 1e-3;      % Tempo de estabilizacao 98%
Ro = Vo^2/Po;
Rl = 0;

num=d*[Rc*C 1];
a1=1/(Ro*C)+Rc/L;
den=[L*C L*C*a1 1];

G=tf(num,den);

% [A,B,C,D]=tf2ss(num,den);

 


% CALCULO: zeta, wn e s1
z=-log(pos/100)/sqrt(pi^2+(log(pos/100))^2);
wn=4/(z*Ts);              % Calcula a frequência natural
s1=-z*wn+j*wn*sqrt(1-z*z) % Polo desejado


% Parametros controlador
% CALCULO: G(s1)
% Controlador LGR
ng=polyval(num,s1);
dg=polyval([den 0],s1);
gp=ng/dg;
Re_s1=real(s1)
Im_s1=imag(s1)
fi=(180/pi)*angle(s1)
fic = 180 - (180/pi)*angle(gp)
teta_av = 0.5*(fic + fi)
teta_at = 0.5*(fic - fi)

zc1=Re_s1-(Im_s1/tan((pi/180)*teta_av))
zc2=Re_s1-(Im_s1/tan((pi/180)*teta_at))

nk1=polyval(conv([1 -zc1],[1 -zc2]),s1);
dk1=polyval([1 0],s1);
k1=nk1/dk1;
K=abs(1/(k1*gp)) %determinação do K
Gc=K*tf(conv([1 -zc1],[1 -zc2]),[1 0]);

npid = conv([1 -zc1],[1 -zc2]);
Kp = npid(2)
Ki = npid(3)
Kd = npid(1)

gk=series(Gc,G);
T=feedback(gk,1);


figure(1)
step(T)
grid
title('Resposta ao Degrau Compensada com PID Avanço Atraso de Fase')       


% Controlador FREQUENCIA

Pmreq=atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi);
                                    % Calcula a margem de fase requerida.
             
                                    % requerida.
wBW=wn*sqrt((1-2*z^2)+sqrt(4*z^4-4*z^2+2));
                                    % Determina a faixa de passagem
                                    % requerida.
wpm=0.8*wBW;                        % Escolhe nova frequência de
                                    % margem de fase.
Kc=198;%(1/0.01-1)/dcgain(G);
                                    
[M,P]=bode(Kc*G,wpm);               % Obtém dados de Bode.
Pmreqc=Pmreq-(180+P+5);             % Obtém a contribuição de fase
                                    % requerida do compensador de avanço
                                    % de fase com 5 graus adicionais.
beta=(1-sin(Pmreqc*pi/180))/(1+sin(Pmreqc*pi/180));
                                    % Obtém beta.	
                                    % Projeta o zero, o polo e o ganho do
                                    % compensador de atraso de fase.
zcatr=wpm/10;                       % Calcula o zero do compensador
                                    % de atraso de fase.
pcatr=zcatr*beta;                   % Calcula o polo do compensador
                                    % de atraso de fase.
Kcatr=beta;                         % Calcula o ganho do compensador
                                    % de atraso de fase.
'Compensador de atraso de fase, Gatr(s)'
                                    % Exibe o título.
Gatr=tf(Kcatr*[1 zcatr],[1 pcatr]); % Cria o compensador de atraso de fase.
Gatr=zpk(Gatr)                      % Converte Gatr(s) para a
                                    % forma fatorada e exibe.
                                    % Projeta o zero, o polo e o ganho do
                                    % compensador de avanço de fase.
zcavan=wpm*sqrt(beta);              % Calcula o zero do compensador
                                    % de avanço de fase.
pcavan=zcavan/beta;                 % Calcula o polo do compensador
                                    % de avanço de fase.
Kcavan=1/beta;                      % Calcula o ganho do compensador
                                    % de avanço de fase.
'Compensador de avanço de fase'     % Exibe o título.
Gavan=tf(Kcavan*[1 zcavan],[1 pcavan]);
                                    % Cria o compensador de avanço de fase.
Gavan=zpk(Gavan)                    % Converte Gavan(s) para a
                                    % forma fatorada e exibe.
'Ge(s) Compensada com Avanço e Atraso de Fase'
                                    % Exibe o título.
Ge2=Kc*G*Gatr*Gavan                 % Cria o sistema compensado,
                                    % Ge(s)=G(s)Gatr(s)Gavan(s).
% sGe=s*Ge;                         % Cria sGe(s).
% sGe=minreal(sGe);                 % Cancela fatores comuns.
% Kv=dcgain(sGe)                    % Calcula Kv.
T2=feedback(Ge2,1);                 % Obtém T(s).

figure(2)
step(T2,2e-3)                       % Gera a resposta ao degrau
                                    % compensada com avanço e atraso                                    
                                    % de fase em malha fechada.
title('Resposta ao Degrau Compensada com Avanço e Atraso de Fase')       
                                    % Adiciona um título à resposta ao
                                    % degrau do sistema compensado com
                                    % avanço e atraso de fase.

 sim 'q4conversor';

t=linspace(0,4e-3,40001);
dt=diff(t)';

e1=ans.erro;
% ISE
ISE1=(e1(1:end-1).*e1(1:end-1))'*dt;
% ISE2=(e2(1:end-1).*e2(1:end-1))'*dt;

% IAE
IAE1=abs(e1(1:end-1))'*dt;
% IAE2=abs(e2(1:end-1))'*dt;

% ITSE
ITSE1=(t(1:end-1).*(e1(1:end-1).*e1(1:end-1)))'*dt;
% % ITSE2=(tout(1:end-1).*(e2(1:end-1).*e2(1:end-1)))'*dt;