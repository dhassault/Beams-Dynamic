%%%%%%%%%%%%%%%%%%%%%%
%%DDSP - TP2        %%
%%Yann LE GUILLY    %%
%%%%%%%%%%%%%%%%%%%%%%

clear all; clc; close all;

g = 2.5; %l unique parametre du probleme
W = linspace(0, 2, 100); %on va fixe W=omega^2
%Tomshenko dabord
for iw=1:length(W)
    sol=roots([g, -(g+1)*W(iw), W(iw)^2-W(iw)]);
    K1(iw)=sol(1);
    K2(iw)=sol(2);
end
figure(1); hold on;
plot(W, K1, 'r');
plot(W, K2, 'b');

%ensuite Euler-Bernouili
KEB = sqrt(W/g); 
plot(W, KEB, 'k');
legend('Tim1', 'Tim2', 'Euler-Bernouilli');
xlabel('W=w^2');
ylabel('K=k^2');
hold off;
%parametres de la poutre
k=1; %longueur d onde

lambda=2*pi/k;
L=2*lambda; %longueur
r=L/35; %hauteur de la poutre
dx=lambda/20; %dx devra etre de l ordre de 10 fois plus petit que k

M=[-k^2, -1i*k; +1i*k, -g*k^2-1]; %1i nombre complexe pour matlab
[V,W]=eig(M); %donne les valeurs propres sous forme de matrice
U=V(1,1);
Th=V(2,1);
W=sqrt(-W(1,1));

%normalisation
nor=U/r;
U=U/nor;
Th=Th/nor;

xG=[0:dx:L];
zG=zeros(size(xG));
xPh=xG;
zPh=r*ones(size(xG));
xPb=xG;
zPb=-zPh;

figure(2); hold on;
axis([-1 14 -0.8 0.8])
plot(xG,zG,'k')
plot(xPh,zPh,'k')
plot(xPb,zPb,'k')
plot([xPb;xPh],[zPb;zPh],'r')
axis([-1 14 -0.8 0.8])
hold off;
figure(3);

t=linspace(0, 3, 100);

for i=1:length(t)
    k=1;
    uG=real(U*exp(1i*k*xG-(W*t(i))));
    thG=real(Th*exp(1i*k*xG-(W*t(i))));

    uPhx=thG.*zPh;   uPbx=thG.*zPb;

    xPht=xPh+uPhx;
    xPbt=xPb+uPbx;

    uPhz=uG; uPbz=uG;

    zPbt=zPb+uPbz;
    zPht=zPh+uPhz;
    subplot(2,1,1)
    plot([xPbt;xPht],[zPbt;zPht],'k',...
        xPht,zPht,'r',...
        xPbt,zPbt,'r')
    axis([-1 14 -0.8 0.8])
    
    
    k=2;
    uG=real(U*exp(1i*k*xG-(W*t(i))));
    thG=real(Th*exp(1i*k*xG-(W*t(i))));

    uPhx=thG.*zPh;   uPbx=thG.*zPb;

    xPht=xPh+uPhx;
    xPbt=xPb+uPbx;

    uPhz=uG; uPbz=uG;

    zPbt=zPb+uPbz;
    zPht=zPh+uPhz;
    subplot(2,1,2)
    plot([xPbt;xPht],[zPbt;zPht],'k',...
        xPht,zPht,'r',...
        xPbt,zPbt,'r')
    axis([-1 14 -0.8 0.8])
    
    F=getframe;
    pause(0.08)

end
movie(F)

for iw=1:length(W);
sol=roots([g,-(g+1)*W(iw)^2,W(iw)^4-W(iw)^2]);
k1(iw)=sol(1);
k2(iw)=-sol(1);
k3(iw)=sol(2);
k4(iw)=-sol(2);
end


figure(4);
hold on;
plot(W,k1,'k');
plot(W,k2,'g');
plot(W,k3,'b');
plot(W,k4,'o');

legend('D1','D2','D3','D4');
xlabel('W=w^2');
ylabel('K');


