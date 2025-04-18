% Class_6 = Filtered Smith Predictor (Discrete)
clear; close all; clc;

% specs
% G(s) = 2/(3s + 1); C = k*(s+z)/s;
% Mp = 0.05; ts = 4;

% Plant variables
Ts = 0.05;                          % sample time
s = tf('s');                        % Laplace operator
G = 2/(3*s+1);                      % nominal plant tf
h = 6.5;                            % delay
L = exp(-h*s);

% Smith Predictor variables
% By rootlocus, z = 0.9839
% By |C*G| = 1, k = 5.3360
z = 0.9839;                         % controller zero
k = 5.3360;                         % controller gain
C = k*(s+z)/s;                      % PD controller
Gc = C*G;                           % controlled plant without delay tf
Fr = 1/((h/100)*s+1);               % FSP filter try

% discretization
Gz = c2d(G,Ts);                     % discretize nominal plant tf
Cz = c2d(C,Ts);                     % discretize controller
Frz = c2d(Fr,Ts);                   % discretize FSP filter
Lz = c2d(L,Ts);                     % discretize delay

% simulation parameters
Tref = 1;
initialreferencevalue = 0;
finalreferencevalue = 1;
Tdisturbance = 8;
initialdisturbancevalue = 0;
finaldisturbancevalue = 1;
Tsim = 20;

% simulation to workspace
sim = sim("class_6_simulink.slx");
cpi_time = sim.cpi_time;            % sim time
    % Loop 1
u1 = sim.u1;                        % reference 1
cSignal1A = sim.cSignal1A;          % control signal 1
y1 = sim.y1;                        % output 1
    % Loop 2
u2 = sim.u2;                        % reference 2
cSignal2A = sim.cSignal2A;          % control signal 2
y2 = sim.y2;                        % output 2

% plot 1st example's Smith Predictor
    % plot y1
figure(2)
subplot(1, 2, 1);
plot(cpi_time, y1, 'k', 'LineWidth', 1.7), hold on;
plot(cpi_time, y2, 'r', 'LineWidth', 1.7), hold on;
xlabel('Time (hr.)'); ylabel('y1 - output signal');
legend("SP", "FSP");
title('Unit step response with disturbance'), hold off;
    % plot u1
subplot(1, 2, 2);
plot(cpi_time, cSignal1A, 'k', 'LineWidth', 1.7), hold on;
plot(cpi_time, cSignal2A, 'r', 'LineWidth', 1.7), hold on;
xlabel('Time (hr.)'); ylabel('u1 - control signal'), hold off;
