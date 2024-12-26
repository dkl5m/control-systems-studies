% Class_6 = Filtered Smith Predictor (Discrete)
clear; close all; clc;

% specs
% G(s) = 2/(3s + 1); C = k*(s+z)/s;
% Mp = 0.05; ts = 4;

% Plant variables
nump = 2;                           % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay
G = tf(nump,denp);                  % plant tf
Gd = tf(nump,denp,'InputDelay',h);  % delayed plant tf

% Smith Predictor variables
% By rootlocus, z = 0.9839
% By |C*G| = 1, k = 5.3360
z = 0.9839;                         % controller zero
k = 5.3360;                         % controller gain
s = tf('s');                        % Laplace operator
C = k*(s+z)/s;                      % PD controller
Gc = C*G;                           % controlled plant without delay tf

% Filtered Smith Predictor variables
