% sistema discreto: Diagrama de blocos p/ espaco de estados
% matrizes do sistema continuo
% Ex.1
Ac = [0 1 0 0; 0 -2 0 0; 0 0 -5 0; 0 0 0 -1];
Bc = [0 0; 2 0; 0 0; 0 1];
Cc = [0 0 0 1; 1 0 -1 0];
Dc = zeros(2,2);

T = 0.1; % tempo amostragem
sysc = ss(Ac,Bc,Cc,Dc); % sistema tempo continuo
sys = c2d(sysc,T,'zoh'); % sistema tempo discreto
A = sys.a
B = sys.b
C = sys.c
D = sys.d

%%
% Ex.2
% matrizes espaco de estado discreto correspondente
% a parte continua do diagrama de blocos
T = 0.1; % tempo amostragem
A = [1 1-exp(-T); 0 exp(-T)];
b = [T T-1+exp(-T); 0 1-exp(-T)]*[0; 10];
c = [1 0];
d = 0;

% matrizes que incluem controlador
A1 = [A(1,:) 0; A(2,:) 0; 0 0 0 0.9];
b1 = [b;0]; b2 = [0; 0; 1];
c1 = [-1 0 0]; c2= [0 0 0 0.01];
d1 = 1; d2 = [0.9];

% matrizes estado sistema completo
AA = A1 + b1*(c2+d2*c1) + b2*c1;
bb = b1*d2*d1 + b2*d1;
cc = [c 0];
sys = ss(AA,bb,cc,0,-1);
y = step(sys, 100);

%%
% Ex.2
% solucao via funcao de transferencia
% funcao transferencia de pulsos
nump = 10*[T-1+exp(-T) 1-exp(-T)-T*exp(-T)];
denp = conv([1 -1], [1 -exp(-T)]);

% funcao transferencia controlador
numd = [0.9 -0.8];
dend = [1 -0.9];

% funcao transferencia ramo direto
num = conv(numd, nump);
den = conv(dend, denp);
MA = tf(num, den, -1);

% funcao transferencia malha fechada
MF = feedback(MA, 1);
yft = step(MF, 100);
plot(1:100, y, 'ko', 1:100, yft, 'k+');