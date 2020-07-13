% This function calculates 

function ECG60 = ECGcalc(ECG, Fs)

for i = 2:length(ECG)-1
    if isequalwithequalnans(ECG(i),NaN) % replace NAN values in timestamp with zeros
        %ECG(i) = 1/2*(ECG(i-1)+ECG(i+1)); % first order interpolator in the case of any NaN values
        ECG(i) = (ECG(i-1));
    end
    if isnumeric(ECG(i)) == 0
        ECG(i) = (ECG(i-1));
    end
end

ECGv = (ECG/1024) * 5000; % convert to millivolts - 1024 ADC counts over 5 volts
ECGnorm = ECGv - nanmean(ECGv); % mean subtraction to remove DC bias
stdev = std(ECGnorm); % standard deviation of original ECG signal (after NaN removal)

for i = 2:length(ECGnorm)-1
    if abs(ECGnorm(i)) > (abs(ECGnorm(i-1))+(100)) % clearly a corrupted sample that didn't become a NaN
        ECGnorm(i) = 1/2*(ECGnorm(i-1)+ECGnorm(i+1)); % first order interpolator in the case of any NaN values
    end
end

N = length(ECG)/Fs; % How many seconds of data do we have at the sampling rate FS?
t = linspace(0,N,length(ECG)); % generate a time vector in seconds

% .5-85 Hz Butterworth bandpass filter
ECGfilt = firstPass(ECGnorm, Fs);

% elliptic bandstop filter to remove 60Hz mains noise
ECG60 = remove60hz(ECGfilt, Fs);

% FFT of output data
Ts = 1/Fs;
NFFT = 2^nextpow2(length(ECGnorm)); %FFT length depends on the next power of 2
freqfft = (0:NFFT/2-1)*Fs/NFFT; % x axis scaling

fftRaw = fft(ECGnorm,NFFT); % calculate some FFT parameters here
fftRaw = fftRaw(1:NFFT/2); % Only need one sided signal
fftRaw = 1/NFFT*abs(fftRaw); % Take magnitude and normalize

fftBand = fft(ECGfilt,NFFT); % calculate some FFT parameters here
fftBand = fftBand(1:NFFT/2); % Only need one sided signal
fftBand = 1/NFFT*abs(fftBand); % Take magnitude and normalize

fft60 = fft(ECG60,NFFT); % calculate some FFT parameters here
fft60 = fft60(1:NFFT/2); % Only need one sided signal
fft60Abs = 1/NFFT*abs(fft60); % Take magnitude and normalize

%Show what we're working with data-wise
% figure;
% subplot(3,1,1);
% semilogx(freqfft,fftRaw,'k');
% title("ECG Spectrum: Raw");
% xlim([0.1 100])
% xlabel("Frequency (Hz)");
% ylabel("Magnitude (mV)");
% subplot(3,1,2);
% semilogx(freqfft,(fftBand),'k');
% title("ECG Spectrum: Bandpass Filtered");
% xlim([0.1 100])
% xlabel("Frequency (Hz)");
% ylabel("Magnitude (mV)");
% subplot(3,1,3);
% semilogx(freqfft,(fft60Abs),'k');
% title("ECG Spectrum: 60Hz Removed");
% xlim([0.1 100])
% xlabel("Frequency (Hz)");
% ylabel("Magnitude (mV)");
end