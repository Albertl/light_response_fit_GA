function P_Predict=L_Curve1_pr(var, P, I)
%% P is photosynthesis
%% I is Light intensity, PAR
%% var is varible for the model

%% L_Curve1-- Baly 1935 rectanguar Hyerbola

Pm=var(1);
alfa=var(2);
Rd=var(3);

P_Predict=Pm.*(alfa.*I./(Pm+alfa.*I))+Rd;

f=P-P_Predict;
df=sqrt(sum(f.^2)./length(f));