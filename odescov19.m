function dy=dcov19(t,y)
    dy=zeros(7,1);
    
    beta_2=0.100;
    beta_3=0.100;
    alpha=0.200;
    gamma_1=0.133;
    gamma_2=0.125;
    gamma_3=0.075;
    p_1=0.033;
    p_2=0.042;
    mu=0.050;
    % The caculation of beta1, base on the fomula of alhill.sh website
    
    %N=1000;
    %according to the measures we take in our city, 
    %then we can fine-tuning the paras R_0
    %hypoths is 6page grap.3.5 1.8 1.1
    %R_0=3.9;
    %R_0=1.8;
    R_0=0.1;
    beta_1=R_0.*(p_1+gamma_1)-p_1/(p_2+gamma_2).*(beta_2+beta_3.*p_2/(mu+gamma_3));
    %disp('beta_1');
    %disp(beta_1);
    
    %S-1
    dy(1)=-(beta_1.*y(3)+beta_2.*y(4)+beta_3.*y(5)).*y(1);
    %E-2
    dy(2)=(beta_1.*y(3)+beta_2.*y(4)+beta_3.*y(5)).*y(1)-alpha.*y(2);
    %I1-3
    dy(3)=alpha.*y(2)-(gamma_1+p_1).*y(3);
    %I2-4
    dy(4)=p_1.*y(3)-(gamma_2+p_2).*y(4);
    %I3-5
    dy(5)=p_2.*y(4)-(gamma_3+mu).*y(5);
    %R-6
    dy(6)=gamma_1.*y(3)+gamma_2.*y(4)+gamma_3.*y(5);
    %D-7
    dy(7)=mu.*y(5);
end

