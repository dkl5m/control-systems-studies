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

%%
% Example 8.10: Maximum power transfer theorem
% Rth=5 ohms; Vth=10 V;
clc; clear;
Rth=5; Vth=10;
RL= 1:1:26;
for i=1:1:26
    I(i)=Vth/(Rth+RL(i));
    Power(i)=I(i)^2*RL(i);
end
plot(RL,Power,'o-b','LineWidth',1.2);
xlabel('Load resistance, R L (Ohms)');
ylabel('Output power, P (W)');
title('Maximum power transfer theorem');
grid on;
% Maximum power, when RL=Rth
RL=5;
P_max=(Vth/(Rth+RL))^2*RL;
fprintf('Maximum output power= %.3f\n', P_max);

%%
% Example 8.11: AC Circuit terminologies
% v(t)=10 sin(2*pi*f*t)
% f= 60Hz; t=0:0.1 sec
% Determine: Peak voltage, Vp
% Determine: Peak to peak voltage, Vpp
% Determine: RMS voltage, V_rms
% Determine: Average voltage, V_avg
% Determine: Instantaneous voltage at T=0.02 sec, V_inst
clc;clear;

f=60;
t=0:0.0001:0.1;
v=2*sin(2*pi*f*t);
plot(t,v,'o-b','LineWidth',1.5);
xlabel('Time (sec)');
ylabel('Voltage (V)');
ylim([-2.5 2.5]);
grid on;

Vp=max(abs(v));
Vpp=2*Vp;
V_rms=(1/sqrt(2))*Vp;
V_avg=(2/pi)*Vp;
T=0.02;
V_inst=2*sin(2*pi*f*T);

fprintf('Peak voltage: %.3f\n', Vp);
fprintf('Peak to peak voltage: %.3f\n', Vpp);
fprintf('RMS voltage: %.3f\n', V_rms);
fprintf('Average voltage: %.3f\n', V_avg);
fprintf('Instantaneous voltage at T=0.02 sec: %.3f\n', V_inst);

%%
% Example 8.12: Impedance
% R= 10 ohms; L= 0.02 H; C= 0.05 F; f= 60Hz
% Determine impedance: Z
% Power factor: PF
clc;clear;

R= 10; L= 0.02; C= 0.05;
f=60;
XL=2*pi*f*L;
XC=1/(2*pi*f*C);
disp('Impedance:')

Z=R+1i*(XL-XC);
Imp_magnitude=abs(Z);
Phase_angle=angle(Z)*(180/pi);
disp('In polar form:')

fprintf('|Z|=%.3f ohms; Phase angle= %.3f degree\n',...
    Imp_magnitude, Phase_angle);
PF=cos(Phase_angle);
fprintf('Power factor: %.3f\n', PF);

%%
% Example 8.13: Power Triangle
% Find Apparent power, S
% Find Power factor, PF
% Example 1: Real power, P = 10 W, Reactive power, Q = 5 Var
clc;clear;

fprintf('Example 1: Positive reactive power\n');
fprintf('----------------------------------\n');
P=10; Q=5;
disp('Apparent power:')
S=P+j*Q
S_mag=abs(S);
S_angle=angle(S)*(180/pi);
fprintf('Apparent power in polar form:\n');
fprintf('|S|= %.3f VA Power angle: %.3f degree\n',S_mag,S_angle);
PF=cos(S_angle);
if Q>0
    fprintf('Power factor= %.3f; Lagging\n', PF);
elseif Q<0
    fprintf('Power factor= %.3f; Lagging\n', PF);
else
    fprintf('Power factor= %.3f; Unity\n', PF);
end
fprintf('\n')

% Example 2: Real power, P = 10 W, Reactive power, Q = -5 Var
fprintf('Example 2: Negative reactive power\n');
fprintf('----------------------------------\n');
P=10; Q=-5;
disp('Apparent power:')
S=P+j*Q
S_mag=abs(S);
S_angle=angle(S)*(180/pi);
fprintf('Apparent power in polar form:\n');
fprintf('|S|= %.3f VA Power angle: %.3f degree\n',S_mag,S_angle);
PF=cos(S_angle);
if Q>0
    fprintf('Power factor= %.3f; Lagging\n', PF);
