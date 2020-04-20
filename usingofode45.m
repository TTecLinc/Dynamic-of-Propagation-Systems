N=1000;
S=N;
E=1;

% alpha_1 = 1/IncubPeriod;
% gamma_1 = (1/DurMildInf).*FracMild; 
% p_1 = (1/DurMildInf)-gamma_1; 
% p_2 = (1/DurHosp).*(FracCritical/(FracSevere + FracCritical)); 
% gamma_2 = (1/DurHosp)-p_2;
% mu= (1/TimeICUDeath).*(CFR/FracCritical); 
% gamma_3 = (1/TimeICUDeath)-mu;



figure();
[T,Y]=ode45('dcov19',[0 100], [S E 0 0 0 0 0]);
plot(T,Y(:,1),'LineWidth',2)
hold on;
plot(T,Y(:,2),'LineWidth',2)
hold on;
plot(T,Y(:,3),'LineWidth',2)
hold on;
plot(T,Y(:,4),'LineWidth',2)
hold on;
plot(T,Y(:,5),'LineWidth',2)
hold on;
plot(T,Y(:,6),'LineWidth',2)
hold on;
plot(T,Y(:,7),'LineWidth',2)
legend('S','E','I_1','I_2','I_3','R','D');
title('Variation of COVID19, use ode45 R_0=1');
ylim([0,1001]);
