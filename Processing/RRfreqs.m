function [LFRR, HFRR] = RRfreqs(RR,Fs)
% This function takes a vector of RR-intervals and a sampling rate and
% returns two modified RR vectors: one full of high frequency information
% and one full of low frequency information
Frr = Fs;
NFFTrr = (2^nextpow2(length(RR)))*20; %FFT length depends on the next power of 2
fftRR = fft(RR,NFFTrr);
fftRR = fftRR(1:NFFTrr/2); % Only need one sided signal
fftRRAbs = 1/NFFTrr*abs(fftRR); % Take magnitude and normalize
rrFreq = (0:NFFTrr/2-1)*Frr/NFFTrr; % x axis scaling
figure; plot(rrFreq, fftRRAbs);
title("Frequency Content of RR Intervals (function RRfreqs)")
xlabel("Frequency(Hz)")
ylabel("mV")
xlim([0 1])
ylim([0 .2])
xline(.05);
xline(.15);
xline(.4);

%% Isolate the high frequency portion of RR

    Fstop1 = 0.15;      % First Stopband Frequency
    Fpass1 = 0.155;       % First Passband Frequency
    
    Fpass2 = .395;   % Second Passband Frequency
    Fstop2 = .4;   % Second Stopband Frequency
    
    Astop1 = 80;        % First Stopband Attenuation (dB)
    Apass  = 1;         % Passband Ripple (dB)
    Astop2 = 80;        % Second Stopband Attenuation (dB)
    Fs     = Fs;  % Sampling Frequency  
    h = fdesign.bandpass('fst1,fp1,fp2,fst2,ast1,ap,ast2', Fstop1, Fpass1, ...
                         Fpass2, Fstop2, Astop1, Apass, Astop2, Fs);    
    Hd = design(h, 'butter', ...
        'MatchExactly', 'passband', ...
        'SystemObject', true);
s = double(RR);
HFRR = step(Hd,s);

%% Isolate the low frequency portion of RR
    Fstop1 = 0.045;      % First Stopband Frequency
    Fpass1 = 0.05;       % First Passband Frequency
    Fpass2 = .145;   % Second Passband Frequency
    Fstop2 = .15;   % Second Stopband Frequency
    Astop1 = 80;        % First Stopband Attenuation (dB)
    Apass  = 1;         % Passband Ripple (dB)
    Astop2 = 80;        % Second Stopband Attenuation (dB)
    Fs     = Fs;  % Sampling Frequency  
    h = fdesign.bandpass('fst1,fp1,fp2,fst2,ast1,ap,ast2', Fstop1, Fpass1, ...
                         Fpass2, Fstop2, Astop1, Apass, Astop2, Fs);    
    Hd = design(h, 'butter', ...
        'MatchExactly', 'passband', ...
        'SystemObject', true);

%s = double(RR);
LFRR = step(Hd,s);


end