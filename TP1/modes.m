function []=modes(L, a, r, E, rho)
%affiche les modes de vibration
%pour une poutre de section circulaire
%de longueur L, rayon r, module dYoung E
%et masse volumique rho.


A=pi*r^2;
M=a^3*rho;
m=A*L*rho;
mu=m/M;
KL=linspace(0,15,100);
%on definit le x sur la longueur de la poutre
x=linspace(a,L,100);

%Calculs prealables:
sols = eq2(KL,mu);
signe=sign(sols);
deriv=diff(signe);
I0=find(abs(deriv)>1);
KL0=KL(I0);
for i=1:length(I0)
KL1(i)=fzero(@(KL) deter(KL,mu),KL0(i));
end
KL2=unique(KL1);

%on donne les kn:
kn=KL2/L;
%on definit la constante B
B=(KL/mu)*a;

%et on effectue le calcul par n:
figure(3);
for n=1:length(kn)

    Y(n,:)=cos(kn(n)*x)-(B(n))*sin(kn(n)*x); 
   
end

plot(x,Y);
title('Modes de Vibration')
xlabel('x')