function [smoothTemp,tDiffs,diffMax,diffMin,domFreq] = tempProc(data,Fs);
    smoothTemp = smoothdata(data,'movmed'); % First pass median filter
    smoothTemp = smoothdata(smoothTemp,'movmed'); % Second pass median filter
    domFreq = get_dom_freqs(data,Fs);
    tDiffs = diff(smoothTemp);
    diffMax = max(tDiffs);
    diffMin = min(tDiffs);
end