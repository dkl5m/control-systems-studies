%{
% Example 1.1: Different Data Types
clc;clear;
% Numeric data types: Integer, Float, Logical
var1 = int8(2);     % Integer of signed 8-bit
var2 = 10.5;        % Float: Double
var3 = true;        % Logical
% Character and string type: Character, String, Cell array
var4 = 'Matlab';            % Character
var5 = ["E", "Hossain"];    % String
var6 = {'E', 'Hossain'};    % Cell array
% Date and time
var7 = datetime('21/03/2024', 'InputFormat', 'dd/MM/uuuu');
fprintf('var1 ='); disp(var1)
fprintf('var2 ='); disp(var2)
fprintf('var3 ='); disp(var3)
fprintf('var4 ='); disp(var4)
fprintf('var5 ='); disp(var5)
fprintf('var6 ='); disp(var6)
fprintf('var7 ='); disp(var7)
whos
%}


%{
% Example 1.2: Conversion of Data Types
clc;clear;
% Number to text
var1 = int8(5);             % Integer
var1_conv = int2str(var1);  % Conversion into character

var2 = 2;                   % Double
var2_conv = num2str(var2);  % Conversion into character

var3 = 2.5;                 % Double
var3_conv = char(var3);     % Conversion into character

var4 = 3;                   % Double
var4_conv = string(var4);   % Conversion into string
fprintf('Number to text conversion:\n');
fprintf('----------------------------------\n');
whos

% Text to number
clear;
var5 = '4';                 % Character
var5_conv = str2num(var5);  % Conversion into number

var6 = "3.1416";                % String
var6_conv = str2double(var6);   % Conversion into double
fprintf('\nText to number conversion:\n');
fprintf('---------------------------------\n');
whos
%}

%{
% Example 1.3: Supression and diary
% Supressing output
% Without semicolon
a = [1 2 3 4]

% With semicolon
a = [1 2 3 4];

% diary function
clc; clear;
a = input('Enter a:');
b = input('Enter b:');
sum = a + b;
fprintf('Summation: %d\n', sum);
% diary('diaryFIle.txt');
%}

% Example 1.4: Disp function
clear; clc;
var = 5.25;
disp('Usage of disp() function:');
disp(var);
disp(['The value of the variable is: ', num2str(var)]);
