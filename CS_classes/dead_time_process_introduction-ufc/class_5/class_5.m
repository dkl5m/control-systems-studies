% Class_5 = Arstein Predictor (Discrete)
clear; close all; clc;

% specs
% G(s) = 2/(3s + 1); C = k*(s+z)/s;
% Mp = 0.05; ts = 4;

% Plant variables
nump = [0 2];                       % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay
G = tf(nump,denp);                  % plant tf
Gs = tf(nump,denp,'InputDelay',h);  % delayed plant tf

% Smith Predictor variables
% By rootlocus, z = 0.9839
% By |C*G| = 1, k = 5.3360
z = 0.9839;                         % controller's zero
k = 5.3360;                         % controller's gain
s = tf('s');                        % Laplace's operator
C = k*(s+z)/s;                      % PD controller
Gc = C*G;                           % controlled plant without delay tf

% Arstein Predictor variables

% C tem que ser unitario
% usar transformacao

[A,B,c,D] = tf2ss(nump,denp);       % state-space matrices
sysc = ss(A,B,c,D);                 % state-space system
I = eye(size(A));                   % identity matrix
% For A−BK to be Hurwitz, 
% K must be greater than -A.
% Thus, we must adjust K.
K = 6.7*(-A);                       % K adjusted
kr = (c*((B*K-A)^(-1))*B)^(-1);     % kr adjusted

% Discrete Arstein Predictor variables
Ts = 0.25;                            % sample time
hd = h/Ts;                            % discrete delay
[sysd,Gd] = c2d(sysc,Ts,'zoh');       % discretize continuous system
[Ad, Bd, Cd, Dd] = ssdata(sysd);      % extract ss matrices
zo = tf('z',Ts);                      % Z transform's operator
Kd = Ad;                              % discrete K adjusted
krd = (Cd*((Bd*Kd-Ad)^(-1))*Bd)^(-1); % discrete kr adjusted

% A eh negativo e Ad positivo
% krd ta dando negativo, oq nao pode
