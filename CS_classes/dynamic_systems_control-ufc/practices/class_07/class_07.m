clc; clear; close all;

% % (1)
% % (a)
% s = tf('s');
% G = 1/((s+1)*(s+10));
% C1 = -9; C2 = -10; C3 = -11;
% sys1 = feedback(series(C1,G),1);
% sys2 = feedback(series(C2,G),1);
% sys3 = feedback(series(C3,G),1);
% figure(1), step(sys1,'b'), legend('Ganho K=-9');
% figure(2), step(sys2,'r'), legend('Ganho K=-10');
% figure(3), step(sys3,'k'), legend('Ganho K=-11');
% 
% % (b)
% figure(4), rlocus(G);
% C4 = 53.6;
% sys4 = feedback(series(C4,G),1);
% figure(5), step(sys4,'c'), legend('Ganho K=53.6');
% Mp = 0.885/0.841 - 1;
% 
% % (c)
% sisotool(G);

% (2)
% (a)
s = tf('s');
G = 1/((s+1)*(s+5)*(s+7));
% rlocus(G);
K = 49.3; 
Ti1 = 1; Ti2 = 0.1; Ti3 = 0.02; Ti4 = 1.2; Ti5 = 0.8;
C1 = K*(1+1/(Ti1*s));
C2 = K*(1+1/(Ti2*s));
C3 = K*(1+1/(Ti3*s));
C4 = K*(1+1/(Ti4*s));
C5 = K*(1+1/(Ti5*s));
sys1 = feedback(series(C1,G),1);
sys2 = feedback(series(C2,G),1);
sys3 = feedback(series(C3,G),1);
sys4 = feedback(series(C4,G),1);
sys5 = feedback(series(C5,G),1);
figure(1), step(sys1,'b'), legend('Constante de tempo Ti = 1');
figure(2), step(sys2,'r'), legend('Constante de tempo Ti = 0.1');
figure(3), step(sys3,'k'), legend('Constante de tempo Ti = 0.02');
figure(4), step(sys4,'k'), legend('Constante de tempo Ti = 1.2');
figure(5), step(sys5,'r'), legend('Constante de tempo Ti = 0.8');

sisotool(G);







