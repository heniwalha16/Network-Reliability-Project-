function [lambda_var, Lr, lambda_skew, UIr] = calculateReliabilityIndicators(tt10, tt50, tt90,tt95, TT_OD)
    % tt10, tt50, tt90 , tt95: Travel times at 10th, 50th, and 90th and 95th percentiles
    % TT_OD: 3D matrix of travel times (num_stops x num_stops x num_samples)

    mean_speed = 15;
    ttf=tt95
    Lr = mean_speed .* mean(ttf/60);

    % Calculate lambda_var
    lambda_var = (tt90 - tt10) ./ tt50;

    % Calculate lambda_skew
    lambda_skew = (tt90 - tt50) ./ (tt50 - tt10);

    % Calculate UIr
    UIr = lambda_var .* log(lambda_skew) ./ Lr;
end

