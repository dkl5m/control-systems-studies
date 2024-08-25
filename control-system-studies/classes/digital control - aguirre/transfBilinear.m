% Transformacao bilinear
T = 1; sigma = 0; j = sqrt(-1); % inicializacao
omega = 0:pi/50:2*pi; % faixa de valores de w

% para cada valor de frequencia faca
for k=1:length(omega)
    s=sigma+j*omega(k); % variavel de Laplace
    z(k)=exp(T*s); % valores de z sobre circunferencia
    w(k)=2*(z(k)-1)/(T*(z(k)+1)); % mapeamento bilinear
end

% grafico
set(gca,'Fontsize',18)
xlabel('real')
ylabel('imag')
axis('square')
axis([-1.5 1.5 -1.5 1.5]);
hold on
plot(w,'.')
hold off