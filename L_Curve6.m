function df=L_Curve6(var, P, I)
%% P is photosynthesis
%% I is Light intensity, PAR
%% var is varible for the model

%% L_Curve6-- Chalker 1980

Pm=var(1);
alfa=var(2);
Rd=var(3);
theta=var(4);

x1=exp(alfa.*I.*(1+theta));

P_Predict=Pm.*((x1-1)./(x1+theta))+Rd;

f=P-P_Predict;
df=sqrt(sum(f.^2)./length(f));
