% homework1
% specs: G(s) = 2/(3s + 1); C = k*(s+z)/s; Mp = 0.05; ts = 4;
clear; close all; clc;

% Plant variables
nump = [0 2];                       % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay
G = tf(nump,denp);                  % plant tf
Gd = tf(nump,denp,'InputDelay',h);  % delayed plant tf

% Smith Predictor variables
% by rootlocus, z = 0.9839
% by |C*G| = 1, k = 5.3360
z = 0.9839;                         % controller's zero
k = 5.3360;                         % controller's gain
s = tf('s');                        % Laplace's operator
C = k*(s+z)/s;                      % PD controller
Gc = C*G;                           % controlled plant without delay tf
Hry = C*G/(1+C*G);                  % closed-loop without delay

% Plant plots
figure(1), margin(G);               % margin of plant
figure(2), margin(Gd);              % margin of delayed plant
figure(3), step(G), title('Resposta à entrada em degrau unitário');
legend('planta sem atraso');
figure(4), step(Hry), title('Resposta à entrada em degrau unitário');
legend('planta sem atraso controlada');
figure(5), step(Gd), title('Resposta à entrada em degrau unitário');
legend('planta com atraso');

% Arstein Predictor variables
[A,B,c,D] = tf2ss(nump,denp);       % state-space matrices
I = eye(size(A));                   % identity matrix
% For A−BK to be Hurwitz. Thus, we must adjust K.
% C~=1. output-state relationship must be one. 
% Transformation is needed, where T is a matrix that make C=1. So:
T = 1/c;
Aprime = T^(-1)*A*T;
Bprime = T^(-1)*B;
Cprime = c*T;
Dprime = D;
K = 6*(-A);                                         % K adjusted
kr = (Cprime*((Bprime*K-Aprime)^(-1))*Bprime)^(-1); % kr adjusted

% Filtered Smith Predictor variables
tau = 1.5;
Tf = 2;
Tn = 3;
Tr = 1.5;           % constante tempo desejada em malha fechada
beta = (1-exp(-h/Tn)*(1-Tf/Tn)^2)*Tn;
F1 = tf( conv([Tr 1],[beta 1]), conv([tau 1],[tau 1]));

% SIMULINK VARS
% calling simulink variables
sim = sim("homework1.slx");
% closed-loop with delay
cl_dp_time = sim.cl_dp_time;
cl_dp_c = sim.cl_dp_c;
cl_dp_u = sim.cl_dp_u;
cl_dp_y = sim.cl_dp_y;
% SP without disturbance
sp_c = sim.sp_c;
sp_u = sim.sp_u;
sp_y = sim.sp_y;
% SP with disturbance
sp_c1 = sim.sp_c1;
sp_u1 = sim.sp_u1;
sp_y1 = sim.sp_y1;
% AP without disturbance
ap_c = sim.ap_c;
ap_u = sim.ap_u;
ap_y = sim.ap_y;
% AP with disturbance
ap_c1 = sim.ap_c1;
ap_u1 = sim.ap_u1;
ap_y1 = sim.ap_y1;
% FSP without disturbance
fsp_u = sim.fsp_u;
fsp_c = sim.fsp_c;
fsp_y = sim.fsp_y;
% FSP with disturbance
fsp_u1 = sim.fsp_u1;
fsp_c1 = sim.fsp_c1;
fsp_y1 = sim.fsp_y1;

% PLOTS
% plot closed-loop with delay
figure(6);
plot(cl_dp_time, cl_dp_u, '--k', 'LineWidth', 1.2), hold on;
plot(cl_dp_time, cl_dp_c, 'b', 'LineWidth', 1.2);
plot(cl_dp_time, cl_dp_y, 'r', 'LineWidth', 1.2);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com atraso e PI'), hold off;
% plot SP without disturbance
figure(7);
plot(cl_dp_time, sp_u, '--k', 'LineWidth', 1.4), hold on;
plot(cl_dp_time, sp_c, 'b', 'LineWidth', 1.4);
plot(cl_dp_time, sp_y, 'r', 'LineWidth', 1.4);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com SP'), hold off;
% plot SP with disturbance
figure(8);
plot(cl_dp_time, sp_u1, '--k', 'LineWidth', 1.7), hold on;
plot(cl_dp_time, sp_c1, 'b', 'LineWidth', 1.7);
plot(cl_dp_time, sp_y1, 'r', 'LineWidth', 1.7);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com SP e perturbações'), hold off;
% plot AP without disturbance
figure(9);
plot(cl_dp_time, ap_u, '--k', 'LineWidth', 1.4), hold on;
plot(cl_dp_time, ap_c, 'b', 'LineWidth', 1.4);
plot(cl_dp_time, ap_y, 'r', 'LineWidth', 1.4);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com AP'), hold off;
% plot AP with disturbance
figure(10);
plot(cl_dp_time, ap_u1, '--k', 'LineWidth', 1.4), hold on;
plot(cl_dp_time, ap_c1, 'b', 'LineWidth', 1.4);
plot(cl_dp_time, ap_y1, 'r', 'LineWidth', 1.4);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com AP e perturbações'), hold off;
% plot FSP without disturbance
figure(1);
plot(cl_dp_time, fsp_u, '--k', 'LineWidth', 1.7), hold on;
plot(cl_dp_time, fsp_c, 'b', 'LineWidth', 1.7);
plot(cl_dp_time, fsp_y, 'r', 'LineWidth', 1.7);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com FSP'), hold off;
% plot FSP with disturbance
figure(2);
plot(cl_dp_time, fsp_u1, '--k', 'LineWidth', 1.7), hold on;
plot(cl_dp_time, fsp_c1, 'b', 'LineWidth', 1.7);
plot(cl_dp_time, fsp_y1, 'r', 'LineWidth', 1.7);
title('Resposta à entrada em degrau unitário');
legend('referência','sinal de controle','g(s) com FSP e perturbações'), hold off;


T_sp = sp_y1/sp_u1;
T_fsp = fsp_y1/fsp_u1;

% Compute and compare gain and phase margins for both systems
% [GM_sp, PM_sp, Wcg_sp, Wcp_sp] = margin(T_sp);
% [GM_fsp, PM_fsp, Wcg_fsp, Wcp_fsp] = margin(T_fsp);
[GM_sp, PM_sp, Wcg_sp, Wcp_sp] = margin(T_sp);
[GM_fsp, PM_fsp, Wcg_fsp, Wcp_fsp] = margin(T_fsp);
% Display results
disp('Smith Predictor Robustness:');
disp(['Gain Margin: ', num2str(GM_sp)]);
disp(['Phase Margin: ', num2str(PM_sp)]);

disp('Filtered Smith Predictor Robustness:');
disp(['Gain Margin: ', num2str(GM_fsp)]);
disp(['Phase Margin: ', num2str(PM_fsp)]);

% Plot Bode plots for both systems
figure;
subplot(2,1,1);
bode(T_sp);
title('Smith Predictor Bode Plot');
grid on;

subplot(2,1,2);
bode(T_fsp);
title('Filtered Smith Predictor Bode Plot');
grid on;
