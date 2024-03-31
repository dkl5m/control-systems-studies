%%
% Examples 3.1: “If” Statement
clear; clc;
x = randi(20, 1);
disp(['The value of x:', num2str(x)])
% if statement
if (x>10)
    disp('x is greater than 10')
end

y = randi(100, 1);
disp(['The value of y:', num2str(y)])
%fprintf('The value of y: %d', y)
if(y>=80)
    disp('Grade: A')
elseif(y>=60 && y<80)
    disp('Grade: B')
elseif(y>=40 && y<60)
    disp('Grade: C')
else
    disp('Grade: F')
end

%%
% Examples 3.2: "Switch" Statement
clear; clc;
x = input('Enter a Month:', 's');
switch x
    case 'January'
        disp(['Number of Days in ', x, ':31'])
    case 'February'
        disp(['Number of Days in ', x, ':28'])
    case 'March'
        disp(['Number of Days in ', x, ':31'])
    case 'April'
        disp(['Number of Days in ', x, ':30'])
    case 'May'
        disp(['Number of Days in ', x, ':31'])
    case 'June'
        disp(['Number of Days in ', x, ':30'])
    case 'July'
        disp(['Number of Days in ', x, ':31'])
    case 'August'
        disp(['Number of Days in ', x, ':31'])
    case 'September'
        disp(['Number of Days in ', x, ':30'])
    case 'October'
        disp(['Number of Days in ', x, ':31'])
    case 'November'
        disp(['Number of Days in ', x, ':30'])
    case 'December'
        disp(['Number of Days in ', x, ':31'])
    otherwise
        disp('Enter a Correct Name of Month')
end

%%
% Examples 3.3: "Switch" Statement
clear; clc;
a = [2, 4, 6, 8, 10];
for i=1:length(a)
    fprintf('Iteration: %d\n', i);
    fprintf('Value: %d\n', i);
end

%%
% Example 3.4: User Defined Function
% clear; clc;
% [out1, out2] = myfunction(10,20);
% fprintf("out1 = %d\n", out1);
% fprintf("out2 = %d\n", out2);
% 
% function [out1, out2] = myfunction(input1, input2)
% out1 = 2*input1;
% out2 = 2*input2;
% end

%% 
% Example 3.5: User-Defined Function–Anonymous Function
clear; clc;

myfunc = @(x) 2*x+3;
myfunc(2)

%%
% Example 3.6: User-Defined Function for Solving Quadratic Equation
clear; clc;

%Quadratic Equation: 2x^2 + 3x + 5 = 0
a = 2; b = 3; c = 5;
[x1, x2] = quad_roots(a, b, c)

function [x1, x2] = quad_roots(a, b, c)
x1 = (-b + sqrt(b^2 - 4*a*c))/(2*a);
x2 = (-b - sqrt(b^2 - 4*a*c))/(2*a);
end
