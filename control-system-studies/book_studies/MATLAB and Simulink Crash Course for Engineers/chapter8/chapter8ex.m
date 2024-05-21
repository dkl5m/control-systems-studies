%%
% Example 8.1: Ohm’s Law
% Ohm's Law: V=IR
% Voltage, V=[1:10]
% Resistance, R=5 ohms
% Plot voltage vs current
V=1:10; R=5;
I=V/R;
plot(V,I,'o-b','LineWidth',1.2);
xlabel('Voltage','Volt');
ylabel('Current','Amp');
title('Ohms Law');
grid on;

%%
% Example 8.2: Equivalent Resistance
% R1 + (R2||R3)
R1=10; R2=5; R3=4;
Equivalent_R= R1+((R2*R3)/(R2+R3));
fprintf('Equivalent resistance: %f', Equivalent_R);

%%
% Example 8.3: Delta to Wye Conversion
% Delta configured resistances:
% Rd1=10 ohms, Rd2=5 ohms, Rd3=20 ohms
% Equivalent wye configured resistances:
% Ry1, Ry2, Ry3

clc; clear;
Rd1=10; Rd2=5; Rd3=20;
Ry1= (Rd1*Rd2)/(Rd1+Rd2+Rd3);
Ry2= (Rd1*Rd3)/(Rd1+Rd2+Rd3);
Ry3= (Rd3*Rd2)/(Rd1+Rd2+Rd3);
fprint('Equivalent wye configured resistances:\n');
fprint('Ry1= %f  Ry2= %f  Ry3= %f\n',Ry1,Ry2,Ry3);

%%
% Example 8.4: Wye to Delta Conversion
% Delta configured resistances:
% Rd1=10 ohms, Rd2=5 ohms, Rd3=20 ohms
% Equivalent wye configured resistances:
% Ry1, Ry2, Ry3

clc; clear;
Ry1=10; Ry2=5; Ry3=20;
Rd1= (Ry1*Ry2+Ry2*Ry3+Ry3*Ry1)/(Ry3);
Rd2= (Ry1*Ry2+Ry2*Ry3+Ry3*Ry1)/(Ry2);
Rd3= (Ry1*Ry2+Ry2*Ry3+Ry3*Ry1)/(Ry1);
fprint('Equivalent delta configured resistances:\n');
fprint('Rd1= %f  Rd2= %f  Rd3= %f\n',Rd1,Rd2,Rd3);

%%
% Example 8.5: Equivalent Resistance with Delta-Wye Conversion
% Equivalent resistance with Delta-wye conversion
% R1,R2,R3: Delta configuration
% First step: Conversion into wye configuration
% Hence, find Ry1,Ry2,Ry3
% Second step: Find Rs1 and Rs2
% Third step: Find Rp
% Fourth step: Find overall equivalent resistance, Req
clc; close; clear;
Rd1=2; Rd2=4; Rd3=6; R4=3; R5=2;
Ry1= (Rd1*Rd2)/(Rd1+Rd2+Rd3);
Ry2= (Rd1*Rd3)/(Rd1+Rd2+Rd3);
Ry3= (Rd3*Rd2)/(Rd1+Rd2+Rd3);
Rs1= Ry2+R4;
Rs2= Ry3+R5;
Rp= (Rs1*Rs2)/(Rs1+Rs2);
Req= Ry1+Rp;
fprintf('The equivalent resistance: %.3f ohms\n', Req);

%%
% Example 8.6: Circuit Problem
% R1=2 ohms; R2=R3=4 ohms
% Voltage source, E=10V
% Determine loop current IL1 and IL2
% Determine current, I1, I2, and I3
% Determine voltage across resistance R1: VR1
% Determine voltage across resistance R2: VR2
% Determine voltage across resistance R3: VR3
clc;clear;
R1=2;R2=4;R3=R2;
syms IL1 IL2
eqn1= 6*IL1-4*IL2==10;
eqn2= -4*IL1+8*IL2==0;
[IL1,IL2]=solve(eqn1,eqn2);
fprintf('The ABC loop current, IL1: %.3f A\n',IL1);
fprintf('The ABC loop current, IL2: %.3f A\n',IL2);

I1=IL1; I2=IL2; I3=I1-I2;
fprintf('The currents in the circuit:\n');
fprintf('I1= %.3f A I2= %.3f A I3= %.3f A\n',I1,I2,I3);

VR1=I1*R1;
VR2=I3*R2;
VR3=I2*R3;

fprintf('The voltage across R1, VR1= %.3f V\n',VR1);
fprintf('The voltage across R2, VR2= %.3f V\n',VR2);
fprintf('The voltage across R3, VR3= %.3f V\n',VR3);

%%
% Example 8.7: Voltage divider
% R1=2 ohms; R2=4 ohms; R3=8 ohms; E=24 V
% Determine voltage across resistance R2 and R3
clc; clear;
R1=2;R2=4;R3=8;E=24;
VR2=(R2/(R1+R2+R3))*E;
VR3=(R3/(R1+R2+R3))*E;
fprintf('Voltage across resistance R2, VR2= %.3f V\n',VR2);
fprintf('Voltage across resistance R3, VR3= %.3f V\n',VR3);

%%
% Example 8.8: Current divider
% R1=2 ohms; R2=4 ohms; I=16 A
% Determine current through resistance R1 and R2
clc; clear;
R1=2;R2=4;I=16;
I1=(R2/(R1+R2))*I;
I2=(R1/(R1+R2+R3))*I;
fprintf('Current through resistance R1, I1= %.3f V\n',I1);
fprintf('Current through resistance R2, I2= %.3f V\n',I2);

%%
% Example 8.9: Thevenin's theorem
% R1=4 ohms; R2=2 ohms; R3=3 ohms; RL=5 ohms; V=10 V;
% Determine: Thevenin's voltage, Vth
% Determine: Thevenin's equivalent resistance, Rth
% Determine: Load current, IRL
clc; clear;
R1=4;R2=2;R3=3;RL=5;V=10;
Vth=((R2)/(R1+R2))*V;
Rth=((R1*R2)/(R1+R2))+R3;
IRL=Vth/(Rth+RL);
fprintf('Thevenin voltage: Vth = %.3f V\n',Vth);
fprintf('Thevenin equivalent resistance: Rth = %.3f ohms\n',Rth);
fprintf('Load current: IRL= %.3f A\n',IRL);
