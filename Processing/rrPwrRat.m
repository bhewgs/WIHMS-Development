function pwrRatio = rrPwrRat(RR,RRt)

[pxx, f] = plomb(RR,RRt); % Original lomb scargle
RRmat = [RRt; RR]; % Put this in a matrix so we can eliminate artificially high or low values
[~,inx]=sort(RRmat(2,:)); % Sort RRmat by values of RR
RRmat = RRmat(:,inx);
RRmat = RRmat(:,(floor((length(RR)/10)):floor(9*(length(RR)/10)))); % Delete lower and upper 10% of data
[~,inx]=sort(RRmat(1,:)); % Resort RRmat by time index
RRmat = RRmat(:,inx);
RRt = RRmat(1,:); % Place these truncated time values back into time vector
RR = RRmat(2,:); % Place truncated RR values back into RR vector
RRtint = linspace(min(RRt),max(RRt),5*length(RRt)); % Interpolate both time and RR vect
RRint = interp1(RRt,RR,RRtint,'linear');
[pxxint, fint] = plomb(RRint,RRtint); % Lomb scargle of interpolated data


% figure; subplot(2,1,2); %plot(f,pxx);hold on;
% plot(fint,pxxint); xlim([0, .5]);ylim([0 .01]);
% xline(.05);
% xline(.15);
% xline(.4);
% xlabel("Frequency (Hz)")
% ylabel('Voltage (V)');
% title('Lomb-Scargle Frequency Spectrum of ECG');

[minVal,minIdx]=min(abs(fint-.05)); % find index of closest freq. val to .05
[medVal,medIdx]=min(abs(fint-.15)); % find index of closest freq. val to .15
[highVal,highIdx]=min(abs(fint-.5)); % find index of closest freq. val to .4

lowfreq = pxxint(minIdx:medIdx); % Spectral power only from .05-.15Hz
highfreq = pxxint(medIdx:highIdx); % Spectral power only from .15-.4Hz
lfrr = trapz(lowfreq); % Integrate power from .05-.15 Hz
hfrr = trapz(highfreq); % Integrate power from .15-.4 Hz
pwrRatio = lfrr/hfrr; % Power ratio between low and high freq

end