%%
% Example 7.1: Gauss-Seidel Method
% Gauss-seidel methods
% Set of equations:
% F1(x,y,z)= 80x+10y-2z==85
% F2(x,y,z)= 5x+50y+12zeros==112
% F1(x,y,z)= 4x+9y+30z==68
% Stopping criteria: tolerance for (x,y,z)<0.00001
clc; clear;
fx=@(x,y,z) (1/80).*(85-10*y+2*z);
fy=@(x,y,z) (1/50).*(112-5*x-12*z);
fz=@(x,y,z) (1/30).*(68-4*x-9*z);
xo=0; yo=0; zo=0;
N = 100;
for j=1:N
    x=fx(xo,yo,zo);
    y=fx(x,yo,zo);
    z=fx(x,y,zo);
    tol_x=abs(x-xo)/xo;
    tol_y=abs(y-yo)/yo;
    tol_z=abs(z-zo)/zo;
    fprintf('x:%.5f Tol_x: %.5f y:%.5f Tol_y: %.5f z:%.5f Tol_z: %.5f \n', ...
        x,tol_x,y,tol_y,z,tol_z);
    xo=x; yo=y; zo=z;
    % Stopping criteria
    if(tol_x<0.00001 && tol_y<0.00001 && tol_z<0.00001)
        break;
    end
end
fprintf('The solution after %dth iteration:\n',j);
fprintf('x: %f y: %f z: %f \n',x,y,z);



%%
% Example 7.2: Newton-Raphson Method
clear; clc;
% Newton raphson method
% Find the root of 2*x+sin(x)-2
% Stopping criteria: Tolerance < 0.00001
F=@(x) 2*x+sin(x)-2;
syms x
% Derivative
dF(x)=diff(F(x));
a=0;
b=2;
xo=mean([a b]);
N=100;
    for i=1:N
        x=xo-(F(xo)/dF(xo));
        tol=abs(x-xo)/xo;
        fprintf('x: %.5f Tolerance: %.5f \n',x,tol);
        xo=x;
        % Stopping criteria
        if (tol<0.00001)
            break;
        end
    end
fprintf('Root of the equation after %dth iteration: %.5f\n',i,x);


%%
% Example 7.3: Runge-Kutta Method
% Runge-kutta method
% Differential equation dy/dx = (x+2*y)*cos(y)
% Conditions: 0<=x<=2; y(0)=5; Step size, h=0.2
% Solve for y
clc;clear;
F = @(x,y) (x+y*2)*cos(y);
h = 0.2;
x0 = 0;
y0 = 5;
xn = 2;
N = length(x0:h:xn);
for j=1:N-1
    k1=h*F(x0,y0);
    k2=h*F(x0+0.5*h,0+0.5*k1);
    k3=h*F(x0+0.5*h,0+0.5*k2);
    k4=h*F(x0+h,y0+k3);
    y(j)=y0+(1/6)*(k1+2*k2+2*k3+k4);
    x0=x0+h;
    y0=y(j);
end
x=0.2:h:xn;
plot(x,y,'o-b','LineWidth',1.5);
xlabel('x');
ylabel('y');
title('Range-kutta method')
grid on;
fprintf('The final solution for x = 2 is: %.5f\n',y(j));

