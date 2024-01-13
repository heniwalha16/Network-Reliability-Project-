function Pr = calculateProbabilisticIndicator(TT_OD, beta, tt50)
    % TT_OD: 3D matrix of travel times (origin, destination, sample)
    % beta: Threshold travel time
    % tt50: Median travel time for each sample

    Pr=sum(TT_OD > (beta + tt50), 3) / size(TT_OD, 3);
end

