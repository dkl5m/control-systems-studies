clc; clear; close all;

% 'open-loop system'
%   plant G(s) = 2 / (3s + 1)
numeratorPlant = 2;
denominatorPlant = [3 1];
plant = tf(numeratorPlant, denominatorPlant);   % create open-loop plant tf
t = 0:0.01:45;                                  % time vector in seconds
figure(1), step(plant, t), hold on;             % open-loop step-response


% 'closed-loop system'
%   performance specs
tr = 3;                                         % rise time in seconds
Mp = 0.05;                                      % maximum overshoot
referenceValue = 1.3;
zeta = -log(Mp) / sqrt(pi^2 + (log(Mp))^2);     % damping ratio
wn = 1.8 / tr;                                  % natural frequency
%   PID controller
Kp = (2*zeta*wn - 1/3) * 3/2;                   % proportional parameter
Ki = wn^2 * 3/2;                                % integral parameter
Kd = (2*zeta*wn*3/2 - Kp*3) / (2*wn);           % derivative parameter
controllerPID = pid(Kp, Ki, Kd);                % create PID controller
controlledPlant = feedback(controllerPID*plant, 1);
                                                % create closed-loop
                                                % controlled plant tf
step(controlledPlant, t);                       % closed-loop step-response
legend('uncontrolled plant', 'controlled plant'), hold off;


% delayed open-loop system
delay = 6.5;                                    % delay time in seconds
delayedPlant = plant * tf(1, 1, 'InputDelay', delay);
figure(2), step(delayedPlant, t), hold on;      % open-loop step-response


% delayed closed-loop system
delayedControlledPlant = feedback(controllerPID*delayedPlant, 1);
                                                % create closed-loop
                                                % delayed controlled plant
step(delayedControlledPlant, t);                % closed-loop step-response
legend('uncontrolled delayed plant', 'controlled delayed plant'), hold off;


% Smith Predictor
% Smith Predictor closed-loop system
