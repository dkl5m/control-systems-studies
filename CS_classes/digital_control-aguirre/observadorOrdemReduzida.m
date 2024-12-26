% Observador de ordem reduzida
% matrizes de sistema
A = [0 1 0; -0.97 1.80 0; 0 0 0.95];
b = [1; 0; 1];
C = [1 0 0; 0 0 1];

% condicoes iniciais aleatorias do sistema
x(:,1) = [rand(1,1)-0.5, rand(1,1)-0.5, rand(1,1)-0.5];
ruido = 0.2; % desvio padrao do ruido
y(:,1) = C*x(:,1)+randn(2,1)*ruido; % soma ruido as saidas

% condicao inicial observador
xh(1) = rand(1,1)-0.5; % aleatorio

% transicao degrau unitario k = 100
N = 200; % duracao simulacao
u = zeros(N,1);
u(round(N/2):N,1) = ones(N-round(N/2)+1,1);

for k=1:N-1
    % simula sistema
    x(:,k+1) = A*x(:,k)+b*u(k);
    y(:,k+1) = C*x(:,k+1)+randn(1,1)*ruido;

    % simula observador
    xh(k+1) = 0.8*xh(:,k)-2*u(k)+y(1,k+1)+y(2,k+1);
    yh(k+1) = xh(k+1)-0.97*y(1,k)-0.95*y(2,k); % continuacao
end

plot(1:N,x(2,:),'k',1:N,xh,'b-');