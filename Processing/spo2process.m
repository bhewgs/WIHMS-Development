function [poxROCPosRed, poxROCNegRed, poxROCPosIr, poxROCNegIr, spo2calc, spo2New, domFreqRed, domFreqIR] = spo2process(spo2Red,spo2IR,winlen,Fs,plotty)

poxIR = spo2IR;
poxIR = medfilt1(poxIR,8);
poxIR = smoothdata(poxIR,'movmed',5);
domFreqIR = get_dom_freqs(poxIR,(Fs));

poxRed = spo2Red;
poxRed = medfilt1(poxRed,8);
poxRed = smoothdata(poxRed,'movmed',5);
domFreqRed = get_dom_freqs(poxRed,(Fs));

%% Preallocate memory for each parameter
dcRed = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
dcIR = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
acRed = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
acIR = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
rmsRed = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
rmsIR = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
spo2 = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
redDerPos = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
redDerNeg = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
irDerPos = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));
irDerNeg = zeros(1,ceil((length(poxRed)-(winlen*Fs))/Fs));


%%
ind = 1; % Index location in vector of 1 minute window stats
for i=1:floor(Fs):(length(poxRed)-(winlen*Fs)) % 1 minute moving window
        red60pos = poxRed(i:i+(winlen*floor(Fs))); % winlen seconds of data from red     
        red60neg = -red60pos; % Invert data to still use findpeaks to find valleys
        ir60pos = poxIR(i:i+(winlen*floor(Fs))); % 60 seconds of data from IR
        ir60neg = -ir60pos; % Invert data to still use findpeaks to find valleys
        
        % Find peaks and their locations
        [redpksP, redlocsP] = findpeaks(red60pos,'MinPeakDistance',floor(Fs/2)); % Positive red peaks and locations
        [redpksN, redlocsN] = findpeaks(red60neg,'MinPeakDistance',floor(Fs/2)); % Negative red peaks and locations
        [irpksP, irlocsP] = findpeaks(ir60pos,'MinPeakDistance',floor(Fs/2)); % Positive IR peaks and locations
        [irpksN, irlocsN] = findpeaks(ir60neg,'MinPeakDistance',floor(Fs/2)); % Negative IR peaks and locations
        redpksN = -redpksN; irpksN = -irpksN; % Invert negative peaks to return them to minimums        
        redlower = min([length(redpksP) length(redpksN)]); % red window might not have same # peaks and valleys
        acRedDiff = redpksP(1:redlower)-redpksN(1:redlower);  % What are all the AC levels for this 1 minute window?      
        irlower = min([length(irpksP) length(irpksN)]); % IR window might not have same # peaks and valleys
        acIrDiff = irpksP(1:irlower)-irpksN(1:irlower);   % What are all the AC levels for this 1 minute window?
        
