function category = categorizeStress(stressVal, evalType)
% This function accepts stress scores and categorizes it into a LEVEL of
% stress
lowerEval = lower(evalType);

switch lowerEval
    case 'cohen'
        if ((stressVal >= 0) && (stressVal <= 13)) % Low stress level
            category = 1;
        elseif ((stressVal > 13) && (stressVal <= 26)) % Mid stress level
            category = 2;
        elseif ((stressVal > 26) && (stressVal <= 40)) % High stress level
            category = 3;
        else % Corrupt Cohen PSS value
            category = 0;
        end
    case {'ardell','ardwell','ard'}
        if ((stressVal > -75) && (stressVal <= -51)) % Nonfunctioning Highly Stressed
            category = 1;
        elseif ((stressVal > -51) && (stressVal <= -25)) % Semifunctioning Moderately Stressed
            category = 2;
        elseif ((stressVal > -25) && (stressVal <= 0)) % Mostly functioning Semi Stressed
            category = 3;
        elseif ((stressVal > 0) && (stressVal <= 24)) % Functioning, Low stress
            category = 4;
        elseif ((stressVal > 24) && (stressVal <= 50)) % High functioning, Low stress
            category = 5;
        elseif ((stressVal > 50) && (stressVal <= 75)) % Superb functioning
            category = 6;
        else % Corrupt Ardwell value
            category = 0;
        end
    case {'totalwellness','tw','scri'}
        if (stressVal <= 1.5) % Below average Coping
            category = 1;
        elseif ((stressVal > 1.5) && (stressVal <= 2.4)) % Average Coping
            category = 2;
        elseif ((stressVal > 2.4) && (stressVal <= 3.4)) % Above Average Coping
            category = 3;
        elseif ((stressVal > 3.4) && (stressVal <= 4)) % Superior coping
            category = 4;
        else % Corrupt TW value
            category = 0;
        end
    otherwise
        fprintf('categorizeStress.m failed to recognize type: %s.\n',evalType);
        category = NaN;
        return;
end
end