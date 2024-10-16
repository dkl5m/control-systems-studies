% parametro
K = [0 logspace(-2,2,29)];
% posicao do zero
z = -3;
% inicializacao matriz que tera as raizes
r = zeros(3,length(K));
% traca os eixos
plot([z 1],[0 0],'k',[0 0],[-10 10],'k')
axis([z 1 -10 10]);
hold on

for j=1:length(K)
    % polinomio em funcao de K
    pol = [1 3 2+K(j) -z*K(j)];
    % raizes do polinomio
    r(:,j)=roots(pol)
    % mostra as raizes para cada valor do K
    % space para avancar
    plot(real(r(:,j)),imag(r(:,j)),'b.')
    pause
end

hold off

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