elseif Q<0
    fprintf('Power factor= %.3f; Lagging\n', PF);
else
    fprintf('Power factor= %.3f; Unity\n', PF);
end
fprintf('\n')

% Example 3: Real power, P = 10 W, Reactive power, Q = 0 Var
fprintf('Example 3: Zero reactive power\n');
fprintf('----------------------------------\n');
P=10; Q=0;
disp('Apparent power:')
S=P+j*Q
S_mag=abs(S);
S_angle=angle(S)*(180/pi);
fprintf('Apparent power in polar form:\n');
fprintf('|S|= %.3f VA Power angle: %.3f degree\n',S_mag,S_angle);
PF=cos(S_angle);
if Q>0
    fprintf('Power factor= %.3f; Lagging\n', PF);
elseif Q<0
    fprintf('Power factor= %.3f; Lagging\n', PF);
else
    fprintf('Power factor= %.3f; Unity\n', PF);
end

%%
% Example 8.14: Delta-connected unbalanced load
% Line to line voltages:
% V_AB=120V angle 0deg; V_BC=110V angle 120deg; V_CA=150V angle 240deg;
% Impedances:
% Z1=10 Ohms angle 10deg; Z2=15 Ohms angle -25deg; Z3=20 Ohms angle -10deg; 
% Find: Phase currents I_AB; I_BC; I_CA;
% Find: Line currents I_A; I_B; I_C;
clc;clear;

% Line to line voltages
V_AB=120*cos(0)+i*120*sin(0);
V_BC=110*cos(120*(pi/180))+i*110*sin(120*(pi/180));
V_CA=150*cos(240*(pi/180))+i*150*sin(240*(pi/180));

% Impedances
Z1=10*cos(10*(pi/180))+i*10*sin((pi/180));
Z2=15*cos(-25*(pi/180))+i*15*sin(-25*(pi/180));
Z3=20*cos(-10*(pi/180))+i*20*sin(-10*(pi/180));

% Phase currents
I_AB=V_AB/Z1;
I_BC=V_BC/Z2;
I_CA=V_CA/Z3;
I_AB_mag=abs(I_AB);
I_AB_ang=angle(I_AB)*(180/pi);
I_BC_mag=abs(I_BC);
I_BC_ang=angle(I_BC)*(180/pi);
I_CA_mag=abs(I_CA);
I_CA_ang=angle(I_CA)*(180/pi);
fprintf('Phase currents:\n');
fprintf('I_AB=%.3f A    Angle=%.3f degree\n',I_AB_mag,I_AB_ang);
fprintf('I_BC=%.3f A    Angle=%.3f degree\n',I_BC_mag,I_BC_ang);
fprintf('I_CA=%.3f A    Angle=%.3f degree\n',I_CA_mag,I_CA_ang);

% Line currents
I_A=I_AB-I_CA;
I_B=I_BC-I_AB;
I_C=I_CA-I_BC;
I_A_mag=abs(I_A);
I_A_ang=angle(I_A)*(180/pi);
I_B_mag=abs(I_B);
I_B_ang=angle(I_B)*(180/pi);
I_C_mag=abs(I_C);
I_C_ang=angle(I_C)*(180/pi);
fprintf('Line currents:\n');
fprintf('I_A=%.3f A    Angle=%.3f degree\n',I_A_mag,I_A_ang);
fprintf('I_B=%.3f A    Angle=%.3f degree\n',I_B_mag,I_B_ang);
fprintf('I_C=%.3f A    Angle=%.3f degree\n',I_C_mag,I_C_ang);

%%
% Example 8.15: Delta-connected balanced load
% Line to line voltages:
% V_AB=120V angle 0deg; V_BC=120V angle 120deg; V_CA=120V angle 240deg;
% Impedances:
% Z=10 Ohms angle 10deg
% Find: Phase currents I_AB; I_BC; I_CA;
% Find: Line currents I_A; I_B; I_C;
clc;clear;

% Line to line voltages
V_AB=120*cos(0)+i*120*sin(0);
V_BC=120*cos(120*(pi/180))+i*120*sin(120*(pi/180));
V_CA=120*cos(240*(pi/180))+i*120*sin(240*(pi/180));

% Impedance
Z=10*cos(10*(pi/180))+i*10*sin((pi/180));

