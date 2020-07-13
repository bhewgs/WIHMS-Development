function [PSSfeat,ARDfeat,SYMfeat,TWfeat,parmNames,parameterMat] = AnalyzeCorrelation(allFeatures,allStressVals,correlationType);

%function [rValsPSS,pValsPSS,rValsArd,pValsArd,rValsSym,pValsSym,rValsTW,pValsTW,parmNames] = AnalyzeCorrelation(allFeatures,allStressVals,correlationType);
% Check correlations of all extracted features against PSS values
% File loads a .mat created by WIHMSprocFullFolder.m
rValsArd = 0; pValsArd = 0; rValsSym = 0; pValsSym = 0;
rValsTW = 0; pValsTW = 0;
pThresh = .05; % Significance threshold
rThresh = .1; % Correlation threshold

featLength = length(allFeatures);
PSSfeat = []; ARDfeat = []; % Allocate vectors to return specific features of correlation
SYMfeat = []; TWfeat = [];

% Preallocate memory to incrementally increase speed but mostly get rid of
% all of those orange warnings on the right
PSS = zeros(11,featLength); Ardwell = zeros(26,featLength); Symptoms = zeros(13,featLength); TW = zeros(39,featLength);
maxHR = zeros(1,featLength); rMSSD = zeros(1,featLength); avgHR = zeros(1,featLength); LFHF = zeros(1,featLength); 
rrPtStd = zeros(1,featLength); domFreq = zeros(1,featLength); time = zeros(1,featLength);
redROCposMax = zeros(1,featLength); redROCposMin = zeros(1,featLength); redROCposMed = zeros(1,featLength); redROCposMean = zeros(1,featLength); 
redROCposStd = zeros(1,featLength); redROCnegMax = zeros(1,featLength); redROCnegMin = zeros(1,featLength); redROCnegMed = zeros(1,featLength); 
redROCnegMean = zeros(1,featLength); redROCnegStd = zeros(1,featLength); irROCposMax = zeros(1,featLength); irROCposMin = zeros(1,featLength); 
irROCposMed = zeros(1,featLength); irROCposMean = zeros(1,featLength); irROCposStd = zeros(1,featLength); irROCnegMax = zeros(1,featLength); 
irROCnegMin = zeros(1,featLength); irROCnegMed = zeros(1,featLength); irROCnegMean = zeros(1,featLength); irROCnegStd = zeros(1,featLength); 
spo_1_Max = zeros(1,featLength); spo_1_Min = zeros(1,featLength); spo_1_Med = zeros(1,featLength); spo_1_Mean = zeros(1,featLength); 
spo_1_Std = zeros(1,featLength); spo_2_Max = zeros(1,featLength); spo_2_Min = zeros(1,featLength); spo_2_Med = zeros(1,featLength); 
spo_2_Mean = zeros(1,featLength); spo_2_Std = zeros(1,featLength); exMax = zeros(1,featLength); exMin = zeros(1,featLength); 
exMed = zeros(1,featLength); exMean = zeros(1,featLength); exStd = zeros(1,featLength); inMax = zeros(1,featLength); 
inMin = zeros(1,featLength); inMed = zeros(1,featLength); inMean = zeros(1,featLength); inStd = zeros(1,featLength); 

ampMax = zeros(1,featLength); ampMin = zeros(1,featLength); ampMed = zeros(1,featLength); ampMean = zeros(1,featLength); 
ampStd = zeros(1,featLength); respRate = zeros(1,featLength); respFreq = zeros(1,featLength); 

gsrStd = zeros(1,featLength); gsrMax = zeros(1,featLength); gsrMin = zeros(1,featLength); gsrMean = zeros(1,featLength); gsrMed = zeros(1,featLength); 

skinMax = zeros(1,featLength); skinMin = zeros(1,featLength); skinMed = zeros(1,featLength); skinMean = zeros(1,featLength); 
skinStd = zeros(1,featLength); skinDiffMax = zeros(1,featLength); skinDiffMin = zeros(1,featLength); skinDiffMed = zeros(1,featLength); 
skinDiffMean = zeros(1,featLength); skinDiffStd = zeros(1,featLength); skinDomFreq = zeros(1,featLength); ambMax = zeros(1,featLength); 
ambMin = zeros(1,featLength); ambMed = zeros(1,featLength); ambMean = zeros(1,featLength); ambStd = zeros(1,featLength); 
ambDiffMax = zeros(1,featLength); ambDiffMin = zeros(1,featLength); ambDiffMed = zeros(1,featLength); ambDiffMean = zeros(1,featLength); 
ambDiffStd = zeros(1,featLength); ambDomFreq = zeros(1,featLength); tdiffMax = zeros(1,featLength); tdiffMin = zeros(1,featLength); 
tdiffMed = zeros(1,featLength); tdiffMean = zeros(1,featLength); tdiffStd = zeros(1,featLength); tdiffDomFreq = zeros(1,featLength); 

