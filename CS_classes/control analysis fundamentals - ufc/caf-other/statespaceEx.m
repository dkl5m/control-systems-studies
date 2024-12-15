% state space exercise
clear; close; clc;

% state matrices
A = [-1 -1; 2 -1];
B = [1; 0];
C = [0 1];
D = 0;

% eigenvalues
eig(A)

% time vector
t = linspace(0,10,1000);

% building input step signal
signal = zeros(1,length(t));

for i = 1:length(signal)
    if i>10
        signal(i) = 1;
    end
end

% --------------------------------------------

% building open loop system (OLS)
OLS = ss(A,B,C,D);
[y,t,x] = lsim(OLS,signal,t);

% OLS states plot
figure;
plot(t,x(:,1));
hold;
plot(t,x(:,2));
legend('x1','x2');
title('OLS - step response - states');

% OLS step response plot
figure;
plot(t,y);
hold;
plot(t,signal);
legend('output','input');
title('OLS - step response');

% --------------------------------------------

% building closed Loop System (CLS)
% state feedback

% maximum (percent) overshoot
Mp = 0.1;
% peak time (sec)
tp = 0.5;

% damping ratio (razao amortecimento)
zeta = abs(log(Mp))/sqrt((pi^2)+(log(Mp)^2));
% natural frequence
wn = pi/(tp*sqrt(1-zeta^2));
% real part of the system poles
sigma_i = wn*zeta;
% imaginary part of the system poles
wi = sqrt((wn^2)-(sigma_i^2));

% CLS desired eigenvalues
eig_cls = [(-1*sigma_i+1j*wi) (-1*sigma_i-1j*wi)];
% state feedback gain matrix
K = acker(A,B,eig_cls);

% CLS matrices
ABk = A-B*K;
eig(ABk)
CLS = ss(ABk,B,(C-D*K),D);
[y1,t,x1] = lsim(CLS,signal,t);

% OLS step response plot
figure;
plot(t,y1);
hold;
plot(t,signal);
legend('output','input');
title('CLS - step response');

% --------------------------------------------

% complete order observer (COO)
% dual system
Ad = A';
Bd = C';
Cd = B';

% COO desired eigenvalues
eig_observer = [-10 -10];
Kd = acker(Ad,Bd,eig_observer);
L = Kd';

% --------------------------------------------

% augmented system - integral control (IC)
Abar = [A zeros(2,1); -C 0];
Bbar = [B; 0];

% augmented system desired eigenvalues
eig_aug_sys = [eig_cls -50];
Kbar = acker(Abar,Bbar,eig_aug_sys);
K1 = [Kbar(1) Kbar(2)];
Ke = - Kbar(3);
