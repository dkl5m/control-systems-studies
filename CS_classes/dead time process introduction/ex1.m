clear; close; clc;

num = 2;
den = conv([1 1],[1 3]);

MP = 0.05;              % max overshoot
zeta = 0.7;             % damping ratio
sigma = 0.75;            
t5 = 3/sigma;           % tempo acomodacao 5%
theta = acosd(zeta);

c1 = sigma;
c2 = 1 - sigma;
c3 = 3 - sigma;
alpha1 = 180 - theta;
alpha2 = atand(sigma/c2);
alpha3 = atand(sigma/c3);
beta = 180 - (alpha1+alpha2+alpha3);
o = tan(beta)*sigma;
cbeta = sigma/tand(beta);
z = 1 + o;

d1 = sqrt((sigma^2)+(c1^2));
d2 = sqrt((sigma^2)+(c2^2));
dbeta = sqrt((sigma^2)+(c2+cbeta)^2);
d3 = sqrt((sigma^2)+(c2+cbeta+c3)^2);

K = (d1*d2*d3)/dbeta;
% K = 3
numC =[1 z];
denC = [1 0];
G = tf(num,den)
KG = tf(3*num,den)
C = tf(K*numC,denC)
GC = feedback(G*C,1)
figure
step(G)
% figure
% step(KG)
figure
step(C)
figure
step(GC)

%%
clear; close; clc;

num = 2;
den = conv([1 (1+e)],[1 3]);

MP = 0.05;              % max overshoot
zeta = 0.7;             % damping ratio
sigma = 0.75;            
t5 = 3/sigma;           % tempo acomodacao 5%
theta = acosd(zeta);

c1 = sigma;
c2 = 1 - sigma;
c3 = 3 - sigma;
alpha1 = 180 - theta;
alpha2 = atand(sigma/c2);
alpha3 = atand(sigma/c3);
beta = 180 - (alpha1+alpha2+alpha3);
o = tan(beta)*sigma;
cbeta = sigma/tand(beta);
z = 1 + o;

d1 = sqrt((sigma^2)+(c1^2));
d2 = sqrt((sigma^2)+(c2^2));
dbeta = sqrt((sigma^2)+(c2+cbeta)^2);
d3 = sqrt((sigma^2)+(c2+cbeta+c3)^2);

% K = (d1*d2*d3)/dbeta;
% K = 3
K = 2 + 2*e
numC =[1 z];
denC = [1 0];
