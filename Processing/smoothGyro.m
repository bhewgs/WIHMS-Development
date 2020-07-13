function [smoothGyroData,exdiffs,indiffs, amps, resprate, respfreq] = smoothGyro(data,Fs,disp)
smoothGyroData = smoothdata(data,'gaussian'); % Gaussian window filter
smoothGyroData = smoothdata(smoothGyroData,'movmean'); % secondary window

[gyroPksP,gyroLocsP] = findpeaks(smoothGyroData,'MinPeakDistance',floor(Fs),'MinPeakProminence',max(smoothGyroData)/4); % Positive respiration pks,locs
[gyroPksN,gyroLocsN] = findpeaks(-smoothGyroData,'MinPeakDistance',floor(Fs),'MinPeakProminence',max(smoothGyroData)/4); % Negative respiration pks,locs
gyroPksN = -gyroPksN;

% t=linspace(0,length(data)/Fs,length(data));
% gyroGauss = smoothdata(data,'gaussian'); % Gaussian window filter
% gyroFin = smoothdata(smoothGyroData,'movmean'); % secondary window
% figure;subplot(3,1,1);
% plot(t,data);
% xlim([90 120]);
% title('Gyroscope Data: Raw');
% %xlabel('Time(s)');
% subplot(3,1,2);
% plot(t,gyroGauss);
% xlim([90 120]);
% title('Gyroscope Data: Gaussian Filter Applied');
% %xlabel('Time(s)');
% ylabel(['Rotation ((' char(176) '/s)*100)']);
% subplot(3,1,3);
% plot(t,gyroFin);
% xlim([90 120]);
% title('Gyroscope Data: Mean Filter Applied');
% xlabel('Time(s)');
% ylim([-600 500]); hold on;
% scatter(gyroLocsP/Fs,gyroPksP,'k');hold on;
% scatter(gyroLocsN/Fs,gyroPksN,'k');

%% Amplitudes between peaks and valleys?
if (length(gyroPksP) >= length(gyroPksN)) % More inhales than exhales
   amps = zeros(1,length(gyroPksN)-1);
   for i=1:length(amps)
       amps(i) = gyroPksP(i)-gyroPksN(i); % Amplitude of breath
   end
elseif (length(gyroPksP) < length(gyroPksN)) % More exhales than inhales
   amps = zeros(1,length(gyroPksP)-1);
   for i=1:length(amps)
       amps(i) = gyroPksP(i)-gyroPksN(i); % Amplitude of breath
   end
end

if (disp) % Show what's happening
    figure; plot(smoothGyroData); hold on; 
    scatter(gyroLocsP,gyroPksP);hold on;
    scatter(gyroLocsN,gyroPksN);
end
% Differences between inhale peak locations - indicate changes in breathing
% or holding of breath
indiffs = diff(gyroLocsP); % How far apart is each inhalation peak?
exdiffs = diff(gyroLocsN); % How far apart is each exhalation peak?

% Respiration Rate?
timelength = length(data)/(Fs*60); % Duration of file in minutes
resprate = length(gyroPksP)/timelength; % Breaths per minute
respfreq = get_dom_freqs(smoothGyroData,floor(Fs)); % Dominant frequency of respiration
end