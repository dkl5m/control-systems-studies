clear; close; clc;

% 2/((s+1)(s+3))
% max overshoot = 5%
% e = 0;
% tempo acomodacao = 4s
% Cs = Kc(s+a)(s+b)/s(s+30)
% sd = -2 + 2.73j
% zeta = 0.7
% sigma = 0.75
% theta = 45 deg
% ang(Cs)+ang(G) = 180

num = 2;
den = conv([1 1],[1 3]);
rlocus(num,den);
