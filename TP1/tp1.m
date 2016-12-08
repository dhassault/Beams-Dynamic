%%%%%%%%%%%%%%%%%%%%%%
%%DDSP - TP1        %%
%%Yann LE GUILLY    %%
%%%%%%%%%%%%%%%%%%%%%%

%Affiche successivement l equation en frequence,
%la pulsation w et k, et les modes de vibration.

%on choisit les caracteristiques de la poutre:
L=40;
rho=8000;
E=200e09;
r=2;
a=4;

eqFrequence(L, a, r, E, rho);
wk(L, a, r, E, rho);
modes(L, a, r, E, rho);
