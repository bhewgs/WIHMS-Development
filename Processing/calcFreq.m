% This function takes a vector of microsecond timestamps and returns the
% median sampling frequency of the dataset
function [sampfreq, timevect] = calcFreq(timeData)
for i = 1:length(timeData)-1
    times(i) = timeData(i+1,1)-timeData(i,1);
end
times = sort(times);
tcent = times(floor((length(times)/10)):floor(9*(length(times)/10)));
samptime = mean(tcent)/1000;

%samptime = median(times)/1000000; %times are in microseconds, so divide by 1mil to get seconds
sampfreq = 1/samptime;
if sampfreq<10
    sampfreq = sampfreq*1000;
end
timevect = timeData/(1000);
clear times i;
finStr = sprintf("Calculated sampling frequency: %.2d Hz",sampfreq);
disp(finStr)
end