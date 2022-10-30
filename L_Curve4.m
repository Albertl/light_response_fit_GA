function df=L_Curve4(var, P, I)
%% P is photosynthesis
%% I is Light intensity, PAR
%% var is varible for the model

%% L_Curve4-- Jassby and Platt 1976

Pm=var(1);
alfa=var(2);
Rd=var(3);

P_Predict=Pm.*tanh(alfa.*I/Pm)+Rd;

f=P-P_Predict;
df=sqrt(sum(f.^2)./length(f));
