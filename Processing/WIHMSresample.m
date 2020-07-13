function resampledData = WIHMSresample(dataIn, sampleFreq)
% Resample the input data to have evenly spaced samples
datasize = size(dataIn);

[resampledData(:,2), resampledData(:,1)] = resample(dataIn(:,2),dataIn(:,1)/1000,sampleFreq,'pchip');
for n=3:datasize(2)
    resampledData(:,n) = resample(dataIn(:,n),dataIn(:,1)/1000,sampleFreq,'pchip');
end
end