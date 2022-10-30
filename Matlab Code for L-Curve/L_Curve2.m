function df=L_Curve2(var, P, I)
%% P is photosynthesis
%% I is Light intensity, PAR
%% var is varible for the model

%% L_Curve2-- Smith 1936, Talling 1957

Pm=var(1);
alfa=var(2);
Rd=var(3);

P_Predict=Pm.*(alfa.*I./(sqrt(Pm.^2+(alfa.*I).^2)))+Rd;

f=P-P_Predict;
df=sqrt(sum(f.^2)./length(f));
