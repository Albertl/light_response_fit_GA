

%% Note about the Code and Model

% The goal for this code is to parameterize LUE models from Henry 1993 J.Phycol
% Jin Wu, University of Arizona, 04/15/2014
% Loren P.Albert, University of Arizona, 04/15/2014

% Load L-Curve Data Set, see example excel spreadsheet
% This code is following the example excel spreadsheet, the way in organizing data set, 
% but dosen't matter how many data points are included in the L-Curve 

% Genetic-Algorithm is used here for optimizing the parameter fit.

% See the output for modeled optimal parameters fitted

%%
clc
clear

% Set output file path and file names
filepathout='/Users/lalbert/Documents/Sunflower fluorescence proj/Second sunflowers/Analysis/Light curves/Outputs/';
filenameout_mean='mean_GA_LC_output.csv';
filenameout_std='std_GA_LC_output.csv';
filenameout_all='all_GA_LC_output.csv';
filenameout_length='GA_curve_lengths.csv';

% the import of L-Curve Data

  folder = '/Inputs';  %% Where you put your data--also, in Mac, you need to use '/' instead of '\' in window platform
  % fn = 'Example 1.xlsx';  %% filename for the L-Curve
  % fn=[folder fn]; %% the final filename in matlab is a combination of folder path and the exact name of the specific file name
  
  %[num txt raw]=xlsread(fn);
  run importLCfile1

  
% Specify key parameters from the L-Curve data
% PAR and Photosynthesis rate
incl_ind = 1:find(PARi1>1995,1,'first');
ID_Photo=Photo1(incl_ind); %% Choose the column that is "Photo1" measurement
ID_PAR=PARi1(incl_ind);   %% Choose the column that is "PAR" measurement
            %% If for different L-Curve measurement, the id for these two metrics are different, then you need to update the correct ID for them


  % Check that each file includes a curve (check min and max PAR)
if max(PARi1)-min(PARi1)<500
    warning('curve 1 might be spot measurements')
end

output = Model_Parameterization_GA(ID_Photo, ID_PAR);



% % Alternatively, may want to run multiple times to see if the algorithm
% % produces solutions with much variation.
% 
% % Run model_parametrization 100 times (only doing light curve formulas 1 &
% % 5 now)
% for i=1:100
% output1(i,:)=Model_Parameterization_GA(ID_Photo,ID_PAR);
% end
% 
% % get mean and SD from those 100 runs
% for i=1:length(output1(1,:))
%     output(1,i)=mean(output1(:,i));
%     output_std(1,i)=std(output1(:,i));
% end
% 
% % Make unique leaf ID for matching with other datasets
% addpath('/Users/lalbert/Documents/Sunflower fluorescence proj/Second sunflowers/Analysis/Light curves/Matlab Code for L-Curve')
% Leaf_ID_temp = make_unique_leaf_ID(leaf_tag_color1,plant_number1);
% 
% % These could be incorporated into a for loop (if I ever get it working)
% mean_output=[];
% mean_output=[mean_output; output];
% std_output=[];
% std_output=[std_output; output_std];
% all_output=[];
% all_output=[all_output; output1];
% all_lengths=[];
% all_lengths = [all_lengths; length(ID_PAR)];
% Leaf_ID={};
% Leaf_ID{1}=Leaf_ID_temp{1};
% 
% clear output output1  output_std Leaf_ID_temp
% clear Obs1 HHMMSS1 Treatment1 leaf_tag_color1 plant_number1 FTime1 EBal1 Photo1 Cond1 Ci1 Trmmol1 VpdL1 CTleaf1 Area1 BLC_1 StmRat1 BLCond1 Tair1 Tleaf1 TBlk1 CO2R1 CO2S1 H2OR1 H2OS1 RH_R1 RH_S1 Flow1 PARi1 PARo1 Press1 CsMch1 HsMch1 StableF1 BLCslope1 BLCoffst1 f_parin1 f_parout1 alphaK1 Status1 Fo1 Fm1 Fs1 Fo_prime1 Fm_prime1 NPQ1
%
%
%% Export


% % Export mean of outputs, std of outputs, and all outputs with headers 
% (only set up with headers for light curve 1 and light curve 5) in this version
% 
% % Make matrices of all data to export, with headers
% mean_output_export = dataset({Leaf_ID,'LeafID'}, {mean_output(:,1),'SN1'},{mean_output(:,2),'R2'}, {mean_output(:,3),'P-value'}, {mean_output(:,4),'Maximum Photosynthesis'}, {mean_output(:,5),'LUE_alfa'},...
%     {mean_output(:,6),'Respiration'}, {mean_output(:,29),'SN5'}, {mean_output(:,30),'R2_5'}, {mean_output(:,31),'P-value_5'}, {mean_output(:,32),'Maximum Photosynthesis_5'},{mean_output(:,33),'LUE_alfa_5'},{mean_output(:,34),'Respiration_5'},{mean_output(:,35),'Theta_5'});
% std_output_export = dataset({std_output(:,1),'SN1'},{std_output(:,2),'R2'}, {std_output(:,3),'P-value'}, {std_output(:,4),'Maximum Photosynthesis'}, {std_output(:,5),'LUE_alfa'},...
%     {std_output(:,6),'Respiration'}, {std_output(:,29),'SN5'}, {std_output(:,30),'R2_5'}, {std_output(:,31),'P-value_5'}, {std_output(:,32),'Maximum Photosynthesis_5'},{std_output(:,33),'LUE_alfa_5'},{std_output(:,34),'Respiration_5'},{std_output(:,35),'Theta_5'});
% all_output_export = dataset({all_output(:,1),'SN1'},{all_output(:,2),'R2'}, {all_output(:,3),'P-value'}, {all_output(:,4),'Maximum Photosynthesis'}, {all_output(:,5),'LUE_alfa'},...
%     {all_output(:,6),'Respiration'}, {all_output(:,29),'SN5'}, {all_output(:,30),'R2_5'}, {all_output(:,31),'P-value_5'}, {all_output(:,32),'Maximum Photosynthesis_5'},{all_output(:,33),'LUE_alfa_5'},{all_output(:,34),'Respiration_5'},{all_output(:,35),'Theta_5'});
% curve_lengths = dataset({Leaf_ID,'LeafID'}, {all_lengths(:,1),'curve_lengths'});
% 
% % Export
% outputfilepath = strcat(filepathout,filenameout_mean);
% export(mean_output_export,'File',outputfilepath,'Delimiter',',','WriteVarNames',true)
%   
% outputfilepath = strcat(filepathout,filenameout_std);
% export(std_output_export,'File',outputfilepath,'Delimiter',',','WriteVarNames',true)
% 
% outputfilepath = strcat(filepathout,filenameout_all);
% export(all_output_export,'File',outputfilepath,'Delimiter',',','WriteVarNames',true)
% 
% outputfilepath = strcat(filepathout,filenameout_length);
% export(curve_lengths,'File',outputfilepath,'Delimiter',',','WriteVarNames',true)
% 


