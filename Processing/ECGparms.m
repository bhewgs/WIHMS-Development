function [avgHR, maxHR, RR, RRt] = ECGparms(ECG,times,Fs,select,closeWindow)
% Extract some features of interest from the ECG signal. If closeWindow is
% 1, then this function will not leave a figure open upon completion. If
% select = 1, the function will pull an ECG peak threshold target from
% levels[]. It is advised to set select to 0.
wt = modwt(ECG,5);
wtrec = zeros(size(wt));
wtrec(4:5,:) = wt(4:5,:);
ECGwav = imodwt(wtrec,'sym4'); % Find QRS complex from wavelet transform
clear wt wtrec;

signalOfChoice = ECGwav;

N = length(ECG)/Fs; % How many seconds of data do we have at the sampling rate FS?
t = linspace(0,N,length(ECG)); % generate a time vector in seconds
absdata = sort(abs(ECG)); % ECG magnitudes from least to greatest to pick a safe peak detection threshold
abslength = length(absdata); % Last index of ECG data?
threshold = absdata(floor(abslength*.75)); % Threshold at 80th percentile of data

if select == 0 
    hfig = figure;
    plot(t,signalOfChoice);ylim([-500 500]);xlim([0 650]);hold on;
    yline(threshold);
    %pkHeight = input("Select R-R Peak Height For This Set: "); % Manual
    %peak height selection
    pkHeight = threshold;
else
    close all;
    % These levels chosen for the EMBC revision period files. Update
    % accordingly
    levels = [170,180,190,150,190,110,200,200,170,150,180,200,200,200,200,150,200,200,190,200,200,200];
    pkHeight = levels(select);
end
[PKS, LOCS] = findpeaks(signalOfChoice,'MinPeakHeight',pkHeight,'MinPeakDistance',floor(Fs/3)); % find peaks in a chosen signal of given height and separation (original distance 1000)

if (select == 0)
    scatter(LOCS/Fs,PKS);
    ylim([mean(signalOfChoice)-(10*std(signalOfChoice)) mean(signalOfChoice)+(10*std(signalOfChoice))])
    title("QRS Wave Peak Detections")
    xlabel("time (s)")
    ylabel("Amplitude (mV)")
end
if (closeWindow & (select == 0))
    close(hfig);
end
%% RMSSD of middle 80% of data
RR = zeros(1,length(LOCS)-1); % Preallocate space here
RRt = LOCS(1:length(LOCS)-1)/1000;
RR = diff(LOCS)/Fs; % intervals in terms of samples divided by sample time
RRk = sort(RR); % Put samples in order, select 10th percentile to 90th percentile to eliminate outliers
RRcenter = RRk(floor((length(RRk)/10)):floor(9*(length(RRk)/10)));
avgRR = mean(RRcenter); % Average distance between two peaks in seconds
avgHR = 60/avgRR; % Average beats per minute over whole sample


% rmssdTally = 0; % What is the root mean square of successive differences?
% for i = 1:length(RRcenter)-1
%     rmssdTally = rmssdTally + (((RRcenter(i+1))-(RRcenter(i)))^2);
% end
% RMSSD = sqrt(rmssdTally/(length(RRcenter)-1));
%% max HR
maxHR = 0; % sample sets are 10.5 minutes long. What is the highest 1-minute average heartrate?
for i = 1:(length(ECGwav)-(60*Fs)) % roll through 60 second chunks of data spaced 1 second apart
    hr60sec = ECGwav(i:floor(Fs):i+(60*floor(Fs))); % 60 seconds of data
    index = 1;
    buf60 = zeros(1,120);
    currHRbuf = zeros(1,length(buf60)-1);
    for k = 1:length(LOCS)
        if (LOCS(k) > i) && (LOCS(k) < (i+(60*Fs))) % are peak locations within the current 60 seconds of data?
            buf60(index) = LOCS(k); % Fill buf60 with all of the current peak locations
            index = index+1;
        end
    end
    buf60 = nonzeros(buf60); % eliminate the extra space that's left in buf60
    currHRbuf = abs(diff(buf60))/Fs; % peak to peak differences of this 60 second interval THIS IS AN RR VECTOR!
    currHR = 60/mean(currHRbuf); % Heartrate of current 60 seconds of data
    if currHR > maxHR % Is this the highest heartrate we've seen?
       maxHR = currHR; 
    end
end
%RR = RR(floor((length(RR)/10)):floor(9*(length(RR)/10)));
end