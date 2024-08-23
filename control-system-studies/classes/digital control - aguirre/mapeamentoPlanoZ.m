% Mapeamento numerico z = exp(sT)
% definir parametros basicos
T = 1; % tempo de amostragem
ws = 2*pi/T; % frequencia de amostragem

% gerar valores aleatorios no semiplano
% esquerdo da faixa primaria ateh s>-2
Rs = rand(1000,1)*2; % parte real
Is = (rand(1000,1)-0.5)*2*(ws/2); % parte imaginaria

% grafico
figure(1)
subplot(211)
plot(Rs,Is,'b.')
axis([-3 1 -ws ws])
xlabel('Re')
ylabel('Im')

% mapeamento p/ plano z
j = sqrt(-1);
Mz = exp(T*Rs); % modulo de z
Ez = T*Is*180/pi; % fase de z
subplot(212)
polarplot(Fz,Mz,'r.')

