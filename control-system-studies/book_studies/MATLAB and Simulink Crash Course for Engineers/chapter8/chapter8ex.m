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