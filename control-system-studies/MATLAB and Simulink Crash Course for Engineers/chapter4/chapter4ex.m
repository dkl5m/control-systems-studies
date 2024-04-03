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
% Example 4.3: Euler s Formula
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
% Example 4.4: Eulers Series for Solving Initial Value Problem