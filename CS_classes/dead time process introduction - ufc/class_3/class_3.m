clear; close all; clc;

% G(s) = 2/(3s + 1);
% C = k*(s+z)/s;
% Mp = 0.05; ts = 4;

% Plant variables
nump = [0 2];                       % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay
G = tf(nump,denp);                  % plant tf
Gs = tf(nump,denp,'InputDelay',h);  % delayed plant tf

% Smith Predictor variables
% By rootlocus, z = 0.9839
z = 0.9839;                         % controller's zero
% By |C*G| = 1, k = 5.3360
k = 5.3360;                         % controller's gain
s = tf('s');                        % Laplace's operator
C = k*(s+z)/s;                      % PD controller
Gc = C*G;

% Arstein Predictor variables
[A,B,c,D] = tf2ss(nump,denp);       % state-space matrices
I = eye(size(A));                   % identity matrix
% For A−BK to be Hurwitz, 
% K must be greater than -A.
% Thus, we must adjust K.
K = 6.7*(-A);                       % K adjusted
kr = (c*((B*K-A)^(-1))*B)^(-1);     % kr adjusted
