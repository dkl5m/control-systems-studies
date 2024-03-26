%%
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

%%
% Examples 2.2 and 2.3: Multiplication of Matrices and Transpose
clear; clc;
X = [1 2 4; 2 5 6];
Y = [1 2; 3 4; 5 7];
mul = X * Y;
fprintf('Multiplication of X and Y:\n');
disp(mul);

X_T = X'
fprintf('Transpose of X:\n');
disp(X_T);

%%
% Examples 2.4 and 2.5: Determinant and Identity Matrix
clear; clc;
A = [1 2 4; 3 2 1; 2 2 1];
det(A);
fprintf('Determinant of A:\n');
disp(det(A));

I = eye(3);
fprintf('Identity matrix:\n');
disp(I);

%%
% Examples 2.6 and 2.9: Inverse Matrix and simple matrix concatenation
clear; clc;
X  = [1 2 4; 3 2 1; 2 2 1];
inv(X);
fprintf('Inverse of X:\n');
disp(inv(X));

A = [1 4; 2 4; 3 2];
B = [2 -4; 1 3; 7 9];
fprintf('Horizontal concatenation:\n');
C=[A, B]
fprintf('Vertical concatenation:\n');
D=[A; B]

%%
% Examples 2.7: Arrays of Zeros and Ones
clear; clc;
row = 3;
col = 2;
A = zeros(row,col); % array of zeros
B = ones(row,col); % array of ones
fprintf('Array of zeros:\n');
disp(A);
fprintf('Array of ones:\n');
disp(B);

%%
% Examples 2.8: Arrays of random numbers
clear; clc;
row = 3;
col = 2;
num_min = 2;
num_max = 8;
% uniformely distributed random numbers
A = rand(row,col);
% normally distributed random numbers
B = randn(row,col);
% uniformely distributed pseudo-integer
C = randi([num_min, num_max], [row,col]);
fprintf('Array of uniformely distributed random numbers:\n');
disp(A);
fprintf('Array of normally distributed random numbers:\n');
disp(B);
fprintf('Array of uniformely distributed pseudo-integer:\n');
disp(C);

