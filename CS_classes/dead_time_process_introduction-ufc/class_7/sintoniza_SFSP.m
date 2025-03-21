function [kc,kr,b1,b2]=sintoniza_SFSP(b0,a1,tau,alfa,d,Ts)
 a1a=a1;
 zc=exp(-Ts/tau);
 kc=(a1a-zc)/b0;
 kr=(1-zc)/(a1a-zc);
 b1=(1/(1-a1a))*((1-alfa)^2*kr-a1a^(d-1)*(a1a-alfa)^2);
 b2=(1/(a1a-1))*(a1a*(1-alfa)^2*kr-a1a^(d-1)*(a1a-alfa)^2);
end

