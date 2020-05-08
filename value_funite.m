global vlast1 vlast2 beta delta theta k0 kt At p1 p2
hold off
hold all
%set initial conditions
vlast1=20.*ones(1,40);
vlast2 = vlast1;
k0=0.4:0.4:16;
kt11=k0;
kt12=k0;
beta=.98;
delta=.1;
theta=.36;
A1=1.75;
p1=.8;
p2=1-p1;
A2=.75;
numits=250;
%begin the recursize calculations
for k=1:numits
    for j=1:40
        kt=k0(j);
        At=A1;
        %find the maximum of the value function
        z=fminbnd(@valfun,0,16);
        v1(j)=-valfun(z);
        kt11(j)=z;
        At=A2;
        %find the maximum of the value function
        z=fminbnd(@valfun,0,16);
        v2(j)=-valfun(z);
        kt12(j)=z;
    end
    if k/20 ==round(k/20)
        plot(k0,v1,k0,v2)
        hold on;
    end
vlast1=v1;
vlast2=v2;
end
figure();
%plot the final policy function
plot(k0,kt11,k0,kt12)