% Phase currents
I_AB=V_AB/Z;
I_BC=V_BC/Z;
I_CA=V_CA/Z;
I_p=abs(I_AB);
I_AB_ang=angle(I_AB)*(180/pi);
I_BC_ang=angle(I_BC)*(180/pi);
I_CA_ang=angle(I_CA)*(180/pi);
fprintf('Phase currents:\n');
fprintf('I_AB=%.3f A    Angle=%.3f degree\n',I_p,I_AB_ang);
fprintf('I_BC=%.3f A    Angle=%.3f degree\n',I_p,I_BC_ang);
fprintf('I_CA=%.3f A    Angle=%.3f degree\n',I_p,I_CA_ang);

% Line currents
I_A=I_AB-I_CA;
I_B=I_BC-I_AB;
I_C=I_CA-I_BC;
I_l=abs(I_A);
I_A_ang=angle(I_A)*(180/pi);
I_B_ang=angle(I_B)*(180/pi);
I_C_ang=angle(I_C)*(180/pi);
fprintf('Line currents:\n');
fprintf('I_A=%.3f A    Angle=%.3f degree\n',I_l,I_A_ang);
fprintf('I_B=%.3f A    Angle=%.3f degree\n',I_l,I_B_ang);
fprintf('I_C=%.3f A    Angle=%.3f degree\n',I_l,I_C_ang);

%%
% Example 8.16: Wye connected four wire unbalanced load
% Phase voltages:
% V_AN=120V angle 0deg; V_BN=110V angle 120deg; V_CN=150V angle 240deg;
% Impedances:
% Z1=10 Ohms angle 10deg; Z2=15 Ohms angle -25deg; Z3=20 Ohms angle -10deg; 
% Find: Line to line voltages: V_AB; V_BC; V_CA;
% Find: Phase currents I_AN; I_BN; I_CN;
% Find: Line currents I_A; I_B; I_C;
clc;clear;

% Phase voltages
V_AN=120*cos(0)+i*120*sin(0);
V_BN=110*cos(120*(pi/180))+i*110*sin(120*(pi/180));
V_CN=150*cos(240*(pi/180))+i*150*sin(240*(pi/180));

% Impedances
Z1=10*cos(10*(pi/180))+i*10*sin((pi/180));
Z2=15*cos(-25*(pi/180))+i*15*sin(-25*(pi/180));
Z3=20*cos(-10*(pi/180))+i*20*sin(-10*(pi/180));

% Line to line voltages
V_AB=V_AN-V_BN;
V_BC=V_BN-V_CN;
V_CA=V_CN-V_AN;
V_AB_mag=abs(V_AB);
V_AB_ang=angle(V_AB)*(180/pi);
V_BC_mag=abs(V_BC);
V_BC_ang=angle(V_BC)*(180/pi);
V_CA_mag=abs(V_CA);
V_CA_ang=angle(V_CA)*(180/pi);
fprintf('Phase currents:\n');
fprintf('V_AB=%.3f A    Angle=%.3f degree\n',V_AB_mag,V_AB_ang);
fprintf('V_BC=%.3f A    Angle=%.3f degree\n',V_BC_mag,V_BC_ang);
fprintf('V_CA=%.3f A    Angle=%.3f degree\n',V_CA_mag,V_CA_ang);

% Phase currents
I_AN=V_AN/Z1;
I_BN=V_BN/Z2;
I_CN=V_CN/Z3;
I_AN_mag=abs(I_AN);
I_AN_ang=angle(I_AN)*(180/pi);
I_BN_mag=abs(I_BN);
I_BN_ang=angle(I_BN)*(180/pi);
I_CN_mag=abs(I_CN);
I_CN_ang=angle(I_CN)*(180/pi);
fprintf('Phase currents:\n');
fprintf('I_AN=%.3f A    Angle=%.3f degree\n',I_AN_mag,I_AN_ang);
fprintf('I_BN=%.3f A    Angle=%.3f degree\n',I_BN_mag,I_BN_ang);
fprintf('I_CN=%.3f A    Angle=%.3f degree\n',I_CN_mag,I_CN_ang);

