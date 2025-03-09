% Author: Klysm
% Date: 2/22/25
% Article reproduction

% Article name:
% Centralized PI controller design method for MIMO
% processes based on frequency response approximation

% EX2(Ogunnaike-Ray Column (3×3))
% G2 = [0.66*exp(-2.6*s)/(6.7*s+1), -0.61*exp(-3.5*s)/(8.64*s+1), -0.0049*exp(-1*s)/(9.06*s+1)
%       1.11*exp(-6.5*s)/(3.25*s+1), -2.36*exp(-3*s)/(5*s+1), -0.01*exp(-1.2*s)/(7.09*s+1)
%       -34.68*exp(-7*s)/(8.1*s+1), 46.2*exp(-7*s)/(10.9*s+1), 0.87*(11.61*s+1)*exp(-s)/((3.89*s+1)*(18.8*s+1))];

clc; clear; close all;

% define Laplace variable 's'
s = tf('s');

% define matrix of G2 transfer function (to simulink)
G2 = [0.66/(6.7*s+1), -0.61/(8.64*s+1), -0.0049/(9.06*s+1)
      1.11/(3.25*s+1), -2.36/(5*s+1), -0.01/(7.09*s+1)
      -34.68/(8.1*s+1), 46.2/(10.9*s+1), 0.87*(11.61*s+1)/((3.89*s+1)*(18.8*s+1))];

% define controllers
C2A = [(1.5215+0.380/s), (-0.291-0.0727/s), (0.0052+0.0013/s);
       (0.592+0.148/s), (-0.387-0.0966/s), (-0.0011-0.0003/s);
       (29.2+7.31/s), (8.93+2.23/s), (0.842+0.211/s)];

C2B = [(1.23+0.183/s), (-0.0716-0.0220/s), (0.0017+(2.08*10^(-4))/s);
       (0.576+0.0666/s), (-0.222-0.0444/s), (4.70*10^(-4)+(4.31*10^(-5))/s);
       (61.1+6.74/s), (13.9+1.97/s), (2.85+0.230/s)];

C2C = [(1.31+0.354/s), (-0.0135-0.0582/s), (0.0207+0.0026/s);
       (0.149+0.138/s), (-0.147-0.0773/s), (-0.0090-0.0006/s);
       (43.6+6.80/s), (-9.51+1.79/s), (4.03+0.421/s)];


% simulation to workspace
sim = sim("g2simulink.slx");
cpi_time = sim.cpi_time;        % sim time

u1 = sim.u1;
cSignal1A = sim.cSignal1A;
cSignal1B = sim.cSignal1B;
cSignal1C = sim.cSignal1C;
y1A = sim.y1A;                  % output 1
y1B = sim.y1B;
y1C = sim.y1C;

u2 = sim.u2;
cSignal2A = sim.cSignal2A;
cSignal2B = sim.cSignal2B;
cSignal2C = sim.cSignal2C;
y2A = sim.y2A;                  % output 2
y2B = sim.y2B;
y2C = sim.y2C;

u3 = sim.u3;
cSignal3A = sim.cSignal3A;
cSignal3B = sim.cSignal3B;
cSignal3C = sim.cSignal3C;
y3A = sim.y3A;                  % output 3
y3B = sim.y3B;
y3C = sim.y3C;


% plot 2nd example's Centralized PI
subplot(1, 2, 1); % plot y1
plot(cpi_time, y1A, '--k', 'LineWidth', 1.7), hold on;
axis([0 450, -0.2 1.2]);
xlabel('Time (hr.)'); ylabel('y1');
plot(cpi_time, y1B, 'b', 'LineWidth', 1.7);
plot(cpi_time, y1C, 'r', 'LineWidth', 1.7);
title('Unit step response');
legend('Ram','Xiong','Prop');
hold off;

subplot(1, 2, 2); % plot y2
plot(cpi_time, y2A, '--k', 'LineWidth', 1.7), hold on;
axis([0 450, -1.5 1.5]);
xlabel('Time (hr.)'); ylabel('y2');
plot(cpi_time, y2B, 'b', 'LineWidth', 1.7);
plot(cpi_time, y2C, 'r', 'LineWidth', 1.7);
title('Unit step response');
legend('Ram','Xiong','Prop');
hold off;

% subplot(2, 2, 1); 
% plot y3
plot(cpi_time, y3A, '--k', 'LineWidth', 1.7), hold on;
axis([0 450, -20 30]);
xlabel('Time (hr.)'); ylabel('y3');
plot(cpi_time, y3B, 'b', 'LineWidth', 1.7);
plot(cpi_time, y3C, 'r', 'LineWidth', 1.7);
title('Unit step response');
legend('Ram','Xiong','Prop');
hold off;