% ft e resposta degrau (step, ltiview)

% 1a. eq. diferenciais (manual)
% 1b. funcao de transferencia (manual)
% 1c. funcao de transferencia no Matlab
%     X1(s)/U(s) e X2(s)/U(s)
%     Parametros M1,M2,b,k1,k2 sao os numeros
%     da matricula
% 1d. simulacao para U1 e U2 em degrau
% 1e. relatorio



%% Example 1c.
m = 2;                               % mass
b = 4;                               % damper coeff.
k = 8;                               % spring coeff.
num = 1;                             % numerator
den = [m b k];                       % denominator


% 2.a.
% tf (create transfer functions, which represent linear time-invariant
% (LTI) systems in the frequency domain)
sys = tf(num, den);
s = tf('s');                         % Laplace's variable


% tfdata (extract the data of a transfer function model)
[num, den] = tfdata(sys, 'v');
% Display the results
disp('Numerator:'); disp(num{1});    % For SISO, the first cell contains the numerator
disp('Denominator:'); disp(den{1});  % For SISO, the first cell contains the denominator


% zpkdata (extract the zeros, poles, and gain from a zero-pole-gain (ZPK) model.
[z, p, k] = zpkdata(sys);
% Display the results
disp('Zeros:'); disp(z{1});  % For SISO, the first element contains the zeros
disp('Poles:'); disp(p{1});  % For SISO, the first element contains the poles
disp('Gain:'); disp(k);


% zpk (create zero-pole-gain (ZPK) models)
sys = zpk(z, p, k);


% tf2zp (convert a transfer function model to its zero-pole-gain (ZPK) representation)
[z, p, k] = tf2zp(num, den);
disp('Zeros:'); disp(z);
disp('Poles:'); disp(p);
disp('Gain:'); disp(k);


% zp2tf (convert a zero-pole-gain (ZPK) model to a transfer function (TF) representation)
[num, den] = zp2tf(z, p, k);
disp('Numerator coefficients:'); disp(num);
disp('Denominator coefficients:'); disp(den);


% tf2ss (convert a transfer function (TF) model to a state-space (SS) representation)
[A, B, C, D] = tf2ss(num, den);
disp('A matrix:'); disp(A);
disp('B matrix:'); disp(B);
disp('C matrix:'); disp(C);
disp('D matrix:'); disp(D);


% ss2tf
% convert a state-space (SS) model to a
% transfer function (TF) representation.
i = 1;
[num, den] = ss2tf(A, B, C, D, i);
% If i is not provided, the function returns
% the transfer function from all inputs to
% all outputs (MIMO system).
% If i is provided, it returns the transfer
% function from the ii-th input to all
% outputs.


% Residue
[r, p, k] = residue(num, den);
% Display the results
disp('Residues:'); disp(r);
disp('Poles:'); disp(p);
disp('Direct term:'); disp(k);


% step
% compute and plot the step response of a
% system. The step response of a system is
% the output when the input is a unit step
% function, i.e., when the system is
% subjected to a sudden change from 0 to 1
% at time t=0t=0.
figure(1); % plot the first graphic
step(sys);
% or
% Define the time vector (0 to 10 seconds)
T = 0:0.01:10;

% Plot the step response over the time
% interval
figure(2); % plot the second graphic
step(sys, T);


% ltiview
% opens a graphical user interface (GUI)
% for analyzing and visualizing the
% behavior of Linear Time-Invariant (LTI)
% systems.
ltiview(sys);