for i=1:featLength % Load in all parameters from the mat file
    fName = allFeatures(i).features.fName; % Not doing anything with this right now
    time(i) = allStressVals(i).time;
    % Self Eval Overall Scores
    PSS(1,i) = allStressVals(i).Total.Cohen; % Total PSS value for this set
    Ardwell(1,i) = allStressVals(i).Total.Ardwell; % Total Ardwell value for this set
    Symptoms(1,i) = allStressVals(i).Total.Symptoms; % Total Symptoms value for this set
    TW(1,i) = allStressVals(i).Total.TW; % Total TW value for this set
    
    % Cohen PSS Specific Scores
    for n=2:11
       PSS(n,i) = allStressVals(i).cohen(n-1); 
    end
    clear n;
    
    % Ardwell Specific Scores
    for n=2:26
        Ardwell(n,i) = allStressVals(i).ardwell(n-1);
    end
    clear n;
    
    % Symptoms Specific Scores
    for n=2:13
        Symptoms(n,i) = allStressVals(i).symptoms(n-1);
    end
    clear n;
    
    % Total Wellness Specific Scores
    for n=2:33
        TW(n,i) = allStressVals(i).TW(n-1);
    end
    clear n;
    TW(34,i) = allStressVals(i).Total.TWspirituality;
    TW(35,i) = allStressVals(i).Total.TWtensionreduction;
    TW(36,i) = allStressVals(i).Total.TWsocialease;
    TW(37,i) = allStressVals(i).Total.TWactivecoping;
    TW(38,i) = allStressVals(i).Total.TWthoughtcontrol;
    TW(39,i) = allStressVals(i).Total.TWwellness;

    %%
    % ECG parameters
    maxHR(i) = allFeatures(i).features.ECG.maxHR;
    rMSSD(i) = allFeatures(i).features.ECG.rMSSD;
    avgHR(i) = allFeatures(i).features.ECG.avgHR;
    LFHF(i) = allFeatures(i).features.ECG.LFHF;
    rrPtStd(i) = std(allFeatures(i).features.ECG.rrPT);
    rrDisagree(i) = allFeatures(i).features.ECG.rrDisagree;
    % PPG parameters
    domFreq(i) = allFeatures(i).features.pox.domFreqRed;
    redROCposMax(i) = max(allFeatures(i).features.pox.poxROCredP);
    redROCposMin(i) = min(allFeatures(i).features.pox.poxROCredP);
    redROCposMed(i) = median(allFeatures(i).features.pox.poxROCredP);
    redROCposMean(i) = mean(allFeatures(i).features.pox.poxROCredP);
    redROCposStd(i) = std(allFeatures(i).features.pox.poxROCredP);
    redROCnegMax(i) = max(allFeatures(i).features.pox.poxROCredN);
    redROCnegMin(i) = min(allFeatures(i).features.pox.poxROCredN);
    redROCnegMed(i) = median(allFeatures(i).features.pox.poxROCredN);
    redROCnegMean(i) = mean(allFeatures(i).features.pox.poxROCredN);
    redROCnegStd(i) = std(allFeatures(i).features.pox.poxROCredN);
    irROCposMax(i) = max(allFeatures(i).features.pox.poxROCirP);
    irROCposMin(i) = min(allFeatures(i).features.pox.poxROCirP);
    irROCposMed(i) = median(allFeatures(i).features.pox.poxROCirP);
    irROCposMean(i) = mean(allFeatures(i).features.pox.poxROCirP);
    irROCposStd(i) = std(allFeatures(i).features.pox.poxROCirP);
    irROCnegMax(i) = max(allFeatures(i).features.pox.poxROCirN);
    irROCnegMin(i) = min(allFeatures(i).features.pox.poxROCirN);
    irROCnegMed(i) = median(allFeatures(i).features.pox.poxROCirN);
    irROCnegMean(i) = mean(allFeatures(i).features.pox.poxROCirN);
    irROCnegStd(i) = std(allFeatures(i).features.pox.poxROCirN);
    spo_1_Max(i) = max(allFeatures(i).features.pox.spo2calc);
    spo_1_Min(i) = min(allFeatures(i).features.pox.spo2calc);
    spo_1_Med(i) = median(allFeatures(i).features.pox.spo2calc);
    spo_1_Mean(i) = mean(allFeatures(i).features.pox.spo2calc);
    spo_1_Std(i) = std(allFeatures(i).features.pox.spo2calc);
    spo_2_Max(i) = max(allFeatures(i).features.pox.spo2New);
    spo_2_Min(i) = min(allFeatures(i).features.pox.spo2New);
    spo_2_Med(i) = median(allFeatures(i).features.pox.spo2New);
    spo_2_Mean(i) = mean(allFeatures(i).features.pox.spo2New);   
    spo_2_Std(i) = std(allFeatures(i).features.pox.spo2New);
    
    % Respiration parameters
    exMax(i) = max(allFeatures(i).features.resp.exhaleDiff);
    exMin(i) = min(allFeatures(i).features.resp.exhaleDiff);
    exMed(i) = median(allFeatures(i).features.resp.exhaleDiff);
    exMean(i) = mean(allFeatures(i).features.resp.exhaleDiff);
    exStd(i) = std(allFeatures(i).features.resp.exhaleDiff);
    inMax(i) = max(allFeatures(i).features.resp.inhaleDiff);
    inMin(i) = min(allFeatures(i).features.resp.inhaleDiff);
    inMed(i) = median(allFeatures(i).features.resp.inhaleDiff);
    inMean(i) = mean(allFeatures(i).features.resp.inhaleDiff);
    inStd(i) = std(allFeatures(i).features.resp.inhaleDiff);
    ampMax(i) = max(allFeatures(i).features.resp.respAmp);
    ampMin(i) = min(allFeatures(i).features.resp.respAmp);
    ampMed(i) = median(allFeatures(i).features.resp.respAmp);
    ampMean(i) = mean(allFeatures(i).features.resp.respAmp);
    ampStd(i) = std(allFeatures(i).features.resp.respAmp);
    respRate(i) = allFeatures(i).features.resp.respRate;
    respFreq(i) = allFeatures(i).features.resp.respFreq;
    % GSR parameters
    gsrStd(i) = std(allFeatures(i).features.GSR.Dat);
    gsrMean(i) = mean(allFeatures(i).features.GSR.Dat);
    gsrMed(i) = median(allFeatures(i).features.GSR.Dat);
    gsrMax(i) = allFeatures(i).features.GSR.Max;
    gsrMin(i) = allFeatures(i).features.GSR.Min;
    gsrFreq(i) = allFeatures(i).features.GSR.Freq;
    
    % Skin temp parameters
    skinMax(i) = allFeatures(i).features.skint.tSkinDmax;
    skinMin(i) = allFeatures(i).features.skint.tSkinDmin;
    skinMed(i) = median(allFeatures(i).features.skint.tSkin);
    skinMean(i) = mean(allFeatures(i).features.skint.tSkin);
    skinStd(i) = std(allFeatures(i).features.skint.tSkin);
    skinDiffMax(i) = max(allFeatures(i).features.skint.tSkinDiff);
    skinDiffMin(i) = min(allFeatures(i).features.skint.tSkinDiff);
    skinDiffMed(i) = median(allFeatures(i).features.skint.tSkinDiff);
    skinDiffMean(i) = mean(allFeatures(i).features.skint.tSkinDiff);
    skinDiffStd(i) = std(allFeatures(i).features.skint.tSkinDiff);
    skinDomFreq(i) = allFeatures(i).features.skint.tSkinDomFreq;
    % Ambient temp parameters
    ambMax(i) = allFeatures(i).features.ambt.tAmbDmax;
    ambMin(i) = allFeatures(i).features.ambt.tAmbDmin;
    ambMed(i) = median(allFeatures(i).features.ambt.tAmb);
    ambMean(i) = mean(allFeatures(i).features.ambt.tAmb);
    ambStd(i) = std(allFeatures(i).features.ambt.tAmb);
    ambDiffMax(i) = max(allFeatures(i).features.ambt.tAmbDiff);
    ambDiffMin(i) = min(allFeatures(i).features.ambt.tAmbDiff);
    ambDiffMed(i) = median(allFeatures(i).features.ambt.tAmbDiff);
    ambDiffMean(i) = mean(allFeatures(i).features.ambt.tAmbDiff);
    ambDiffStd(i) = std(allFeatures(i).features.ambt.tAmbDiff);
    ambDomFreq(i) = allFeatures(i).features.ambt.tAmbDomFreq;
    % Temp difference parameters
    tdiffMax(i) = allFeatures(i).features.relt.tRelDmax;
    tdiffMin(i) = allFeatures(i).features.relt.tRelDmin;
    tdiffMed(i) = median(allFeatures(i).features.relt.tRel);
    tdiffMean(i) = mean(allFeatures(i).features.relt.tRel);
    tdiffStd(i) = std(allFeatures(i).features.relt.tRel);
    tdiffDomFreq(i) = allFeatures(i).features.relt.tRelDomFreq;
