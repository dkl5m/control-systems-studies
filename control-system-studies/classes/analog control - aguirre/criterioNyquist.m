% numerador planta
num = 40;
% denominador planta
den = poly([2 -10]);
% funcao transferencia planta
sys = tf(num,den);

% diagrama polar
nyquist(sys)
set(gca,'FontSize',18)
axis('equal')
hold on

% diagrama polar (outros valores de ganho)
num = 30;
sys = tf(num,den);
nyquist(sys)
num = 20;
sys = tf(num,den);
nyquist(sys)
num = 10;
sys = tf(num,den);
nyquist(sys)
hold off