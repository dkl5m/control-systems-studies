% Class_2 = Smith Predictor (Continuous)
clear; close all; clc;

% specs
% G(s) = 2/(3s + 1); C = k*(s+z)/s;
% Mp = 0.05; ts = 4;

% variables
nump = 2;                           % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay

% plant
G = tf(nump,denp);                  % plant tf
Gd = tf(nump,denp,'InputDelay',h);  % delayed plant tf
figure(1), margin(G);               % margin of plant
figure(2), margin(Gd);              % margin of delayed plant
figure(3), step(G), title('Resposta à entrada em degrau unitário');
legend('planta sem atraso');
figure(4), step(Gd), title('Resposta à entrada em degrau unitário');
legend('planta com atraso');

% controller
% by rootlocus, z = 0.9839
% by |C*G| = 1, k = 5.3360
z = 0.9839;                         % controller's zero
k = 5.3360;                         % controller's gain
s = tf('s');                        % Laplace operator
C = k*(s+z)/s;                      % PI controller
Gc = C*G;                           % controlled plant without delay tf
Hry = C*G/(1+C*G);
figure(5), step(Hry);
legend('planta sem atraso controlada');

% plot sistema com atraso
sim = sim("class_2_simulink.slx");
cl_dp_c = sim.cl_dp_c;
cl_dp_time = sim.cl_dp_time;
cl_dp_u = sim.cl_dp_u;
cl_dp_y = sim.cl_dp_y;

figure(6);
plot(cl_dp_time, cl_dp_u, '--k', 'LineWidth', 1.2), hold on;
plot(cl_dp_time, cl_dp_c, 'b', 'LineWidth', 1.2);
plot(cl_dp_time, cl_dp_y, 'r', 'LineWidth', 1.2);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com atraso e PI'), hold off;


% plot PS sem perturbacao
sp_c = sim.sp_c;
sp_u = sim.sp_u;
sp_y = sim.sp_y;

figure(7);
plot(cl_dp_time, sp_u, '--k', 'LineWidth', 1.4), hold on;
plot(cl_dp_time, sp_c, 'b', 'LineWidth', 1.4);
plot(cl_dp_time, sp_y, 'r', 'LineWidth', 1.4);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com SP'), hold off;

% plot PS com perturbacao
sp_c1 = sim.sp_c1;
sp_u1 = sim.sp_u1;
sp_y1 = sim.sp_y1;

figure(8);
plot(cl_dp_time, sp_u1, '--k', 'LineWidth', 1.7), hold on;
plot(cl_dp_time, sp_c1, 'b', 'LineWidth', 1.7);
plot(cl_dp_time, sp_y1, 'r', 'LineWidth', 1.7);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com SP e perturbações'), hold off;

% Simulink file simulation:
% closed loop controlled plant
% closed loop controlled plant with transport delay
% Smith predictor without disturbance
% Smith predictor with disturbance