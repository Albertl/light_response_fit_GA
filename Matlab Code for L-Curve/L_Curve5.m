function df=L_Curve5(var, P, I)
%% P is photosynthesis
%% I is Light intensity, PAR
%% var is varible for the model

%% L_Curve5-- Prioul and Chartier 1977, Leverenz 1987, 1988, and Levernez et al., 1990

Pm=var(1);
alfa=var(2);
Rd=var(3);
theta=var(4);

P_Predict=alfa.*I+Pm-sqrt((alfa.*I+Pm).^2-4.*alfa.*I.*Pm.*theta);
P_Predict=P_Predict/(2*theta)+Rd;

f=P-P_Predict;
df=sqrt(sum(f.^2)./length(f));
