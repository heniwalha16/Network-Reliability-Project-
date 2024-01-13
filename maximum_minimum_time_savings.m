function [best_benefits,worst_benefits,vot] = maximum_minimum_time_savings(TT_OD,tt50)
    vot = 11.4/60;
    best_benefits = (tt50-min(TT_OD,[],3))*vot;
    worst_benefits = (tt50-max(TT_OD,[],3))*vot;
end
