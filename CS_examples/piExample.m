clc, clear, close all;

% Plant:
% G(z) = (0.08634z^{-1}-0.02247z^{-2})/(1-0.6773z^{-1}-0.3207z^{-2})

% Specs:
% Sampling quantity: 4000;
% Sampling time: 0.003 s;
% Stop time: 12 s;

% Overshoot Mp < 0.05 (5%);
% Zero steady-state error for step input
% Rise time: 0.5 s;
% Settling-time (2%) < 2.5 s;

% Open-loop
Ts = 0.003;
num_z = [0 0.08634 -0.02247];
den_z = [1 -0.6773 -0.3207];
God = tf(num_z, den_z, Ts);
% Convert the discrete transfer function to a continuous transfer function
Goc = d2c(God, 'zoh');  % Using Zero-order hold (ZOH)
Gc = Kc+KiS

step(God)

% PI controller
Mp = 0.05;
csi = sqrt((log(Mp)^2)/(log(Mp)^2+pi^2)); % damping ratio
t_s = 2.5;
phi_d = 4/t_s;
w_d = phi_d*tan(acos(phi_d));
s1 = -phi_d+1i*w_d;

% PI = k1(s+k2/k1)/s
% PID controller