function []=wk(L, a, r, E, rho)
%affiche la pulsation en fonction du nombre d'onde k
%pour une poutre de section circulaire
%de longueur L, rayon r, module dYoung E
%et masse volumique rho.

A=pi*r^2;
M=a^3*rho;
m=A*L*rho;
mu=m/M;
KL=linspace(0,20,100);

sols = eq2(KL, mu);


signe=sign(sols);

deriv=diff(signe);

I0=find(abs(deriv)>1);
KL0=KL(I0);

for i=1:length(I0)
KL1(i)=fzero(@(KL) deter(KL,mu),KL0(i));
end

KL2=unique(KL1);

kn=KL2/L;
w=(E/rho)*kn;

figure (2);
plot(kn,w,'r');
title('La pulsation w en fonction de k')
xlabel('k')
ylabel('w')