function LFRR = rrLow(RR,Fs)
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

s = double(RR);
LFRR = step(Hd,s);


end