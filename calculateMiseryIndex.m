function MI = calculateMiseryIndex(TT_OD, tt80, M)
    % TT_OD: 3D matrix of travel times (origin, destination, sample)
    % tt80: 80th percentile travel time for each sample
    % Find values in TT_OD that are greater than TT80
    TT_OD_greater_than_TT80 = TT_OD > tt80;

    % Mask out values not greater than TT80 and take the mean along the third dimension
    TT_OD_filtered = TT_OD .* TT_OD_greater_than_TT80;
    MI = (mean(TT_OD_filtered, 3)-M)/M;
end

