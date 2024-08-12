% Dominancia modal 1
%Ex.1
close all; clear

j = sqrt(-1);
% 2 polos em s = -0.7 +- 1j
den = conv([1 0.7+1i],[1 0.7-1i]);
% incluir polo real em s = -2
den = conv(den,[1 2]);
% zero em s = -3;
num = [1 3];

% ganho CC
Kcc = num(end)/den(end);

% analise
[r,p,k] = residue(num,den);
% modo oscilatorio
[numos,denos] = residue(r(2:3),p(2:3),k);
% modo exponencial
[numex,denex] = residue(r(1),p(1),k);

% vetor de tempo
t = 0:0.1:8;

% simula resposta ao degrau total
y = step(num,den,t);
% simula resposta ao degrau modo oscilatorio
yos = step(numos,denos,t);
% simula resposta ao degrau modo exponencial
yex = step(numex,denex,t);

figure(1)
set(gca,'Fontsize',16)
plot(t,y,'k',t,yos,'r',t,yex,'b')
xlabel('t')

%%
%Ex.2
close all; clear

j = sqrt(-1);
% 2 polos em s = -0.7 +- 1j
den = conv([1 0.7+1i],[1 0.7-1i]);
% incluir polo real em s = -2
den = conv(den,[1 2]);
% zeros em s = -0.5 +- 1j
num = conv([1 0.5+1i],[1 0.5-1i]);


% ganho CC
Kcc = num(end)/den(end);

% analise
[r,p,k] = residue(num,den);
% modo oscilatorio
[numos,denos] = residue(r(2:3),p(2:3),k);
% modo exponencial
[numex,denex] = residue(r(1),p(1),k);

% vetor de tempo
t = 0:0.1:8;

% simula resposta ao degrau total
y = step(num,den,t);
% simula resposta ao degrau modo oscilatorio
yos = step(numos,denos,t);
% simula resposta ao degrau modo exponencial
yex = step(numex,denex,t);

figure(1)
set(gca,'Fontsize',16)
plot(t,y,'k',t,yos,'r',t,yex,'b')
xlabel('t')
