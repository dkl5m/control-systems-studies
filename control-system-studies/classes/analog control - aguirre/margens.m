% funcao transferencia malha
% numerador
num = 1;
% denominador
den = poly([-1 -1 0]);
% funcao transferencia
sys = tf(num, den)

% diagrama polar
nyquist(sys)
axis('equal')
set(gca,'FontSize',18)
axis([-1.5 0.5 -1 1])

% pront -dpng margens-1.png

% determinar margens e frequencias
[mg,mf,wmg,wmf] = margin(sys)