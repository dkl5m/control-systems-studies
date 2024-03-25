%{
% Example 2.1: Dimension and addition of Matrices
clear; clc;
A = [2 1 5];
B = [1 4 6; 2 5 7; 3 6 8];
C = [2 4 6; 3 5 7; 4 6 8];
Add = B + C;
Sub = B - C;
dimA = size(A);
dimB = size(B);
fprintf('Dimension of vector A:\n');
disp(dimA);
fprintf('Dimension of matrix B:\n');
disp(dimB);
fprintf('Addition of B and C:\n');
disp(Add);
fprintf('Subtraction of B and C:\n');
disp(Sub);
%}

%{
% Example 2.2: Multiplication of Matrices and transpose (2.3)
clear; clc;
X = [1 2 4; 2 5 6];
Y = [1 2; 3 4; 5 7];
mul = X * Y;
fprintf('Multiplication of X and Y:\n');
disp(mul);
X_T = X'
fprintf('Transpose of X:\n');
disp(X_T);
%}