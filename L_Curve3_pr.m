function P_Predict=L_Curve3_pr(var, P, I)
%% P is photosynthesis
%% I is Light intensity, PAR
%% var is varible for the model

%% L_Curve3-- Webb et al., 1974

Pm=var(1);
alfa=var(2);
Rd=var(3);

P_Predict=Pm.*(1-exp(-alfa.*I/Pm))+Rd;

f=P-P_Predict;
df=sqrt(sum(f.^2)./length(f));
