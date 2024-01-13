% Load the travel time matrix from the TT_link.mat file
load('TT_link.mat');
TT_OD = computeShortestTravelTimes(TT_link);
% Save the TT_OD matrix to a file
save('TT_OD.mat', 'TT_OD');
% Compute mean travel time (M)
mean_travel_time = mean(TT_OD, 3);
M=mean_travel_time;
COV = std(TT_OD, 0, 3) ./ M ;
COV(isnan(COV)) = 0;
[tt10,tt50, tt80, tt90, tt95] = calculatePercentiles(TT_OD);
[lambda_var, Lr, lambda_skew, UIr] = calculateReliabilityIndicators(tt10, tt50, tt90,tt95, TT_OD);
BI = (tt95 - M) ./ M;
tt_freeflow=tt95;
PTI = tt95 / tt_freeflow;
MI = calculateMiseryIndex(TT_OD, tt80, M);
Pr = calculateProbabilisticIndicator(TT_OD, beta=0.1, tt50);
[best_benefits,worst_benefits,vot] = maximum_minimum_time_savings(TT_OD,tt50);

