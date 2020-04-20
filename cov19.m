clear all
close all
clc

beta_1=0.500;
beta_2=0.100;
beta_3=0.100;
alpha=0.200;
gamma_1=0.133;
gamma_2=0.125;
gamma_3=0.075;
p_1=0.033;
p_2=0.042;
mu=0.050;
N=1000;

T=366;
ites=1e6;
timespan=linspace(0,365,ites+1);

S=zeros(ites,1);
S(1)=N;
E=zeros(ites,1);
E(1)=1;
I_1=zeros(ites,1);
I_2=zeros(ites,1);
I_3=zeros(ites,1);
R=zeros(ites,1);
D=zeros(ites,1);

for t=1:ites;
    dS=-(beta_1.*I_1(t)+beta_2.*I_2(t)+beta_3.*I_3(t)).*S(t);
    dE=(beta_1.*I_1(t)+beta_2.*I_2(t)+beta_3.*I_3(t)).*S(t)-alpha.*E(t);
    dI_1=alpha.*E(t)-(gamma_1+p_1).*I_1(t);
    dI_2=p_1.*I_1(t)-(gamma_2+p_2).*I_2(t);
    dI_3=p_2.*I_2(t)-(gamma_3+mu).*I_3(t);
    dR=gamma_1.*I_1(t)+gamma_2.*I_2(t)+gamma_3.*I_3(t);
    dD=mu.*I_3(t);
    
    lam=1e-4;
    
    S(t+1)=S(t)+lam.*dS;
    E(t+1)=E(t)+lam.*dE;
    I_1(t+1)=I_1(t)+lam.*dI_1;
    I_2(t+1)=I_2(t)+lam.*dI_2;
    I_3(t+1)=I_3(t)+lam.*dI_3;
    R(t+1)=R(t)+lam.*dR;
    D(t+1)=D(t)+lam.*dD;
end
figure();
plot(timespan,S,'LineWidth',2);
hold on;
plot(timespan,E,'LineWidth',2);
hold on;
plot(timespan,I_1,'LineWidth',2);
hold on;
plot(timespan,I_2,'LineWidth',2);
hold on;
plot(timespan,I_3,'LineWidth',2);
hold on;
plot(timespan,R,'LineWidth',2);
hold on;
plot(timespan,D,'LineWidth',2);
legend('S','E','I_1','I_2','I_3','R','D');
title('Variation of COVID19, use Euler method')
ylim([0,1001]);
    

