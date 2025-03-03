% homework2
clear; close all; clc;

% Replicate:
% Simplified filtered Smith predictor for high-order dead-time processes

% Ex1
% Stable dead-time process model
% P(s) = (−s + 1)*exp(-s)/(3s + 1)(2s + 1);
% Model uncertainty
% Pr(s) = P(s) * wn^2*exp(-0.25*s)/(s^2+2*csi*wn*s+wn^2)
wn = 20; csi = 0.25; % 25% dead-time uncertainty
% Multiplicative uncertainty
dP = (wn^2*exp(-0.25*s)/(s^2+2*csi*wn*s+wn^2))-1;
Ts = 0.1; % sampling time
% P(z) = (-0.0152*(z-1.1054)/((z-0.9672)*(z-0.9512)))*z^(-10);







% % Plant variables
% nump = [-1 1];                      % plant numerator
% denp = [6 5 1];                     % plant denominator
% h = 1;                              % plant transport delay
% G = tf(nump,denp);                  % plant tf
% Gd = tf(nump,denp,'InputDelay',h);  % delayed plant tf
% 
% % Uncertainty
% wn = 20; csi = 0.25;
% numu = wn^2;                        % uncertainty numerator
% denu = [1 2*csi*wn wn^2];           % uncertainty denominator
% hu = 0.25;                          % uncertainty transport delay
% U = tf(numu,denu);                  % uncertainty tf
% Ud = tf(numu,denu,'InputDelay',hu); % delayed uncertainty tf
% 
