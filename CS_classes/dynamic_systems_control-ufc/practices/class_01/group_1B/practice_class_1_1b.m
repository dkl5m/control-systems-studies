%% System - Example

clear; close; clc;

M=1; % mass variable
b=1; % viscous friction coefficient
k=1; % spring coefficient


% Using symbolic variables
    syms s U;                               % symbolic variables
    A = M*s^2+b*s+k;                        % output coefficient
    B = U;                                  % input coefficient
    fprintf("Using symbolic variables:");
    x = linsolve(A,B)                       % solve linear system


% Using Laplace variable
% 1st function
    s = tf('s');                            % Laplace variable
    g = 1/(s+1);
    display(g);                             % display the result
% 2nd function
    F = 1;                                  % function gain
    fprintf("Using Laplace variable:");
    gm = (F/M)/(s^2+(b/M)*s+(k/M));
    display(gm);
% plot the graphics using step function
    figure, step(g, gm)                     % graphics by step function
    title('1.Plot using step function');
    legend('g','gm');                       % show the legend


% Using transfer function to find state space matrices
    fprintf('Using transfer function to find state space matrices:');
    [A,B,C,D]=tf2ss(1,[1 .2 1])
    figure, step(A,B,C,D)
    title('2.Plot using transfer function to find state space matrices');


% Creating state space matrices
    fprintf('Creating state space matrices:');
    A1 = [0 1;-k/M -b/M];
    B1 = [0 1/M]';
    C1 = [1 0];
    D1 = 0;
% Creating state space system
    sys = ss(A1,B1,C1,D1)
    figure, step(sys)
    title('3.Plot state space system');
% Using state space matrices to find TF info
    [n,d] = ss2tf(A1,B1,C1,D1)
    sys1 = tf(n,d)
    ltiview('step',sys1)

% Using TF to find zero, pole and gain info
    [z1,p1,k1] = tf2zp(n,d)
% Using TF to find zero, pole and gain info
    [r2,p2,k2] = residue(n,d)

%%

M1=1;
M2=1;
b1=1;
b2=1;
k1=1;
k2=1;

syms s U1 U2;

A1 = [M1*s^2+(b1+b2)*s+(k1+k2), -(b2*s+k2); -(b2*s+k2), M2*s^2+b2*s+k2];
B1 = [U1; U2];

x_s = linsolve(A1,B1)



% zpk
% % "tf2zp" (converts a tf into the zero-pole-gain (ZPK) form.)
% [z, p, k] = tf2zp(b, a);
% disp('Zeros:');
% disp(z);
% disp('Poles:');
% disp(p);
% disp('Gain:');
% disp(k);


% % "zp2tf" (converts from zero-pole-gain (ZPK) form back to the transfer
% % function (TF) form.)
% [b, a] = zp2tf(z, p, k);
% disp('Numerator coefficients:');
% disp(b);
% disp('Denominator coefficients:');
% disp(a);