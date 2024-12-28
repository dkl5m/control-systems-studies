% Class_6 = Filtered Smith Predictor (Discrete)
clear; close all; clc;

% specs
% G(s) = 2/(3s + 1); C = k*(s+z)/s;
% Mp = 0.05; ts = 4;

% Plant variables
nump = 2;                           % plant numerator
denp = [3 1];                       % plant denominator
h = 6.5;                            % transport delay
G = tf(nump,denp);                  % plant tf
Gd = tf(nump,denp,'InputDelay',h);  % delayed plant tf

% Smith Predictor variables
% By rootlocus, z = 0.9839
% By |C*G| = 1, k = 5.3360
z = 0.9839;                         % controller zero
k = 5.3360;                         % controller gain
s = tf('s');                        % Laplace operator
C = k*(s+z)/s;                      % PD controller
Gc = C*G;                           % controlled plant without delay tf

% Filtered Smith Predictor variables

% Frequency range (example)
omega = logspace(-1, 2, 500);  % 500 frequencies between 0.1 and 100 rad/s

% Evaluate C(jw) and G(jw) at each frequency
Cjw = freqresp(C, 1j*omega);  % C(jw)
Gjw = freqresp(G, 1j*omega);  % G(jw)

% Compute |M(jw)|
M = abs(Cjw .* Gjw);  % Example: M(jw) = C(jw) * G(jw) (or other expression)

% Compute |1 + 1 / (C(jw) * G(jw))|
RightSide = abs(1 + 1 ./ (Cjw .* Gjw));

% Check the inequality at each frequency
inequality_holds = M < RightSide;

% Plot the results
figure;
% plot3(omega, M, 'b', 'LineWidth', 2);
% hold on;
% plot3(omega, RightSide, 'r--', 'LineWidth', 2);
% xlabel('Frequency (rad/s)');
% ylabel('Magnitude');
% legend('|M(jw)|', '|1 + 1 / (C(jw) * G(jw))|');
% grid on;
