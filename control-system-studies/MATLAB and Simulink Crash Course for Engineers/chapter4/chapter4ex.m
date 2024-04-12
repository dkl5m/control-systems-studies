%%
% Example 4.1: Complex Numbers Rectangular Form
clear; clc;
% Real value, a = 2
% Imaginary value, b = 5
% Complex number, C = a + i*b
a = 2; b = 5;
C = a + 1i*b;
% C = complex(a, b);
fprintf("C =");
disp(C);

%%
% Example 4.2: Complex Numbers Polar Form
clear; clc;
a = 2; b = 5;
C_mag = sqrt(a^2 + b^2);
C_angle = atan(b/a)*(180/pi); % in degree
% or C = complex(a, b);
% and C_mag = abs(C);
% and C_angle = angle(C)*(180/pi); % in degree
C_polar = [C_mag; C_angle];
fprintf("C_polar =\n");
disp(C_polar);

%%
% Example 4.3: Euler's Formula
clear; clc;
% C1 = 2 + 5i
% C2 = 5 + 10i
% Convert C1 and C2 in exponential form
% Determine M = C1*C2 and D = C1/C2 in exponential form

C1 = complex(2, 5);
C2 = complex(5, 10);
C1_mag = abs(C1);
C1_angle = angle(C1);
C2_mag = abs(C2);
C2_angle = angle(C2);
% C = a + bi = |C| (cos(theta) + i*sin(theta)) = |C|exp(i*theta)
disp(['C1 in exponential form: ', num2str(C1_mag), 'exp(i*', ...
    num2str(C1_angle), ')']);
disp(['C2 in exponential form: ', num2str(C2_mag), 'exp(i*', ...
    num2str(C2_angle), ')']);

% C1*C2
M_mag = C1_mag*C2_mag;
M_angle = C1_angle + C2_angle;
disp(['C1*C2 in exponential form: ', num2str(M_mag), 'exp(i*', ...
    num2str(M_angle), ')']);

% C1/C2
D_mag = C1_mag/C2_mag;
D_angle = C1_angle - C2_angle;
disp(['C1/C2 in exponential form: ', num2str(D_mag), 'exp(i*', ...
    num2str(D_angle), ')']);

%%
% Example 4.5: Fourier Series
% input: square wave function
% T = 2; Magnitude = 1; Omega = pi
t = -7:0.01:7;
x = 1 - square(pi*(t + 1));
plot(t, x, 'LineWidth', 1.5)
grid on; hold on;

% Fourier Series
syms k t
omega = pi;
T = 2;
k = 1:5;
a_0 = (2/T)*int(2, t, 0, 1);
a_k = (2/T)*int(2*cos(k*omega*t), t, 0, 1);
b_k = (2/T)*int(2*sin(k*omega*t), t, 0, 1);
f = (a_0/2) + sum(a_k.*cos(k*omega*t)) + sum(b_k.*sin(k*omega*t));
fplot(f, [0, 7])
grid on;

%%
% Example 4.6: DFT and Inverse DFT

clc; clear;
disp('Input sequence: ');
x = [1 4 5 7]
F = fft(x);
disp('Fourier transform of x: ');
F
inv_F = ifft(F);
disp('Inverse Fourier transform of F: ');
inv_F

%%
% Example 4.7: Taylor Series
clc; clear;
% Taylor series expansion
% Function: f(x)=2*sin(x) at a point x=a=0.5;
% Taylor series expansion yp to 4th and 10th order

syms x;
f = 2*sin(x);
a = 0.5;
T_4 = taylor(f,x,a,'order',4);
T_10 = taylor(f,x,a,'order',10);
disp('Taylor series expansion of 2*sin(x) at a=0.5 up to 4th order:');
T_4
fplot(T_4,'b','Linewidth',1.5);
hold on;
fplot(T_10,'g','Linewidth',1.5);
hold on;
fplot(f,'r','Linewidth',1.5);
hold off;
xlim([-4 4]);
ylim([-4 2]);
grid on
legend('Taylor series up to 4th order',...
        'Taylor series up to 10th order',...
        'Original function: 2*sin(x)','Location','Best')
title('Taylor series of 2*sin(x) at a = 0.5');

%%
% Example 4.4: Eulers Series for Solving Initial Value Problem

clc; clear;
% Generate a function for the differential equation
% Differential equation: dy/dx = y'= 2x^2+y-2
% Condition: 0 ,= x,= 5; y(0)=0.1
% N.B. MATLAB iterates from 1, not from 0.
% Hence, for the initial value y(0), we will consider it y(1).
% Number of step, N=18

f=@(x,y) 2*x^2+y-2;
L=input('Enter the lower limit of x:');
U=input('Enter the upper limit of x:');
N=input('Enter the number of step:');
y1=input('Enter initial value of y:');
Euler_series(f,L,U,N,y1);

% =====================================================
function Sol=Euler_series(f,L,U,N,y1)
% Input parameters:
% f: A function that provides the differential equation
% L: Lower limit of x
% U: Upper limit of x
% N: Number of steps
% y1: Initial value of y
% Output parameters:
% Sol: [x,y]; x: abscissas; y: ordinate

% Consider the step size, h

h = (U-L)/N;
y = zeros(N+1, 1);
x = zeros(N+1, 1);
x(1) = L;
y(1) = y1;
for i=1:N
    y(i+1) = y(i) + h*f(x(i), y(i));
    x(i+1) = x(i) + i*h;
end
plot(x,y,'*');
grid on;
xlabel('x');
ylabel('y');
title('Differential equation: dy/dx=2x^2+y-2; 0,=x,=5; y(0)=0.1');
Sol=[x,y];
end
