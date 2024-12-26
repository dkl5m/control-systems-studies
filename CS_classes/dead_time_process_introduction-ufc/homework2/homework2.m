% homework1
% specs: G(s) = 2/(3s + 1); C = k*(s+z)/s; Mp = 0.05; ts = 4;
clear; close all; clc;

% Plant variables
nump = [0 2];                       % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay
G = tf(nump,denp);                  % plant tf
Gd = tf(nump,denp,'InputDelay',h);  % delayed plant tf
