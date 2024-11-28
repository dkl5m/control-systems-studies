clc; clear; close all;

% Parametros
MP = 0.05;                                      % max overshoot
zeta = 0.7;                                     % damping ratio
sigma = 0.75;            
t5 = 3/sigma;                                   % tempo acomodacao 5%
theta = acosd(zeta);
