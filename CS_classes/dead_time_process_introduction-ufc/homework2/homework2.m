% homework1
% specs: G(s) = 2/(3s + 1); C = k*(s+z)/s; Mp = 0.05; ts = 4;
clear; close all; clc;

% Plant variables
nump = [-1 1];                      % plant numerator
denp = [6 5 1];                     % plant denominator
h = 1;                              % plant transport delay
G = tf(nump,denp);                  % plant tf
Gd = tf(nump,denp,'InputDelay',h);  % delayed plant tf

% Uncertainty
wn = 20; csi = 0.25;
numu = wn^2;                        % uncertainty numerator
denu = [1 2*csi*wn wn^2];           % uncertainty denominator
hu = 0.25;                          % uncertainty transport delay
U = tf(numu,denu);                  % uncertainty tf
Ud = tf(numu,denu,'InputDelay',hu); % delayed uncertainty tf

