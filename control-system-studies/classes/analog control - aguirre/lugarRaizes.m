%% Lugar das raizes
% Ex1
close all
j=sqrt(-1);

% numerador planta
num = 1;
% denominador planta
den = poly([0 -2 -4+j*3 -4-j*3]);

% funcao transferencia
sys = tf(num,den);

% lugar das raizes
rlocus(sys)
set(gca,'Fontsize',18)
axis('equal')
axis([-15 5 -10 10])