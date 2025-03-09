% Article name:
% Centralized PI controller design method for MIMO
% processes based on frequency response approximation

% G11 = 22.89*exp(-0.2*s)/(4.572*s+1);
% G12 = -11.64*exp(-0.4*s)/(1.807*s+1);
% G21 = 4.689*exp(-0.2*s)/(2.174*s+1);
% G22 = 5.8*exp(-0.4*s)/(1.801*s+1);

% EX1(Industrial Scale Polymerization Reactor (2x2))

clc; clear; close all;
s = tf('s');        % define Laplace variable 's'

% define G1 transfer function
h1 = 0.2;
h2 = 0.4;
G11 = 22.89/(4.572*s+1);
G12 = -11.64/(1.807*s+1);
G21 = 4.689/(2.174*s+1);
G22 = 5.8/(1.801*s+1);

% define controllers
C11Ram = (0.155+(0.0465/s));
C12Ram = (0.3105+(0.09315/s));
C21Ram = (-0.125-(0.0375/s));
C22Ram = (0.611+(0.1833/s));

C11Luan = (0.207+(0.054/s));
C12Luan = (0.233+(0.062/s));
C21Luan = (-0.160-(0.044/s));
C22Luan = (0.145+(0.122/s));

C11Prop = (0.186+(0.0476/s));
C12Prop = (0.246+(0.0654/s));
C21Prop = (-0.144-(0.0385/s));
C22Prop = (0.153+(0.129/s));

