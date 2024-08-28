% matrizes do sistema continuo
Ac = [0 1 0 0; 0 -2 0 0; 0 0 -5 0; 0 0 0 -1];
Bc = [0 0; 2 0; 0 0; 0 1];
Cc = [0 0 0 1; 1 0 -1 0];
Dc = zeros(2,2);

T = 0.1; % tempo amostragem
sysc = ss(Ac,Bc,Cc,Dc);
sys = c2d(sysc,T,'zoh');
A = sys.a
B = sys.b
C = sys.c
D = sys.d
