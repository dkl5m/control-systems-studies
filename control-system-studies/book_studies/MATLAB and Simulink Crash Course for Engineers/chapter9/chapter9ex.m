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

