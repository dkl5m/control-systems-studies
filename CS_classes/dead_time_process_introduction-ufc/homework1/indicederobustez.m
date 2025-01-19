%% Indice de robustez
Ts=0.01;
z = tf('z', Ts);
% Incerteza multiplicativa
wz = logspace(-1,log10(pi/Ts),1000);
dP = abs(freqresp((Gz - Gz*z^-1),wz))./abs(freqresp(Gz*z^-1,wz));
dP = squeeze(dP(1,1,:));

aux = log10(pi/Ts);
n = 1000;
w = logspace(-2,aux,n);
Ir = zeros(1,n);
for k = 1:n
    zw = freqresp(z,w(k));
    Gzw = zw^(-1)*(0.4+0.6*zw^-1)/(1 - 0.8*zw^-1);
    V = K*E + (K*F-K*E*H)*((zw*eye(size(A))-A+D*H )\D);
    ir = (Gzw*V\((K*F)*((zw*eye(size(A))-A)\B)+1))*(1-zw^(-1));
    Ir(:,k) = abs(ir);
end
