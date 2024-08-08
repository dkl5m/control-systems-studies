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
disp('Laplace transform:')
G(s)=laplace(g(t))

%%
% Example 9.3.  Laplace Transform of Initial Value
% Problem with Differential Equation
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

%%
% Example 9.4. Inverse Laplace Transform
clc;clear;

syms t s
G=@(t) 6/((s-3)^2+36);
disp('Inverse laplace transform:')
g(t)=ilaplace(G(s))

%%
% Example 9.5. Partial fraction
% Fraction: (2s+3)/(s^2+2s)
% Higher degree of Numerator < Higher degree of Denominator
clc;clear;

syms t s
N = [2 3];
D = [1 2 0];
disp('The residuals:')
[r,p,k] = residue(N,D)
Expan=@(s) r(1)/(s-p(1)+r(2)/(s-p(2)));
disp('The partial fraction expansion:')
disp(Expan(s))

%%
% Example 9.6. Partial fraction - 2
% Fraction: (2s^2+4s+1)/(s^2+2s)
% Higher degree of Numerator = Higher degree of Denominator
clc;clear;

syms t s
N = [2 4 1];
D = [1 2 0];
disp('The residuals:')
[r,p,k] = residue(N,D)
Expan=@(s) r(1)/(s-p(1)+r(2)/(s-p(2)))+k;
disp('The partial fraction expansion:')
disp(Expan(s))

%%
% Example 9.7. Partial fraction - 4
% Fraction: (2s^3+4s^2+3s+1)/(1s^2+2s+1)
% Higher degree of Numerator = Higher degree of Denominator
clc;clear;

syms t s
N = [2 4 3 3];
D = [1 2 1];
disp('The residuals:')
[r,p,k] = residue(N,D)
Expan=@(s) r(1)/(s-p(1)+r(2)/(s-p(2)))+(s*k(1)+k(2));
disp('The partial fraction expansion:')
disp(Expan(s))