% Line currents
fprintf('Line currents:\n');
fprintf('I_A=%.3f A    Angle=%.3f degree\n',I_AN_mag,I_AN_ang);
fprintf('I_B=%.3f A    Angle=%.3f degree\n',I_BN_mag,I_BN_ang);
fprintf('I_C=%.3f A    Angle=%.3f degree\n',I_CN_mag,I_CN_ang);

%%
% Example 8.17: Wye connected four wire balanced load
% Phase voltages:
% V_AN=110V angle 0deg; V_BN=110V angle 120deg; V_CN=110V angle 240deg;
% Impedances:
% Z=10 Ohms angle 10deg;
% Find: Line to line voltages: V_AB; V_BC; V_CA;
% Find: Phase currents I_AN; I_BN; I_CN;
% Find: Line currents I_A; I_B; I_C;
clc;clear;

% Phase voltages
V_AN=110*cos(0)+i*110*sin(0);
V_BN=110*cos(120*(pi/180))+i*110*sin(120*(pi/180));
V_CN=110*cos(240*(pi/180))+i*110*sin(240*(pi/180));

% Impedances
Z=10*cos(10*(pi/180))+i*10*sin((pi/180));

% Line to line voltages
V_AB=V_AN-V_BN;
V_BC=V_BN-V_CN;
V_CA=V_CN-V_AN;
V_L=abs(V_AB);
V_AB_ang=angle(V_AB)*(180/pi);
V_BC_ang=angle(V_BC)*(180/pi);
V_CA_ang=angle(V_CA)*(180/pi);
fprintf('Line to line currents:\n');
fprintf('V_AB=%.3f A    Angle=%.3f degree\n',V_L,V_AB_ang);
fprintf('V_BC=%.3f A    Angle=%.3f degree\n',V_L,V_BC_ang);
fprintf('V_CA=%.3f A    Angle=%.3f degree\n',V_L,V_CA_ang);

% Phase currents
I_AN=V_AN/Z;
I_BN=V_BN/Z;
I_CN=V_CN/Z;
I_AN_mag=abs(I_AN);
I_AN_ang=angle(I_AN)*(180/pi);
I_BN_mag=abs(I_BN);
I_BN_ang=angle(I_BN)*(180/pi);
I_CN_mag=abs(I_CN);
I_CN_ang=angle(I_CN)*(180/pi);
fprintf('Phase currents:\n');
fprintf('I_AN=%.3f A    Angle=%.3f degree\n',I_AN_mag,I_AN_ang);
fprintf('I_BN=%.3f A    Angle=%.3f degree\n',I_BN_mag,I_BN_ang);
fprintf('I_CN=%.3f A    Angle=%.3f degree\n',I_CN_mag,I_CN_ang);

% Line currents
fprintf('Line currents:\n');
fprintf('I_A=%.3f A    Angle=%.3f degree\n',I_AN_mag,I_AN_ang);
fprintf('I_B=%.3f A    Angle=%.3f degree\n',I_BN_mag,I_BN_ang);
fprintf('I_C=%.3f A    Angle=%.3f degree\n',I_CN_mag,I_CN_ang);

%%
% Example 8.18: Wye connected three wire unbalanced load
% Phase voltages:
% V_AO=120V angle 10deg; V_BO=110V angle 150deg; V_CO=150V angle -50deg;
% Impedances:
% Z1=10 Ohms angle 10deg; Z2=15 Ohms angle -25deg; Z3=20 Ohms angle -10deg; 
% Find: Line to line voltages: V_AB; V_BC; V_CA;
% Find: Line currents I_A; I_B; I_C;
clc;clear;

% Line to line voltages
V_AO=120*cos(10)+i*120*sin(0);
V_BO=110*cos(150*(pi/180))+i*110*sin(150*(pi/180));
V_CO=150*cos(-50*(pi/180))+i*150*sin(-50*(pi/180));

% Impedances
Z1=10*cos(10*(pi/180))+i*10*sin((pi/180));
Z2=15*cos(-25*(pi/180))+i*15*sin(-25*(pi/180));
Z3=20*cos(-10*(pi/180))+i*20*sin(-10*(pi/180));

