clc; clear; close all;

% "Open-Loop System"
%   plant G(s) = 2 / (3s + 1)
numeratorPlant = 2;
denomitorPlant = [3 1];
plant = tf(numeratorPlant, denominatorPlant);

%   step-response
t = 0:0.01:45;                                  % time vector in seconds
step(plant,t);

% "Closed-Loop System"
%   performance specs
tr = 3;                                         % rise time in seconds
Mp = 0.05;                                      % maximum overshoot
referenceValue = 1.3;
zeta = -log(Mp) / sqrt(pi^2 + (log(Mp))^2);     % damping ratio
wn = 1.8 / tr;                                  % natural frequency

%   PID control
Kp = (2*zeta*wn - 1/3) * 3/2;
Ki = wn^2 * 3/2;
Kd = (2*zeta*wn*3/2 - Kp*3) / (2*wn);

% sigma = 0.75;            
% t5 = 3/sigma;                                   % tempo acomodacao 5%
% theta = acosd(zeta);