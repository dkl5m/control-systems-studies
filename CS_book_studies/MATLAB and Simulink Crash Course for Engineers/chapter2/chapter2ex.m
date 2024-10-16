%%
% Examples 2.10 and 2.1: Dimension and addition of Matrices
clear; clc;
disp('Examples 2.10 and 2.1: Dimension and addition of Matrices');
A = [2 1; 4 3; 2 1];
dimA = size(A);
fprintf('Dimension of vector A:\n');
disp(dimA);

B = [1 4 6; 2 5 7; 3 6 8];
C = [2 4 6; 3 5 7; 4 6 8];
Add = B + C;
Sub = B - C;
dimB = size(B);
fprintf('Dimension of matrix B:\n');
disp(dimB);
fprintf('Addition of B and C:\n');
disp(Add);
fprintf('Subtraction of B and C:\n');
disp(Sub);

%%
% Examples 2.2 and 2.3: Multiplication of Matrices and Transpose
clear; clc;
disp('Examples 2.2 and 2.3: Multiplication of Matrices and Transpose');
X = [1 2 4; 2 5 6];
Y = [1 2; 3 4; 5 7];
mul = X * Y;
fprintf('Multiplication of X and Y:\n');
disp(mul);

X_T = X';
fprintf('Transpose of X:\n');
disp(X_T);

%%
% Examples 2.4 and 2.5: Determinant and Identity Matrix
clear; clc;
disp('Examples 2.4 and 2.5: Determinant and Identity Matrix');
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
disp('Examples 2.6 and 2.9: Inverse Matrix and simple matrix concatenation');
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
% Example 2.7: Arrays of Zeros and Ones
clear; clc;
disp('Example 2.7: Arrays of Zeros and Ones');
row = 3;
col = 2;
A = zeros(row,col); % array of zeros
B = ones(row,col); % array of ones
fprintf('Array of zeros:\n');
disp(A);
fprintf('Array of ones:\n');
disp(B);

%%
% Example 2.8: Arrays of random numbers
clear; clc;
disp('Example 2.8: Arrays of random numbers');
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

%%
% Example 2.11: Creating Linearly Spaced One-Dimensional Array
clear; clc;
disp('Example 2.11: Creating Linearly Spaced One-Dimensional Array');
up_range = 2;
low_range = 12;
point = 5;
A = linspace(up_range, low_range, point);
fprintf('Linearly spaced one-dimensional array:\n');
fprintf('--------------------------------------\n');
fprintf('Using Linearly function:\n');
disp(A)
%  Alternative version
space = 2.5;
B = up_range:space:low_range;
fprintf('Without using Linearly function:\n');
disp(B)

%%
% Example 2.12: Finding Maximum and Minimum Value from an Array
clear; clc;
disp('Example 2.12: Finding Maximum and Minimum Value from an Array');
A = randi([1, 30], 1, 5)
max_A = max(A);
min_A = min(A);
fprintf('Maximum value of the array A:');
disp(max_A);
fprintf('Minimum value of the array A:');
disp(min_A);

%%
% Example 2.13: Mean, Variance, Standard Deviation, and Mode
clear; clc;
disp('Example 2.13: Mean, Variance, Standard Deviation, and Mode');
A = randi([1, 50], 1, 6);
mean_A = mean(A);
variance_A = var(A);
std_A = std(A);
mode_A = mode(A);
fprintf('One-dimensional array, A:\n');
disp(A);
fprintf('Mean value of A = %.2f\n', mean_A);
fprintf('Variance of A = %.2f\n', variance_A);
fprintf('Standard deviation of A = %.2f\n', std_A);
fprintf('Mode of A = %.2f\n', mode_A);

%%
% Example 2.14: Instances of the Dot Operator
clear; clc;
disp('Example 2.14: Instances of the Dot Operator');
% A and B are two arrays;
% scalar_val is a scalar value;
A = randi([1, 2], 2, 3);
B = randi([1, 2], 2, 3);
fprintf('Some instances of the usage of dot operator:\n');
fprintf('--------------------------------------------\n');
% Dot multiplication
fprintf('Dot multiplication of two arrays:\n')
disp(A.*B);
% Element-wise division between two arrays
fprintf('Element-wise division between two arrays:\n')
disp(A./B);
% Division: Numerator-scalar and denominator-array
scalar_val = 5;
fprintf('Division: Numerator-scalar and denominator-array:\n')
disp(scalar_val./A);
% Power value: Either the base, or power is an array
Base = 10;
fprintf('Power term is an array:\n')
disp(Base.^A)
fprintf('Base term is an array:\n')
disp(A.^scalar_val)

