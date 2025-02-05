clc; clear; close all;

% 1 e 2)

s = tf('s');
num = s+4;
den = (s-1)*(s+5)*(s+10);
G = num/den;

% sisotool(G);

k = 52.026; z = 1;
C = (k*(s+z))/s;
C1 = (k*z)/s;

% 3 e 4)
k2 = 6.5725; z2 = 1;
z3 = 5.935;
C2 = (k2*(s+z2)*(s+z3))/s;
% Ti = 1/(z2+z3);
% Td = 1;
% C2 = k2*(1+1/(Ti*s)+Td*s);
% C3 = k2/(Ti*s);
% C4num = k2*(1+Td*s);
% C4den = 1;