% Line to line voltages
V_AB=V_AO-V_BO;
V_BC=V_BO-V_CO;
V_CA=V_CO-V_AO;
V_AB_mag=abs(V_AB);
V_AB_ang=angle(V_AB)*(180/pi);
V_BC_mag=abs(V_BC);
V_BC_ang=angle(V_BC)*(180/pi);
V_CA_mag=abs(V_CA);
V_CA_ang=angle(V_CA)*(180/pi);
fprintf('Line to line voltages:\n');
fprintf('V_AB=%.3f A    Angle=%.3f degree\n',V_AB_mag,V_AB_ang);
fprintf('V_BC=%.3f A    Angle=%.3f degree\n',V_BC_mag,V_BC_ang);
fprintf('V_CA=%.3f A    Angle=%.3f degree\n',V_CA_mag,V_CA_ang);

% Line currents
I_A=V_AO/Z1;
I_B=V_BO/Z2;
I_C=V_CO/Z3;
I_A_mag=abs(I_A);
I_A_ang=angle(I_A)*(180/pi);
I_B_mag=abs(I_B);
I_B_ang=angle(I_B)*(180/pi);
I_C_mag=abs(I_C);
I_C_ang=angle(I_C)*(180/pi);
fprintf('Line currents:\n');
fprintf('I_A=%.3f A    Angle=%.3f degree\n',I_A_mag,I_A_ang);
fprintf('I_B=%.3f A    Angle=%.3f degree\n',I_B_mag,I_B_ang);
fprintf('I_C=%.3f A    Angle=%.3f degree\n',I_C_mag,I_C_ang);

%%
% Example 8.19: Wye connected three wire balanced load
% Phase voltages:
% V_AN=120V angle 0deg; V_BN=120V angle 120deg; V_CN=120V angle 240deg;
% Impedances:
% Z=10 Ohms angle 10deg;
% Find: Line to line voltages: V_AB; V_BC; V_CA;
% Find: Line currents I_A; I_B; I_C;
clc;clear;

% Line to line voltages
V_AO=120*cos(10)+i*120*sin(0);
V_BO=120*cos(120*(pi/180))+i*120*sin(120*(pi/180));
V_CO=120*cos(240*(pi/180))+i*120*sin(240*(pi/180));

% Impedances
Z=10*cos(10*(pi/180))+i*10*sin((pi/180));

% Line to line voltages
V_AB=V_AO-V_BO;
V_BC=V_BO-V_CO;
V_CA=V_CO-V_AO;
V_AB_mag=abs(V_AB);
V_AB_ang=angle(V_AB)*(180/pi);
V_BC_mag=abs(V_BC);
V_BC_ang=angle(V_BC)*(180/pi);
V_CA_mag=abs(V_CA);
V_CA_ang=angle(V_CA)*(180/pi);
fprintf('Line to line voltages:\n');
fprintf('V_AB=%.3f A    Angle=%.3f degree\n',V_AB_mag,V_AB_ang);
fprintf('V_BC=%.3f A    Angle=%.3f degree\n',V_BC_mag,V_BC_ang);
fprintf('V_CA=%.3f A    Angle=%.3f degree\n',V_CA_mag,V_CA_ang);

% Line currents
I_A=V_AO/Z;
I_B=V_BO/Z;
I_C=V_CO/Z;
I_A_mag=abs(I_A);
I_A_ang=angle(I_A)*(180/pi);
I_B_mag=abs(I_B);
I_B_ang=angle(I_B)*(180/pi);
I_C_mag=abs(I_C);
I_C_ang=angle(I_C)*(180/pi);
fprintf('Line currents:\n');
fprintf('I_A=%.3f A    Angle=%.3f degree\n',I_A_mag,I_A_ang);
fprintf('I_B=%.3f A    Angle=%.3f degree\n',I_B_mag,I_B_ang);
fprintf('I_C=%.3f A    Angle=%.3f degree\n',I_C_mag,I_C_ang);

%%
% Example 8.20: Inverting amplifier
% Input voltage: V_in=40V;
% Resistances: R1=4 Ohms; R2=2 Ohms;
% Find: Output voltage, V_out;
% Find: Gain, G;
clc;clear;

V_in=40; R1=4; R2=2;
V_out=-(R2/R1)*V_in;
G=V_out/V_in;
fprintf('Output voltage: %.2f V\n', V_out);
fprintf('Gain: %.2f V\n', G);
