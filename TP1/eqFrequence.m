function []=eqFrequence(L, a, r, E, rho)
%Affiche des solutions
%de l'equation en frequence
%pour une poutre de section circulaire
%de longueur L, rayon r, module dYoung E
%et masse volumique rho.

A=pi*r^2;
M=a^3*rho;
m=A*L*rho;
mu=m/M;
KL=linspace(0,20,100);
%La solution de l equation en frequence doit satisfaire:
sols = eq2(KL,mu);

figure(1); hold on;
title('Equation en frequence')
xlabel('KL')
%on plot les solutions:
plot(KL,sols,'r');
plot(KL(1:end-1),diff(sols), 'g--');

signe=sign(sols); %0, 1, -1 selon si 0, + ou -

deriv=diff(signe);

I0=find(abs(deriv)>1);
KL0=KL(I0);

for i=1:length(I0)
KL1(i)=fzero(@(KL) deter(KL,mu),KL0(i));
end

KL2=unique(KL1);
plot([KL2;KL2],[zeros(size(KL2));ones(size(KL2))],'x-b')