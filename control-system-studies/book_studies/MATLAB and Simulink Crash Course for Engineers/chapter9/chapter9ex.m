% Example 9.1. Transfer function
% Transfer function: (s+50)/(s^2+11s+12)
G=tf([1 50],[1 11 12]);
disp('Transfer function:');
G

% or
syms s
G1=@(s)(s+50)/(s^2+11*s+12);
disp('Transfer function:');
disp(G1(s))

%%
% Example 9.2. Laplace Transform
clc;clear;

syms t s
g=@(t) exp(3*t)*sin(6*t);
disp('Laplace transform:');
G(s)=laplace(g(t))

%%
% Example 9.3. Inverse Laplace Transform
% 3*y'''(t) + 2*y''(t) + 3*y();
% Initial condition: y(0)=0;y'(0)=0;y''(0)=;
clc;clear;

syms s Y
% Initial condition
y0=0;dy0=0;dy20=1;
Y1=@(s) s*Y-y0;
Y2=@(s) s*Y-s^2*y0-dy0;
Y3=@(s) s^3*Y-s^2*y0-s*dy0-dy20;

% Differential equation
eqn=3*Y3(s)+2*Y2(s) + 3*Y - laplace(1,s);
solve(eqn,Y)