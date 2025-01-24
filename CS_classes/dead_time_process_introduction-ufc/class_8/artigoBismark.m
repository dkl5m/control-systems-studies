clc; clear; close all;

% sfsp unstable process example

numG = [0 3.433]; % process numerator
denG = [101.1 -1]; % process denominator
dn = 20; % dead time

tsim = 800; % sampling time
Ts = 0.5; % sampling period
d = dn/Ts; % discrete sampling period
Gz = c2d(tf(numG,denG),Ts); % discretized TF
numGz = cell2mat(Gz.Numerator); % Gz numerator
denGz = cell2mat(Gz.Denominator); % Gz denominator

% discrete model parameters in article
% a1 = 1.00486; b0 = 0.016689; d = 40;
% zc = 0.9753; Cz = 1.7678; Fz = 0.83522;
a1 = -denGz(2);
b0 = numGz(2);

% F(z) = reference filter to improve the set-point response
% Fr(z) = prediction filter that improves the predictor properties
% Gn(z) = dead-time-free model
% dn = nominal discrete dead time
% Pn(z) = Gn(z)z^-dn; nominal process discretized with ZOH

tau = 20; 
zc = exp(-Ts/tau);
Cz = (a1-zc)/b0; % kc = Cz
Fz = (1-zc)/(a1-zc); % kr = Fz
alpha = 0.977;
b1 = (1/(1-a1))*((1-alpha)^2*Fz-(a1^(d-1))*(a1-alpha)^2);
b2 = (1/(a1-1))*(a1*(1-alpha)^2*Fz-(a1^(d-1))*(a1-alpha)^2);

numFr = [b1 b2 0];
denFr = [1 -2*alpha alpha^2];
Frz = tf(numFr, denFr, Ts);
% numFrz = cell2mat(Frz.Numerator);
% denFrz = cell2mat(Frz.Denominator);

z = tf('z',Ts);
Sz = Gz*(1-z^(-d)*Frz);
numSz = cell2mat(Sz.Numerator);
denSz = cell2mat(Sz.Denominator);

simulation = sim('untitled.slx');
t = simulation.tout;
U1 = simulation.U1.data;
Y1 = simulation.Y1.data;
U2 = simulation.U2.data;
Y2 = simulation.Y2.data;

figure(1), hold on,
plot(t,Y1,'Color','r','LineWidth',2,'LineStyle','-');
grid on, xlabel('t(s)'), ylabel('y'), title('Output');
plot(t,Y2,'Color','b','LineWidth',1);
hold off;

figure(2), hold on,
plot(t,U1,'Color','r','LineWidth',2,'LineStyle','-');
grid on, xlabel('t(s)'), ylabel('u'), title('Control');
plot(t,U2,'Color','b','LineWidth',1);
hold off;