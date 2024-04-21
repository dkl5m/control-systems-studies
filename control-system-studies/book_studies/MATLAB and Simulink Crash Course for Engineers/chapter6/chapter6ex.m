%%
% Example 6.1: Rank
clear; clc;

% Determining rank
% Input matrix, A
A = [1 2 4; 2 4 8];
disp('The rank of the matrix A:')
rank(A)
% Input matrix, B
B = [1 1 2; 5 2 7; 0 4 4; 2 6 8];
disp('The rank of the matrix B:')
rank(B)


%%
% Example 6.2: Eigenvalue
clear; clc;

% Eigenvalue
% Input matrix, X
X = [1 2 0;0 5 0; 1 3 1];
disp('The eigenvalues of X are:')
rank(X)


%%
% Example 6.3: Eigenvector
clear; clc;

% Eigenvalue
% Input matrix, X
% [vector, lambda]=eig(X)
% Here, vector is the eigenvector
% Lambda is a diagonal vector containing the eigenvalues
X = [1 2 0;0 5 0; 1 3 1];
[vector, lambda]=eig(X);
disp('The eigenvalues of X are:')
lambda = sum(lambda);
disp('The eigenvector of X:')
vector


%%
% Example 6.4: Solving Quadratic Equation
clear; clc;

% Solving quadratic equation
% 2x^2+4x+5=0
% Determine the values of x
syms x
x_val = solve(2*x^2+4*x+5==0,x);
disp('The solutions are:')
x_val