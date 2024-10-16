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
% 2nd order differential equation
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


%%
% Example 6.8: Third-Order Differential
% 3rd order differential equation
% (dy/dx)^3=3*x^2+3*dy/dx^2-2*dy/dx+1;
% Initial conditions: y(0) = 1; y'(0) = 0; y''(0) = 1;
% Solve the differential equation
clc;clear;
syms y(x)
diff_eqn = diff(y,x,2) == 2*x^2+3*diff(y,x)-5;
dy = diff(y,x);
d2y = diff(y,x,2);
condition1 = y(0) == 1;
condition2 = dy(0) == 0;
condition3 = d2y(0) == 1;
condition = [condition1 condition2 condition3];
Sol_y(x) = dsolve(diff_eqn, condition)


%%
% Example 6.9: Partial Differential Equation
% Partial differential equation
% del(F)/del(x) - x^2 = 0;
% Here, F = 2*x^2+y-5
% Solve the partial differential equation for x
clc; clear;
syms x y
F = 2*x^2+y-5;
P_diff=diff(F,x);
disp('Solution:')
Sol_x=solve(P_diff-x^2==0,x)


%%
% Example 6.10: Single Variable Integral Equation
% Integral equation
% Integral [2*x^2].dx - 3x = 0
% without limit
clc; clear;
syms x y
I1=int(2*x^2,x);
disp('The solution without limit:')
x_sol=solve(I1-3*x==0,x)
% With limit of [0 2]
I2=int(2*x^2,x,0,2);
disp('The solution without limit:')
x_sol=solve(I2-3*x==0,x)


%%
% Example 6.11: Multivariable Integral Equation
% Integral equation
% Integral [x^2+exp(y)].dx = 0
% without limit
clc; clear;
syms x y
I1=int(x^2+exp(y),x);
disp('The solution without limit:')
y_sol=solve(I1==0,y)
% With limit of [0 2]
I2=int(x^2+exp(y),x,0,1);
disp('The solution without limit:')
y_sol=solve(I2==0,y)

