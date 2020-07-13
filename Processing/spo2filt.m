function cleanData = spo2filt(data,Fs) % This function attempts to remove the baseline wander from the MAX30102 measurements

    Fstop1 = .01;      % First Stopband Frequency
    Fpass1 = .02;       % First Passband Frequency
    Fpass2 = (Fs/2)-1;   % Second Passband Frequency
    Fstop2 = Fs/2;   % Second Stopband Frequency
    Astop1 = 80;        % First Stopband Attenuation (dB)
    Apass  = 1;         % Passband Ripple (dB)
    Astop2 = 80;        % Second Stopband Attenuation (dB)
    Fs     = Fs;  % Sampling Frequency  
    h = fdesign.bandpass('fst1,fp1,fp2,fst2,ast1,ap,ast2', Fstop1, Fpass1, ...
                         Fpass2, Fstop2, Astop1, Apass, Astop2, Fs);    
    Hd = design(h, 'butter', ...
        'MatchExactly', 'passband', ...
        'SystemObject', true);
s = double(data);
cleanData = step(Hd,s);

end