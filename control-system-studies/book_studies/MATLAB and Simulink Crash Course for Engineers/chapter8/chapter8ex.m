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
