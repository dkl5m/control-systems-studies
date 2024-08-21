% Margens de ganho e de fase
% Ex.1
close all; clear;

% funcao transferencia malha
num = 1; % numerador
den = poly([-1 -1 0]); % denominador
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

%% Ex.2 - Usando Bode
close all; clear;

% funcao transferencia malha
num = 1;
den = conv([1 1],[1 1]); % 2 polos em s=-1
den = conv(den,[1 0]); % acrescimo polo em s=0
GH = tf(num,den)

% diagrama polar
figure(1)
nyquist(GH)
axis('equal')
axis([-1.5 0.5 -1 1])

% diagrama Bode
figure(2)
bode(GH)
grid

margin(GH)