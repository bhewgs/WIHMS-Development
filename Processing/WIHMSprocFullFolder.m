% Examine one WIHMS file individually
clear all; close all;

features = struct; % structure to hold parameters for this specific file
allFeatures = struct; % structure to hold parameters extracted from all files
showData = 0; % Examine all 8 data fields as they are read in from binary
showPox = 0; % Show peak locations during PPG analysis
showResp = 0; % Show respiration parameters during gyro analysis
manualFileSelect = 0; % Set to 1 to select each file manually, or 0 to process every file in folder

% IMPORTANT - CODE CURRENTLY PULLING FROM DUPLICATE DATA FOLDER
% Note WIHMSdata as follows:
% Column 1: Time Vector as Microseconds
% Column 2: ECG Values as Voltage (675 max - 3.3V range on 5V pin -> [3.3/5]*1024)
% Column 3: Infrared LED PPG as count values. Unit returns 18 bit (~262k)
%           but we cast as unsigned int to save space in Bin file (65536 max)
% Column 4: Red LED PPG as count values. Unit returns 18 bit (~262k)
%           but we cast as unsigned int to save space in Bin file (65536 max)
% Column 5: Thermometer - Difference btwn ambient and skin
% Column 6: EDA Sensor Values as Voltage. 1023 max - 5V range on 5V pin.
% Column 7: Gyro measurement. (Degrees/sec)*100.
% Column 8: Skin Temperature as degrees F.
% Column 9: Ambient Temperature as degrees F.

