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
C2 = pid(C2);
Kp = C2.Kp;
Ki = C2.Ki;
Kd = C2.Kd;
tau_d = 0.01;
C2pid = Kp + Ki/s + Kd*s;
k2 = Kp;
Ti = k2/Ki;
Td = Kd/k2;
C3 = k2/(Ti*s);
C4 = k2*(1+Td*s)/(tau_d*s+1);