%%
% Example 2.15: Creating Table
% Headers: Battery name, Energy density, Life cycle, Safety
clear; clc;
disp('Example 2.15: Creating Table');
Battery_name = {'Li-ion'; 'Liquid super capacitor'; 'Lead acid'};
Energy_density = [5; 2.5; 2];
Life_cycle = [2; 5; 1.5];
safety = {'High'; 'Low'; 'Moderate'};
TABLE = table(Battery_name, Energy_density, Life_cycle, safety);
fprintf('Comparison among different battery types:\n');
fprintf('-----------------------------------------\n');
disp(TABLE);
% Accessing each column of the table
fprintf('Accessing the data of Battery_name column:\n');
disp(TABLE.Battery_name);
fprintf('Accessing the data of Energy_density column:\n');
disp(TABLE.Energy_density);
fprintf('Accessing the data of Life_cycle column:\n');
disp(TABLE.Life_cycle);
fprintf('Accessing the data of safety column:\n');
disp(TABLE.safety);

%%
% Example 2.16: Cell Array
clear; clc;
disp('Example 2.16: Cell Array');
A = cell(2,3);
A(1,:) = {3, 4, 4};
A(2,:) = {'A', 'B', 'C'};
fprintf('Cell array, A:\n');
disp(A);

%% 
% Example 2.17: Structured Array
clear; clc;
disp('Example 2.17: Structured Array');
Field1 = 'Battery_name';
val_Field1 = {'Li-ion', 'Liquid super capacitor', 'Lead acid'};
Field2 = 'Energy_density';
val_Field2 = {5, 2.5, 2};
Field3 = 'Life_Cycle';
val_Field3 = {2, 5, 1.5};
Field4 = 'safety';
val_Field4 = {'High', 'Low', 'Moderate'};
fprintf('Structured array of different battery types and properties:\n');
S = struct(Field1, val_Field1, Field2, val_Field2, Field3, val_Field3, ...
    Field4, val_Field4);
fprintf('Accessing first field of the structure:\n');
disp(S(1));
fprintf('Accessing second field of the structure:\n');
disp(S(2));
fprintf('Accessing third field of the structure:\n');
disp(S(3));
disp('----------------------------------------------');

%%
% Exercises - chapter 2
clear; clc;
%{
Exercise 2
1. Define vectors and matrices. What are their applications in engineering?
2. What is the difference between the rand(), randn(), and randi() functions? Explain
with examples.

3. What will be the output of the following commands?
(a) A ¼ 3:3:15
(b) B ¼ [;]
(c) Z ¼ [143,324,676,432;656,657,987,235;768,876,234,764]; Z(2,:)
Fig. 2.37 Output—Structured array in MATLAB
46 2 Vectors and Matrices
4. Consider three matrices given as follows:
MatA ¼
4 7 1
7 2 3
5 5 9
2
6
4
3
7
5; MatB ¼
6 0 4
9 8 1
7 5 2
2
6
4
3
7
5; MatC ¼
2 5 3
0 17 9
8 0 1
2
6
4
3
7
5
(i) Calculate the following:
(a) MatA + MatB
(b) MatB  MatC
(c) MatA/MatC
(d) Transpose of MatB
(e) Determinant of MatC
(f) Inverse MatA
(g) Horizontally concatenate MatB and MatC
(h) Vertically concatenate MatC and MatA
(ii) Determine MatA  MatB, MatB  MatA, and MatA.  MatB. Do the
results vary? If so, why?
5. Given an array a ¼ linspace(2,20,100). What is the mean, variance, standard
deviation, and mode of a?
6. Suppose you are working with five semiconductor materials, namely, silicon (Si),
germanium (Ge), tin (Sn), carbon (C), and tellurium (Te). Each of them has a
bandgap of 1.12, 0.67, 0.08, 5.47, and 0.33 eV, respectively, eV being their unit
of measurement.
(a) Enlist the information in a table with a column for “Serial_Number,”
“Element_Name,” “Element_Symbol,” and “Bandgap.” Use MATLAB
“table” function for the purpose.
(b) Form and display a structured array from the above information with the same
column name as mentioned in 5a. Change the bandgap of tin from 0.08 to
0.07 eV by accessing the specific field and display the array again.
%}