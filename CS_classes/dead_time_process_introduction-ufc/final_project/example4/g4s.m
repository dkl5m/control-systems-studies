% Author: Klysm
% Date: 2/25/25
% Article reproduction

% Article name:
% Centralized PI controller design method for MIMO
% processes based on frequency response approximation

% EX4(Shell Control Problem (2×3)). Augmented
% G4s = [(4.05*exp(-81*s))/(50*s+1), (1.77*exp(-84*s))/(60*s+1), (5.88*exp(-81*s))/(50*s+1);
%       (5.39*exp(-54*s))/(50*s+1), (5.72*exp(-42*s))/(60*s+1), (6.9*exp(-45*s))/(40*s+1)]

clc; clear; close all;

% define Laplace variable 's'
s = tf('s');

% define matrix of G2 transfer function (to simulink)
G4s = [(4.05)/(50*s+1), (1.77)/(60*s+1), (5.88)/(50*s+1);
       (5.39)/(50*s+1), (5.72)/(60*s+1), (6.9)/(40*s+1);
       0, 0, 0.00001];

% define controllers
C4A = [(0.658+0.0006326/s), (-0.06712-0.00003787/s);
       (-0.2907-0.002688/s), (0.2033+0.003301/s);
       (0.1291+0.001734/s), (-0.02072-0.0009675/s)];
C4B = [(0.0311+0.0025/s+(10.71*s)/(436.038*s+1)), 0;
        0, (0.1687+0.0027/s+(0.2856*s)/(16.0795*s+1));
        0, (0.0077+0.00009/s+(s+1.2178*s)/(100.0336*s+1))];
C4C = [(0.170+0.00278/s), (-0.0696-0.00149/s), 0;
       (-0.155-0.00262/s), (0.204+0.00342/s), 0;
        0, 0, 0];
C4D = [(-0.0125+0.000524/s), (0.0626-0.0000364/s);
       (-0.179-0.00222/s), (0.217+0.00316/s);
       (0.135+0.00144/s), (-0.0960-0.000926/s)];
Tsim = 3000;        % Simulation time

% simulation to workspace
sim = sim("g4sSimulink.slx");
cpi_time = sim.cpi_time;        % sim time
% Loop 1
u1 = sim.u1;                    % reference 1
cSignal1A = sim.cSignal1A;      % control signal 1 Shen
cSignal1B = sim.cSignal1B;      % control signal 1 Jin
cSignal1C = sim.cSignal1C;      % control signal 1 Proposed squared 
cSignal1D = sim.cSignal1D;      % control signal 1 Proposed pseudo
y1A = sim.y1A;                  % output 1 Shen
y1B = sim.y1B;                  % output 1 Jin
y1C = sim.y1C;                  % output 1 Proposed squared
y1D = sim.y1D;                  % output 1 Proposed pseudo
% Loop 2
u2 = sim.u2;                    % reference 2
cSignal2A = sim.cSignal2A;      % control signal 2 Shen
cSignal2B = sim.cSignal2B;      % control signal 2 Jin
cSignal2C = sim.cSignal2C;      % control signal 2 Proposed squared
cSignal2D = sim.cSignal2D;      % control signal 2 Proposed pseudo
y2A = sim.y2A;                  % output 2 Shen
y2B = sim.y2B;                  % output 2 Jin
y2C = sim.y2C;                  % output 2 Proposed squared
y2D = sim.y2D;                  % output 2 Proposed pseudo
% Loop 3
u3 = sim.u3;                    % reference 3
cSignal3A = sim.cSignal3A;      % control signal 3 Shen
cSignal3B = sim.cSignal3B;      % control signal 3 Jin
cSignal3C = sim.cSignal3C;      % control signal 3 Proposed squared
cSignal3D = sim.cSignal3D;      % control signal 3 Proposed pseudo
y3A = sim.y3A;                  % output 3 Shen
y3B = sim.y3B;                  % output 3 Jin
y3C = sim.y3C;                  % output 3 Proposed squared
y3D = sim.y3D;                  % output 3 Proposed pseudo

% plot 4th example's Centralized PI
% plot y1
subplot(2, 3, 1);
plot(cpi_time, y1A, '--k', 'LineWidth', 1.7), hold on;
axis([0 2000, 0 1.5]);
xlabel('Time (hr.)'); ylabel('y1');
plot(cpi_time, y1B, 'b', 'LineWidth', 1.7);
plot(cpi_time, y1C, 'r', 'LineWidth', 1.7);
plot(cpi_time, y1D, 'r', 'LineWidth', 1.7);
% title('Unit step response');
legend('Shen','Jin','PropSquared','PropPseudo');
hold off;
% plot y2
subplot(2, 3, 2);
plot(cpi_time, y2A, '--k', 'LineWidth', 1.7), hold on;
axis([0 2000, -0.5 1.5]);
xlabel('Time (hr.)'); ylabel('y2');
plot(cpi_time, y2B, 'b', 'LineWidth', 1.7);
plot(cpi_time, y2C, 'r', 'LineWidth', 1.7);
plot(cpi_time, y2D, 'r', 'LineWidth', 1.7);
% title('Unit step response');
% legend('Shen','Jin','PropSquared','PropPseudo');
hold off;
% plot y3
subplot(2, 3, 3);
plot(cpi_time, y3A, '--k', 'LineWidth', 1.7), hold on;
% axis([0 30, 0 1.5]);
xlabel('Time (hr.)'); ylabel('y3');
plot(cpi_time, y3B, 'b', 'LineWidth', 1.7);
plot(cpi_time, y3C, 'r', 'LineWidth', 1.7);
plot(cpi_time, y3D, 'r', 'LineWidth', 1.7);
% title('Unit step response');
% legend('Shen','Jin','PropSquared','PropPseudo');
hold off;

% plot u1
subplot(2, 3, 4);
plot(cpi_time, cSignal1A, '--k', 'LineWidth', 1.7), hold on;
axis([0 2000, -0.2 0.6]);
xlabel('Time (hr.)'); ylabel('u1');
plot(cpi_time, cSignal1B, 'b', 'LineWidth', 1.7);
plot(cpi_time, cSignal1C, 'r', 'LineWidth', 1.7);
plot(cpi_time, cSignal1D, 'r', 'LineWidth', 1.7);
% title('Unit step response with load-disturbance');
% legend('Shen','Jin','PropSquared','PropPseudo');
hold off;
% plot u2
subplot(2, 3, 5);
plot(cpi_time, cSignal2A, '--k', 'LineWidth', 1.7), hold on;
axis([0 2000, -0.6 0.2]);
xlabel('Time (hr.)'); ylabel('u2');
plot(cpi_time, cSignal2B, 'b', 'LineWidth', 1.7);
plot(cpi_time, cSignal2C, 'r', 'LineWidth', 1.7);
plot(cpi_time, cSignal2D, 'r', 'LineWidth', 1.7);
% title('Unit step response with load-disturbance');
% legend('Shen','Jin','PropSquared','PropPseudo');
hold off;
% plot u3
subplot(2, 3, 6);
plot(cpi_time, cSignal3A, '--k', 'LineWidth', 1.7), hold on;
% axis([0 30, 0 2]);
xlabel('Time (hr.)'); ylabel('u3');
plot(cpi_time, cSignal3B, 'b', 'LineWidth', 1.7);
plot(cpi_time, cSignal3C, 'r', 'LineWidth', 1.7);
plot(cpi_time, cSignal3D, 'r', 'LineWidth', 1.7);
% title('Unit step response with load-disturbance');
% legend('Shen','Jin','PropSquared','PropPseudo');
hold off;





