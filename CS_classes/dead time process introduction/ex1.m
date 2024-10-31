clear; close; clc;

% 2/((s+1)(s+3))
% max overshoot = 5%
% e = 0;
% Cs = Kc(s+a)/s
% sd = -2 + 2.73j
% zeta = 0.7
% sigma = 0.75
% theta = 45 deg
% ang(Cs)+ang(G) = 180

num = 2;
den = conv([1 1],[1 3]);

MP = 0.05;              % max overshoot
zeta = 0.7;             % damping ratio
sigma = 0.75;           % 
t5 = 3/sigma;           % tempo acomodacao 5%

theta = acosd(zeta);
alpha1 = 180 - theta;
alpha2 = atand(sigma/0.25);
alpha3 = atand(sigma/2.25);
beta = 180 - (alpha1+alpha2+alpha3);
z = 1.5;

d1 = 1.06;
dp = d1;
d2 = 0.82;
d3 = 2.37;
K = (d1*d2*d3)/dp;