%% Find amplitudes between peaks and vallies
        redlimit = min([length(redpksP),length(redpksN)]); % Length of shorter vector - avoid exceeding boundaries
        irlimit = min([length(irpksP),length(irpksN)]); % Length of shorter vector - avoid exceeding boundaries
        maximaRed = zeros(1,redlimit);
        maximaIR = zeros(1,irlimit);
        for j=1:redlimit % Avoid exceeding bounds
            maximaRed(j) = redpksP(j)-redpksN(j); % There are more positive peaks - start with positive
        end
        clear j;
        
        for j=1:irlimit
            maximaIR(j) = irpksP(j)-irpksN(j); % More negative peaks - start with negative
        end
        clear j;
        
        
        
        
        % Dichrotic Peaks
        [dicRedPks, dicRedLocs] = findpeaks(red60pos,'MinPeakProminence',min(redpksN)+.3*mean(abs(maximaRed))); % Positive red peaks and locations
        [dicIrPks, dicIrLocs] = findpeaks(ir60pos,'MinPeakProminence',min(irpksN)+.3*mean(abs(maximaIR))); % Positive IR peaks and locations

        %%
        % Take first derivatives between all local extrema
        posInd = 1;
        redDerPH = [];
        redDerNH = [];       
        minPk = min(length(redpksP),length(redpksN));
        for n = 1:minPk-3
        if (redlocsP(n)-redlocsN(n)) > 0
            firstDiffP = (redpksP(n)-redpksN(n))/(redlocsP(n)-redlocsN(n));
            firstDiffN = (redpksP(n+1)-redpksN(n))/(redlocsP(n+1)-redlocsN(n));
            redDerPH(posInd) = firstDiffP;
            redDerNH(posInd) = firstDiffN;
            posInd = posInd + 1;
        elseif (redlocsP(n)-redlocsN(n)) < 0
            firstDiffP = (redpksP(n+1)-redpksN(n))/(redlocsP(n+1)-redlocsN(n));
            firstDiffN = (redpksP(n)-redpksN(n))/(redlocsP(n)-redlocsN(n));
            redDerPH(posInd) = firstDiffP;
            redDerNH(posInd) = firstDiffN;
            posInd = posInd + 1;
        end        
        end   
        
        % Same calculation for IR
        irDerPH = [];
        irDerNH = []; 
        posInd = 1;
        minPk = min(length(irpksP),length(irpksN));
        for n = 1:minPk-3
        if (irlocsP(n)-irlocsN(n)) > 0
            firstDiffP = (irpksP(n)-irpksN(n))/(irlocsP(n)-irlocsN(n));
            firstDiffN = (irpksP(n+1)-irpksN(n))/(irlocsP(n+1)-irlocsN(n));
            irDerPH(posInd) = firstDiffP;
            irDerNH(posInd) = firstDiffN;
            posInd = posInd + 1;
        elseif (irlocsP(n)-irlocsN(n)) < 0
            firstDiffP = (irpksP(n+1)-irpksN(n))/(irlocsP(n+1)-irlocsN(n));
            firstDiffN = (irpksP(n)-irpksN(n))/(irlocsP(n)-irlocsN(n));
            irDerPH(posInd) = firstDiffP;
            irDerNH(posInd) = firstDiffN;
            posInd = posInd + 1;
        end        
        end   
        
        % mean derivative over winlen second long window
        poxROCPosRed(ind) = mean(redDerPH);
        poxROCNegRed(ind) = mean(redDerNH);
        poxROCPosIr(ind) = mean(irDerPH);
        poxROCNegIr(ind) = mean(irDerNH);

        %% Calculate AC and DC of both lights
        dcRed(ind) = mean(red60pos); % DC value over this window
        dcIR(ind) = mean(ir60pos); % DC value over this window
%         acRed(ind) = mean(acRedDiff); % mean AC value over this window
%         acIR(ind) = mean(acIrDiff); % mean AC value over this window
        % RMS of red and IR
        rmsRed(ind) = rms(red60pos); % RMS value of window (to see if it's better than mean)
        rmsIR(ind) = rms(ir60pos); % RMS value of window (to see if it's better than mean)
        
        % Calculate AC/DC ratio of Red and IR lights
        ratio = (rmsRed(ind)/dcRed(ind))/(rmsIR(ind)/dcIR(ind));
        spo2calc(ind) = (-45.06*(ratio^2))+(30.354*ratio)+94.845; % First possible equation
        %spo2New(ind) = 110 - 25*ratio; % Second possible equation
        spo2New(ind) = 104-17*ratio; % Third possible equation
                    
        ind = ind+1; % Increment counter
end
%% Plot signals?
if (plotty == 1)
    t = linspace(0,floor(Fs*winlen),length(red60pos));
    t = t/Fs;
    figure;
    subplot(2,1,1);
    plot(t,red60pos);
    hold on; scatter(redlocsP/Fs,redpksP,'k');
    hold on;scatter(redlocsN/Fs,redpksN,'k');
    title("Red LED Pulse Oximeter Amplitude")
    xlabel('Time (S)');
    ylabel('Raw Signal Magnitude (Counts)');
    set(gca,'Color','w')
    subplot(2,1,2);
    plot(t,ir60pos);
    hold on; scatter(irlocsP/Fs,irpksP,'k');
    hold on;scatter(irlocsN/Fs,irpksN,'k');
    title("IR LED Pulse Oximeter Amplitude")
    xlabel('Time (S)');
    ylabel('Raw Signal Magnitude (Counts)');
    set(gca,'Color','w')
end

end