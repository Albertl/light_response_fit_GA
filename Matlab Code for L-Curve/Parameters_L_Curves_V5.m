

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

% the Entry of L-Curve Data

  folder='C:\Users\neill\Desktop\Loren\';  %% Where you put your data--also, in Mac, you need to use '/' instead of '\' in window platform
  fn='Example 1.xlsx';  %% filename for the L-Curve
  fn=[folder fn]; %% the final filename in matlab is a combination of folder path and the exact name of the specific file name
  
  [num txt raw]=xlsread(fn);
  
  
% Specify key parameters from the L-Curve data
% PAR and Photosynthesis rate
id_Photo=9; %% The 9th column is "Photo" measurement
id_PAR=29; %% The 29th column is "PAR" measurement
            %% If for different L-Curve measurement, the id for these two metrics are different, then you need to update the correct ID for them

Photo=num(:,id_Photo);
PAR=num(:,id_PAR);

output=Model_Parameterization_GA(Photo,PAR);
