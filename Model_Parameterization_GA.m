function output=Model_Parameterization_GA(P,I)
          %% L-Curve 1
           LB = [0    0    -10];
           UB = [40   0.1    0]; 
           Bound = [LB;UB]; 
    
           options = gaoptimset('CreationFcn',@int_pop,'MutationFcn',@int_mutation, ...
    'PopInitRange',Bound,'TolFun',1e-6,'StallGenL',100,'Generations',200, ...
    'PopulationSize',300);

           var= ga(@(var)L_Curve1(var,P,I),3,options);
           output(1,4:6)=var;
           
           P_pred1=L_Curve1_pr(var,P,I);
           [R,p_value]=corrcoef(P,P_pred1);
           output(1,2)=R(1,2).^2;
           output(1,1)=1;
           output(1,3)=p_value(1,2);


          clear var R p_value

           %% L-Curve 2
%            LB = [0    0    -10];
%            UB = [40   0.1    0]; 
%            Bound = [LB;UB]; 
%     
%            options = gaoptimset('CreationFcn',@int_pop,'MutationFcn',@int_mutation, ...
%     'PopInitRange',Bound,'TolFun',1e-6,'StallGenL',100,'Generations',200, ...
%     'PopulationSize',300);
% 
%            var= ga(@(var)L_Curve2(var,P,I),3,options);
%            output(1,11:13)=var;
%            
%            P_pred2=L_Curve2_pr(var,P,I);
%            [R,p_value]=corrcoef(P,P_pred1);
%            output(1,9)=R(1,2).^2;
%            output(1,8)=2;
%            output(1,10)=p_value(1,2);
%            clear var R p_value
% 
% 
            %% L-Curve 3
%            LB = [0    0    -10];
%            UB = [40   0.1    0]; 
%            Bound = [LB;UB]; 
%     
%            options = gaoptimset('CreationFcn',@int_pop,'MutationFcn',@int_mutation, ...
%     'PopInitRange',Bound,'TolFun',1e-6,'StallGenL',100,'Generations',200, ...
%     'PopulationSize',300);
% 
%            var= ga(@(var)L_Curve3(var,P,I),3,options);
%            output(1,18:20)=var;
%            
%            P_pred3=L_Curve3_pr(var,P,I);
%            [R,p_value]=corrcoef(P,P_pred1);
%            output(1,16)=R(1,2).^2;
%            output(1,15)=3;
%            output(1,17)=p_value(1,2);
%            clear var R p_value
% 
% 
            %% L-Curve 4
%            LB = [0    0    -10];
%            UB = [40   0.1    0]; 
%            Bound = [LB;UB]; 
%     
%            options = gaoptimset('CreationFcn',@int_pop,'MutationFcn',@int_mutation, ...
%     'PopInitRange',Bound,'TolFun',1e-6,'StallGenL',100,'Generations',200, ...
%     'PopulationSize',300);
% 
%            var= ga(@(var)L_Curve4(var,P,I),3,options);
%            output(1,25:27)=var;
%            
%            P_pred4=L_Curve4_pr(var,P,I);
%            [R,p_value]=corrcoef(P,P_pred1);
%            output(1,23)=R(1,2).^2;
%            output(1,22)=4;
%            output(1,24)=p_value(1,2);
%            clear var R p_value


           %% L-Curve 5
           LB = [0    0    -10 0.00001];
           UB = [40   0.1    0 1]; 
           Bound = [LB;UB]; 
    
           options = gaoptimset('CreationFcn',@int_pop,'MutationFcn',@int_mutation, ...
    'PopInitRange',Bound,'TolFun',1e-6,'StallGenL',100,'Generations',200, ...
    'PopulationSize',300);

           var= ga(@(var)L_Curve5(var,P,I),4,options);
           output(1,32:35)=var;
           
           P_pred5=L_Curve5_pr(var,P,I);
           [R,p_value]=corrcoef(P,P_pred1);
           output(1,30)=R(1,2).^2;
           output(1,29)=5;
           output(1,31)=p_value(1,2);
           clear var R p_value LB UB


            %% L-Curve 6
%            LB = [0    0    -10 0];
%            UB = [40   0.1    0 1]; 
%            Bound = [LB;UB]; 
%     
%            options = gaoptimset('CreationFcn',@int_pop,'MutationFcn',@int_mutation, ...
%     'PopInitRange',Bound,'TolFun',1e-6,'StallGenL',100,'Generations',200, ...
%     'PopulationSize',300);
% 
%            var= ga(@(var)L_Curve6(var,P,I),4,options);
%            output(1,40:43)=var;
%            
%            P_pred6=L_Curve6_pr(var,P,I);
%            [R,p_value]=corrcoef(P,P_pred1);
%            output(1,38)=R(1,2).^2;
%            output(1,37)=6;
%            output(1,39)=p_value(1,2);
%            clear var R p_value
% 
% 
            %% L-Curve 7
%            LB = [0    0    -10 1];
%            UB = [40   0.1    0 10000]; 
%            Bound = [LB;UB]; 
%     
%            options = gaoptimset('CreationFcn',@int_pop,'MutationFcn',@int_mutation, ...
%     'PopInitRange',Bound,'TolFun',1e-6,'StallGenL',100,'Generations',200, ...
%     'PopulationSize',300);
% 
%            var= ga(@(var)L_Curve6(var,P,I),4,options);
%            output(1,48:51)=var;
%            
%            P_pred7=L_Curve6_pr(var,P,I);
%            [R,p_value]=corrcoef(P,P_pred1);
%            output(1,46)=R(1,2).^2;
%            output(1,45)=7;
%            output(1,47)=p_value(1,2);
%            clear var R p_value
% 
