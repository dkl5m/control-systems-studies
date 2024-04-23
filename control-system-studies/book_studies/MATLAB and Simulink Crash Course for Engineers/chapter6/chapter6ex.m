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


%%
% Example 6.5: “Solve” Function
% Two quadratic equations
% 2x^2+4xy+5=0
% 3y^2+5xy-2=0
% Determine the values of x and y
clc;clear;
syms x y
[x_val,y_val]=solve(2*x^2+4*x*y+5==0,3*y^2+5*x*y-2==0);
disp('The solutions are:');
disp('x =');
disp(x_val);
disp('y =');
disp(y_val);


%%
% Example 6.6: First-Order Differential
% 1st order differential equation
% dy/dx=2*x+y;
% Solve the differential equation
clc;clear;
syms y(x)
diff_eq = diff(y,x) == 2*x+y;
disp('Solution without initial condition:')
Sol_y(x) = dsolve(diff_eq)
% If the initial condition y(0)=1
condition = y(0) == 1;
disp('Solution with initial condition:')
Sol_y(x) = dsolve(diff_eq, condition)


%%
% Example 6.7: Second-Order Differential
% 2st order differential equation
% (dy/dx)^2=2*x^2+3*dy/dx-5;
% Initial conditions: y(0) = 1; y'(0) = 1;
% Solve the differential equation
clc;clear;
syms y(x)
diff_eqn = diff(y,x,2) == 2*x^2+3*diff(y,x)-5;
condition1 = y(0) == 1;
dy = diff(y,x);
condition2 = dy(0) == 1;
condition = [condition1, condition2];
Sol_y(x) = dsolve(diff_eqn, condition)