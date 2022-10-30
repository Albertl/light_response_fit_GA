function df=L_Curve7(var, P, I)
%% P is photosynthesis
%% I is Light intensity, PAR
%% var is varible for the model

%% L_Curve7-- Bannister 1979

Pm=var(1);
alfa=var(2);
Rd=var(3);
theta=var(4);

P_Predict=Pm.*(alfa.*I)./((Pm.^theta+(alfa.*I).^theta).^(1/theta))+Rd;

f=P-P_Predict;
df=sqrt(sum(f.^2)./length(f));
