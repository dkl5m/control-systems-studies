% Script para simulação do exemplo 2
% do artigo da Radmila
clear all, close all, clc

% PI
Ln=0.5;
lambda=0.3;
L=Ln+0.3*Ln;
a=0;
b=1;

Kp=1.0646;
Ki=0.4830;

% SFSP
%K=2;
%k=0.8;
K=1.2;

Kr=K;
p=[7.4970    2.2564    0.0983];
alphal=polyval(p,lambda);

alpha=Ln*alphal;

alpha2=alp(a,b,L,lambda,K);
% alpha = 0.4;

% Parâmetros do Filtro
b2=K;
b1 = (1+(alpha+Ln)*b*K)/b;

% Índices de Robustez
W=logspace(-3,3,600);
w = 1j*W;
MdP=abs(exp(-lambda*Ln*w)-1); % Incerteza multiplicativa
% MdP=abs((2.*sin(w.*lambda./2)).*(cos(lambda.*w/2)+j.*sin(lambda.*w./2)));
%MdP = abs(2*sin(W*lambda/2));
MIr1=abs((w+K*b)./(b*(b1*w+b2)./(alpha*w+1))); % Índice Bismark
MIr2=abs((w.^2+Kp*w+Ki)./(Kp*w+Ki)); % Índice Radmilla

sim radmila.slx;

% tempo=ans.tout;
tout=ans.tout;
y=ans.y;
y1=ans.y1;
u=ans.u;
u1=ans.u1;
e=ans.e;
e1=ans.e1;

 figure(1)
 
 subplot(211)
 plot(tout,y,'b--',tout, y1,'r-', 'LineWidth',2)
 title('Saída')
 ylabel('y')
 grid

 subplot(212)
 plot(tout,u,'b--',tout, u1,'r-', 'LineWidth',2)
 title('Sinal de controle')
 ylabel('u')
 legend('PI','SFSP')
 xlabel('tempo (s)')
 grid

figure(2)
plot(tout,e,'b--',tout, e1,'r-', 'LineWidth',2)
title('Error Signal')
ylabel('e')
xlabel('time (s)')
legend('Benchmark','Proposed')
grid

figure(3) 
loglog(W,MdP,'k--', 'LineWidth',2);%bode(Ir1,Ir2,'r',dP,'k--',w);grid;
hold on
loglog(W,MIr2,'b', 'LineWidth',2);
hold on
% loglog(W,Mdp2,'g', 'LineWidth',2);
% hold on
loglog(W,MIr1,'r', 'LineWidth',2);
xlabel('\omega(rad/s)');
ylabel('Magnitude (dB)');
legend('\delta P','PI','SFSP');grid

% Índices

[~,n]=min(abs(tout-30));
tout=tout(n:end);
dt=diff(tout);
e=e(n:end);
e1=e1(n:end);


ISE1=(e(1:end-1).*e(1:end-1))'*dt;
ISE2=(e1(1:end-1).*e1(1:end-1))'*dt;

ISE1
ISE2

IAE1=abs(e(1:end-1))'*dt;
IAE2=abs(e1(1:end-1))'*dt;

IAE1
IAE2

ITAE1=(tout(1:end-1).*abs(e(1:end-1)))'*dt;
ITAE2=(tout(1:end-1).*abs(e1(1:end-1)))'*dt;

ITAE1
ITAE2

ITSE1=(tout(1:end-1).*(e(1:end-1).*e(1:end-1)))'*dt;
ITSE2=(tout(1:end-1).*(e1(1:end-1).*e1(1:end-1)))'*dt;

ITSE1
ITSE2
% min(d)