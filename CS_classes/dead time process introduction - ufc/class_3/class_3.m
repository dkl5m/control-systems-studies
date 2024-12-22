% Class_3 = Arstein Predictor (Continuous)
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
% by rootlocus, z = 0.9839
% by |C*G| = 1, k = 5.3360
z = 0.9839;                         % controller's zero
k = 5.3360;                         % controller's gain
s = tf('s');                        % Laplace's operator
C = k*(s+z)/s;                      % PD controller
Gc = C*G;                           % controlled plant without delay tf

% Arstein Predictor variables
[A,B,c,D] = tf2ss(nump,denp);       % state-space matrices
I = eye(size(A));                   % identity matrix
% For A−BK to be Hurwitz
% Thus, we must adjust K.

% C~=1. output-state relationship must be one. 
% Transformation is needed, where T is a matrix that make C=1. So:
T = 1/c;
Aprime = T^(-1)*A*T;
Bprime = T^(-1)*B;
Cprime = c*T;
Dprime = D;

K = 6*(-A);                       % K adjusted
kr = (Cprime*((Bprime*K-Aprime)^(-1))*Bprime)^(-1);     % kr adjusted

sim = sim("class_3_simulink.slx");
ap_time = sim.ap_time;
ap_c = sim.ap_c;
ap_u = sim.ap_u;
ap_y = sim.ap_y;

% plot AP com perturbacao
figure(6);
plot(ap_time, ap_u, '--k', 'LineWidth', 1.4), hold on;
plot(ap_time, ap_c, 'b', 'LineWidth', 1.4);
plot(ap_time, ap_y, 'r', 'LineWidth', 1.4);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com AP'), hold off;

ap_c1 = sim.ap_c1;
ap_u1 = sim.ap_u1;
ap_y1 = sim.ap_y1;

% plot AP com perturbacao
figure(7);
plot(ap_time, ap_u1, '--k', 'LineWidth', 1.4), hold on;
plot(ap_time, ap_c1, 'b', 'LineWidth', 1.4);
plot(ap_time, ap_y1, 'r', 'LineWidth', 1.4);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com AP e perturbações'), hold off;
