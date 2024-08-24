% Transformada modificada z inversa
% Eq. de diferencas
close all;clear;

T = 1; % tempo amostragem
m = 0.6; % parametro transformada
a = 0.2; % parametro do sinal em tempo continuo
N = 15; % numero de iteradas a computar

num= [a]; % numerador func.transf. em tempo continuo
den = conv([1 0],[1 a]); % denominador func.transf. em tempo continuo
t = 0:0.01:N*T; % vetor de tempo
y = step(num,den,t); % resposta degrau ao sistema continuo

% coeficientes equacoes de diferencas
A = 1 - exp(-a*m*T);
B = exp(-a*m*T)-exp(-a*T);
C = 1 + exp(-a*T);
D = exp(-a*T);
E = 1 - exp(-a*T);

u = ones(1,N); % sinal de entrada: degrau unitario
% condicoes iniciais
x(1) = y(m*100+1);
x(2) = y(m+1)*100 + 1;
x2(1) = y(1);
x2(2) = y(101);

% simulacao eq. de diferencas
for k = 3:N+1
    % da transformada z classica
    x2(k) = C*x2(k-1) - E*x2(k-2) + D*u(k-1);
    % da transformada z modificada
    x(k) = C*x(k-1) - D*x(k-2) + A*u(k-1) + B*u(k-2);
end
Te = m*T:T:(m+N)*T; % vetor de tempo deslocado
plot(t,y,'k',Te,x,'k+',0:N,x2,'k.','MarkerSize',10) 