set(0,'defaultfigurecolor',[1 1 1])
cd('C:\Users\bhewg\Documents\UVM\SpaceGrant\Stress\data\Daily_Analog\');
files = dir('*.bin'); % How many bin files are in this folder?

%% FOR loop - set upper limit to 1 to analyze only a single file

for j=1:length(files)
    clc;
    compstr = sprintf('There are %d files remaining to process.',length(files)-j);
    disp(compstr);
    fileName = files(j).name;
    filePath = files(j).folder;
    str = sprintf("%s%s%s",filePath,'\',fileName);

cd('C:\Users\bhewg\Documents\UVM\SpaceGrant\Stress');
WIHMSdata = readBinFile(str); % Extract data from the bin file, return a 7 column vector
features.fName = fileName;
stressVals = getStressVals(fileName);


if (stressVals.FileName == '0')% | ((stressVals.time < 12.0) | (stressVals.time > 18.0))) % Corruption in the file of interest - we don't want to extract parameters from this one.
    continue; % Exit this loop iteration, examine next file.
end

[Fs, ~] = calcFreq(WIHMSdata(:,1)); % Calculate median sampling frequency from column 1 of WIHMSdata and time vector in seconds

if (showData == 1) % Plot all data to visually look for corruption
    plotalldata(WIHMSdata);
end

WIHMSdata = WIHMSresample(WIHMSdata,floor(Fs)+1); % Resample data by Fs to get evenly spaced samples for later freq analysis
t = WIHMSdata(:,1); % Time vector in seconds
% HR Parameters
ECG = ECGcalc(WIHMSdata(:,2), Fs); % Filter the ECG data to remove 60Hz and baseline wander
[avgHR, maxHR, RRmanual, RRt] = ECGparms(ECG,WIHMSdata(:,1),Fs,0,1); % Calculate avg HR, 1min max, RR intervals
% Note that passing "j" to ECGparms selects from predetermined ECG peak
% heights
[rrFs,LFHF,rrPT,rMSSD,hrs] = ecgFeatureExtract(avgHR,RRmanual,RRt,ECG,Fs,0); % RR intervals, HRV power ratio, rMSSD
rrDisagree = abs(length(RRmanual)-length(rrPT)); % Disagreement in length between the two peak selection algorithms
% PulseOx Parameters
[poxROCredP, poxROCredN, poxROCirP, poxROCirN, spo2calc, spo2New, domFreqRed, domFreqIR] = spo2process(WIHMSdata(:,4),WIHMSdata(:,3),20,Fs,showPox);
% Respiration Parameters
[gyroData, exhaleDiff, inhaleDiff, respAmp, respRate, respFreq] = smoothGyro(WIHMSdata(:,7),floor(Fs),showResp);
% GSR Parameters
n=3; % What power polynomial to extract from the data?
[mDat,mDiffs,mMax,mMin,mFreq] = moistureProc(WIHMSdata(:,6),Fs);
[tonDat,tonDiffs,tonMax,tonMin,tonFreq] = moistureProc(detrend(WIHMSdata(:,6),n),Fs); % Tonic data!
% Temperature Parameters
[tSkin,tSkinDiff,tSkinDmax,tSkinDmin,tSkinDomFreq] = tempProc(WIHMSdata(:,8),Fs);
[tAmb,tAmbDiff,tAmbDmax,tAmbDmin,tAmbDomFreq] = tempProc(WIHMSdata(:,9),Fs);
[tRel,tRelDiff,tRelDmax,tRelDmin,tRelDomFreq] = tempProc(WIHMSdata(:,5),Fs);
% Move all parameters into a struct to save things easily
% ECG
features.ECG.maxHR = maxHR; features.ECG.avgHR = avgHR; features.ECG.rrPT = rrPT; features.ECG.RRmanual = RRmanual;
features.ECG.rrFS = rrFs; features.ECG.LFHF = LFHF; features.ECG.RRt = RRt; features.ECG.rMSSD = rMSSD; features.ECG.hrs = hrs;
features.ECG.rrDisagree = rrDisagree;
% PPG
features.pox.poxROCredP = poxROCredP; features.pox.poxROCredN = poxROCredN; features.pox.poxROCirP = poxROCirP;
features.pox.poxROCirN = poxROCirN; features.pox.spo2calc = spo2calc; features.pox.spo2New = spo2New;
features.pox.domFreqRed = domFreqRed; features.pox.domFreqIR = domFreqIR;
% Respiration
features.resp.gyroData = gyroData; features.resp.exhaleDiff = exhaleDiff; features.resp.inhaleDiff = inhaleDiff;
features.resp.respAmp = respAmp; features.resp.respRate = respRate; features.resp.respFreq = respFreq;
% GSR
features.GSR.Dat = tonDat; 
features.GSR.Diffs = tonDiffs; 
features.GSR.Max = tonMax; 
features.GSR.Min = tonMin; 
features.GSR.Freq = tonFreq;
% Temperatures
features.skint.tSkin = tSkin; features.skint.tSkinDiff = tSkinDiff; features.skint.tSkinDmax = tSkinDmax;
features.skint.tSkinDmin = tSkinDmin; features.skint.tSkinDomFreq = tSkinDomFreq;
features.ambt.tAmb = tAmb; features.ambt.tAmbDiff = tAmbDiff; features.ambt.tAmbDmax = tAmbDmax;
features.ambt.tAmbDmin = tAmbDmin; features.ambt.tAmbDomFreq = tAmbDomFreq;
features.relt.tRel = tRel; features.relt.tRelDiff = tRelDiff; features.relt.tRelDmax = tRelDmax;
features.relt.tRelDmin = tRelDmin; features.relt.tRelDomFreq = tRelDomFreq;
features.tVect = t; features.Fs = Fs;  
features.rawData = WIHMSdata; clear WIHMSdata;
allFeatures(j).features = features;
allStressVals(j) = stressVals;
end
%% Remove empty struct entries resulting from corrupted files
[allStressVals, allFeatures] = removeCorruptWIHMS(allStressVals,allFeatures); % Strip corrupt entries
% Save the completed feature extraction, indicate completion.
clearvars -except allFeatures allStressVals;
save('C:\Users\bhewg\Documents\UVM\SpaceGrant\Stress\MatFilesForProcessing\WIHMSall.mat');
waitfor(msgbox({'Message from WIHMSprocFullFolder:','Feature extraction complete. Files saved to folder.'},'Operation Complete'));
