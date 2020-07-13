function [rrFs,LFHF,rrPT,rMSSD,hrs] = ecgFeatureExtract(avgHR,RRmanual,RRt,ECG,Fs,showdata)
    rrFs = 60/avgHR; % Rough estimation of RR sample rate. On the order of .75-2 Hz
    LFHF = rrPwrRat(RRmanual,RRt); % Ratio between low and high frequencies!
    [qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin(ECG,Fs,showdata); % Pan_Tompkin algorithm to find peaks.
    rrPT = diff(qrs_i_raw)/Fs; %RR interval in seconds
    rMSSD = rms(diff(rrPT * 1000)); % computed using rr interval values converted to ms
    hrs = 60 * 1./rrPT; % heartrate in BPM according to Pans Tompkin
end