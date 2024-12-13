% Class_2 = Smith Predictor (Continuous)
clear; close all; clc;

% specs
% G(s) = 2/(3s + 1); C = k*(s+z)/s;
% Mp = 0.05; ts = 4;

% variables
nump = 2;                           % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay

% plant
G = tf(nump,denp);                  % plant tf
Gd = tf(nump,denp,'InputDelay',h);  % delayed plant tf
figure(1), margin(G);               % margin of plant
figure(2), margin(Gs);              % margin of delayed plant

% controller
% by rootlocus, z = 0.9839
% by |C*G| = 1, k = 5.3360
z = 0.9839;                         % controller's zero
k = 5.3360;                         % controller's gain
s = tf('s');                        % Laplace operator
C = k*(s+z)/s;                      % PI controller
Gc = C*G;                           % controlled plant without delay tf

% Simulink file simulation:
% closed loop controlled plant
% closed loop controlled plant with transport delay
% Smith predictor without disturbance
% Smith predictor with disturbance