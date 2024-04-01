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
