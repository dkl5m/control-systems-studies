clear; close all; clc;

% G(s) = 2/(3s + 1);
% C = k*(s+z)/s;
% Mp = 0.05; ts = 4;

nump = 2;                           % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay
G = tf(nump,denp);                  % plant tf
Gs = tf(nump,denp,'InputDelay',h);  % delayed plant tf
% figure(1), margin(G);
% figure(2), margin(Gs);

% By rootlocus, z = 0.9839
z = 0.9839;                         % controller zero
% By |C*G| = 1, k = 5.3360
k = 5.3360;                         % controller gain
s = tf('s');                        % Laplace operator
C = k*(s+z)/s;                      % PD controller
Gc = C*G;