end
%save('featuresForCorr.mat'); % Save all the above vectors

%% Concatenate all features into a single matrix
parameterMat = [time',maxHR', rMSSD',avgHR',LFHF',rrPtStd',rrDisagree',domFreq',redROCposMax', redROCposMin',redROCposMed',redROCposMean',redROCposStd',redROCnegMax',redROCnegMin',redROCnegMed',redROCnegMean',redROCnegStd',irROCposMax',irROCposMin',irROCposMed',irROCposMean',irROCposStd', irROCnegMax',irROCnegMin',irROCnegMed',irROCnegMean',irROCnegStd',spo_1_Max',spo_1_Min',spo_1_Med',spo_1_Mean',spo_1_Std',spo_2_Max',spo_2_Min',spo_2_Med',spo_2_Mean',spo_2_Std',exMax',exMin',exMed',exMean',exStd',inMax',inMin',inMed',inMean',inStd',ampMax',ampMin',ampMed',ampMean',ampStd',respRate',respFreq',gsrStd',gsrMean',gsrMed',gsrMax',gsrMin',gsrFreq',skinMax',skinMin',skinMed',skinMean',skinStd',skinDiffMax',skinDiffMin',skinDiffMed',skinDiffMean',skinDiffStd',skinDomFreq',ambMax',ambMin',ambMed',ambMean',ambStd',ambDiffMax',ambDiffMin',ambDiffMed',ambDiffMean',ambDiffStd',ambDomFreq',tdiffMax',tdiffMin',tdiffMed',tdiffMean',tdiffStd',tdiffDomFreq'];
parmNames = {'time','maxHR',' rMSSD','avgHR','LFHF','rrPtStd','rrDisagree','domFreq','redROCposMax',' redROCposMin','redROCposMed','redROCposMean','redROCposStd','redROCnegMax','redROCnegMin','redROCnegMed','redROCnegMean','redROCnegStd','irROCposMax','irROCposMin','irROCposMed','irROCposMean','irROCposStd',' irROCnegMax','irROCnegMin','irROCnegMed','irROCnegMean','irROCnegStd','spo_1_Max','spo_1_Min','spo_1_Med','spo_1_Mean','spo_1_Std','spo_2_Max','spo_2_Min','spo_2_Med','spo_2_Mean','spo_2_Std','exMax','exMin','exMed','exMean','exStd','inMax','inMin','inMed','inMean','inStd','ampMax','ampMin','ampMed','ampMean','ampStd','respRate','respFreq','gsrStd','gsrMean','gsrMed','gsrMax','gsrMin','gsrFreq','skinMax','skinMin','skinMed','skinMean','skinStd','skinDiffMax','skinDiffMin','skinDiffMed','skinDiffMean','skinDiffStd','skinDomFreq','ambMax','ambMin','ambMed','ambMean','ambStd','ambDiffMax','ambDiffMin','ambDiffMed','ambDiffMean','ambDiffStd','ambDomFreq','tdiffMax','tdiffMin','tdiffMed','tdiffMean','tdiffStd','tdiffDomFreq'};
rThresh = .3; % R value threshold
pThresh = .05; % P value threshold
%%  Take a look at correlations of PSS and other parameters
[PSSlength,~] = size(PSS); 
rVal = zeros(PSSlength,length(parameterMat)+1);
pVal = ones(PSSlength,length(parameterMat)+1);
for w=1:PSSlength
PSSmat = [PSS(w,:)',parameterMat];
index = 1; 
%rVal = zeros(1,featLength); pVal = ones(1,featLength); 
rLocs = []; pLocs = [];
for j = 2:length(PSSmat)
    [rVal(w,j),pVal(w,j)] = corr(PSSmat(:,1),PSSmat(:,j),'Type',correlationType); 

    if (abs(rVal(w,j)) >= rThresh)
        rLocs = [rLocs, index];
    end
    if (pVal(w,j) <= pThresh)
       pLocs = [pLocs, index];
    end
    index = index + 1;
end
rLocsPSS = rLocs; 
pLocsPSS = pLocs;
end
rValsPSS = rVal;
pValsPSS = pVal;
%%  Take a look at correlations of Ardwell and other parameters
[ardLength,~] = size(Ardwell); 
rVal = zeros(ardLength,length(parameterMat)+1);
pVal = ones(ardLength,length(parameterMat)+1);
for w=1:ardLength
ArdwellMat = [Ardwell(w,:)',parameterMat];
index = 1; 
rLocs = []; pLocs = [];
for j = 2:length(ArdwellMat)
        [rVal(w,j),pVal(w,j)] = corr(ArdwellMat(:,1),ArdwellMat(:,j),'Type',correlationType); 

    if (abs(rVal(w,j)) >= rThresh)
        rLocs = [rLocs, index];
    end
    if (pVal(w,j) <= pThresh)
       pLocs = [pLocs, index];
    end
    index = index + 1;
end
rLocsArdwell = rLocs;
pLocsArdwell = pLocs;
end
rValsArd = rVal;
pValsArd = pVal;
%%  Take a look at correlations of Symptoms and other parameters
[symptLength,~] = size(Symptoms);
rVal = zeros(symptLength,length(parameterMat)+1);
pVal = ones(symptLength,length(parameterMat)+1);
for w=1:symptLength
SymptomsMat = [Symptoms(w,:)',parameterMat];
index = 1;
rLocs = []; pLocs = [];
for j = 2:length(SymptomsMat)
    [rVal(w,j),pVal(w,j)] = corr(SymptomsMat(:,1),SymptomsMat(:,j),'Type',correlationType); 

    if (abs(rVal(w,j)) >= rThresh)
        rLocs = [rLocs, index];
    end
    if (pVal(w,j) <= pThresh)
       pLocs = [pLocs, index];
    end
    index = index + 1;
end
rLocsSymptoms = rLocs;
pLocsSymptoms = pLocs;
end
rValsSym = rVal;
pValsSym = pVal;
%%  Take a look at correlations of Total Wellness
[TWlength,~] = size(TW);
rVal = zeros(TWlength,length(parameterMat)+1);
pVal = ones(TWlength,length(parameterMat)+1);
for w=1:TWlength
TWMat = [TW(w,:)',parameterMat];
index = 1;
rLocs = []; pLocs = [];
for j = 2:length(TWMat)
        [rVal(w,j),pVal(w,j)] = corr(TWMat(:,1),TWMat(:,j),'Type',correlationType); 
    if (abs(rVal(w,j)) >= rThresh)
        rLocs = [rLocs, index];
    end
    if (pVal(w,j) <= pThresh)
       pLocs = [pLocs, index];
    end
    index = index + 1;
end
rLocsTW = rLocs;
pLocsTW = pLocs;
end
rValsTW = rVal;
pValsTW = pVal;


%%
   pssval = 0; ardval = 0; symptomval = 0; twval = 0; sigRes = 0; % Indexes to count number of relationships
   fprintf('\n------------------------------------- Beginning %s Correlation Analysis -------------------------------------\n', correlationType);

    % PSS Pearson and Spearman
    [x,y] = size(rValsPSS);
    for a=1%:x % How many questions to analyze correlation?
        for b=1:y-1 % How many features to analyze correlation?
            if (pValsPSS(a,b) <= pThresh & abs(rValsPSS(a,b))>= rThresh)
                format short;
                fprintf('PSS %s [%0.3f,%.4f] at (%d,%d), feature %s\n',correlationType,rValsPSS(a,b),pValsPSS(a,b),a,b,parmNames{b});
                sigRes = sigRes+1;
                pssval=pssval+1;
                PSSfeat = [PSSfeat, b];
            end
        end
    end
    fprintf('%d PSS Correlations\n\n', pssval);
    
    %Ardell Pearson and Spearman
    [x,y] = size(rValsArd);
    for a=1%:x % How many questions to analyze correlation?
        for b=1:y-1 % How many features to analyze correlation?
            if (pValsArd(a,b) <= pThresh & abs(rValsArd(a,b))>= rThresh)
               format short;
               fprintf('Ardell %s [%0.3f,%.4f] at (%d,%d), feature %s\n',correlationType,rValsArd(a,b),pValsArd(a,b),a,b,parmNames{b});
               sigRes = sigRes+1;
               ardval = ardval+1;
               ARDfeat = [ARDfeat, b];
            end
        end
    end
    fprintf('%d Ardell Correlations\n\n', ardval);
    
    [x,y] = size(rValsSym);
    for a=1%:x % How many questions to analyze correlation?
        for b=1:y-1 % How many features to analyze correlation?
            if (pValsSym(a,b) <= pThresh & abs(rValsSym(a,b))>= rThresh)
               format short;
               fprintf('Symptoms %s [%0.3f,%.4f] at (%d,%d), feature %s\n',correlationType,rValsSym(a,b),pValsSym(a,b),a,b,parmNames{b});
               sigRes = sigRes+1;
               symptomval = symptomval+1;
               SYMfeat = [SYMfeat, b];
            end
        end
    end
    fprintf('%d Symptoms Correlations\n\n', symptomval);
    
    %Total Wellness Pearson and Spearman
    [x,y] = size(rValsTW);
    for a=1%:x % How many questions to analyze correlation?
        for b=1:y-1 % How many features to analyze correlation?
            if (pValsTW(a,b) <= pThresh & abs(rValsTW(a,b))>= rThresh)
               format short;
               fprintf('Total Wellness %s [%0.3f,%.4f] at (%d,%d), feature %s\n',correlationType,rValsTW(a,b),pValsTW(a,b),a,b,parmNames{b});
               sigRes = sigRes+1;
               twval = twval+1;
               TWfeat = [TWfeat, b];
            end
        end
    end
    fprintf('%d TW Correlations\n\n', twval);
    fprintf('There are %d correlations with p <= %.3f\n',sigRes,pThresh);
    
    pssMed = median(PSS(1,:));
    pssMean = mean(PSS(1,:));
    pssMax = max(PSS(1,:));
    pssMin = min(PSS(1,:));
    pssRan = (max(PSS(1,:))-min(PSS(1,:)));
    pssStd = std(PSS(1,:));
    ardMed = median(Ardwell(1,:));
    ardMean = mean(Ardwell(1,:));
    ardMax = max(Ardwell(1,:));
    ardMin = min(Ardwell(1,:));
    ardRan = (max(Ardwell(1,:))-min(Ardwell(1,:)));
    ardStd = std(Ardwell(1,:));
    symMed = median(Symptoms(1,:));
    symMean = mean(Symptoms(1,:));
    symMax = max(Symptoms(1,:));
    symMin = min(Symptoms(1,:));
    symRan = (max(Symptoms(1,:))-min(Symptoms(1,:)));
    symStd = std(Symptoms(1,:));
    twMed = median(TW(1,:));
    twMean = mean(TW(1,:));
    twMax = max(TW(1,:));
    twMin = min(TW(1,:));
    twRan = (max(TW(1,:))-min(TW(1,:)));
    twStd = std(TW(1,:));

    % Quick analysis of raw score spread
%     fprintf('PSS (0-40)   ----- Med: %2.2f, Mean: %2.2f, Range: %2.2f, Max: %2.2f, Min: %2.2f, STD: %2.2f\n',pssMed,pssMean,pssRan,pssMax,pssMin,pssStd); 
%     fprintf('Ardell (-75-75) -- Med: %2.2f, Mean: %2.2f, Range: %-2.2f, Max: %-2.2f, Min: %-2.2f, STD: %2.2f\n',ardMed,ardMean,ardRan,ardMax,ardMin,ardStd); 
%     fprintf('Symptoms (12-84) - Med: %2.2f, Mean: %2.2f, Range: %-2.2f, Max: %-2.2f, Min: %-2.2f, STD: %2.2f\n',symMed,symMean,symRan,symMax,symMin,symStd); 
%     fprintf('TW (0-4) --------- Med: %2.2f, Mean: %2.2f, Range: %2.2f, Max: %2.2f, Min: %2.2f, STD: %2.2f\n',twMed,twMean,twRan,twMax,twMin,twStd); 
     fprintf('\n------------------------------------- Completed %s Correlation Analysis -------------------------------------\n', correlationType);
    
end