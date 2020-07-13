function [trainFeat,trainStress,testFeat,testStress] = classifyExtract(allFeatures, allStressVals, testType)
clc;
pss1 = []; pss2 = []; pss3 = []; % How many PSS categories?
ard1=[];ard2=[];ard3=[];ard4=[];ard5=[];ard6=[]; % How many ard categories?
scri1=[];scri2=[];scri3=[];scri4=[]; % How many scri categories?
pssCats = []; ardCats = []; symList = []; scriCats = []; names = {}; % Track all scores and locations

for i=1:length(allFeatures)
   name = allFeatures(i).features.fName; names = [names, name];
   pss = allStressVals(i).Total.Cohen;
   pssCat = categorizeStress(pss,'cohen'); pssCats = [pssCats, pssCat];
   ard = allStressVals(i).Total.Ardwell;
   ardCat = categorizeStress(ard,'ardell'); ardCats = [ardCats, ardCat];
   syms = allStressVals(i).Total.Symptoms; symList = [symList, syms];
   SCRI = allStressVals(i).Total.TW;scriCat = categorizeStress(SCRI,'scri'); scriCats = [scriCats, scriCat];
   if (pssCat == 1)
       pss1 = [pss1, i];
   elseif (pssCat == 2)
       pss2 = [pss2, i];
   elseif (pssCat == 3)
       pss3 = [pss3, i];
   else
       fprintf('%s PSS VALUE WRONG - NOT 1-3.\n',name)
   end   
   if (ardCat == 1)
       ard1 = [ard1, i];
   elseif (ardCat == 2)
       ard2 = [ard2, i];
   elseif (ardCat == 3)
       ard3 = [ard3, i];
   elseif (ardCat == 4)
       ard4 = [ard4, i];
   elseif (ardCat == 5)
       ard5 = [ard5, i];
   elseif (ardCat == 6)
       ard6 = [ard6, i];
   else
       fprintf('%s ARDELL VALUE WRONG - NOT 1-6.\n',name)
   end   
   if (scriCat == 1)
       scri1 = [scri1, i];
   elseif (scriCat == 2)
       scri2 = [scri2, i];
   elseif (scriCat == 3)
       scri3 = [scri3, i];
   elseif (scriCat == 4)
       scri4 = [scri4, i];
   else
       fprintf('%s SCRI VALUE WRONG - NOT 1-4.\n',name)
   end
   %fprintf('RAW: %s:    P=%d    A=%d    S=%d    SCRI=%.4f\n',name,pss,ard,syms,SCRI);
   %fprintf('CAT: %s:    P=%d    A=%d    SCRI=%.4f\n',name,pssCat,ardCat,scriCat);
end

% Filenames of each stress category
pss1s = names(pss1);pss2s = names(pss2);pss3s = names(pss3);ard1s = names(ard1);ard2s = names(ard2);ard3s = names(ard3);ard4s = names(ard4);ard5s = names(ard5);ard6s = names(ard6);
scri1s = names(scri1);scri2s = names(scri2);scri3s = names(scri3);scri4s = names(scri4);
% Randomly select files from each category to be used as training sets and
% testing sets
pssTrainFiles = []; pssTestFiles = []; ardTrainFiles = []; ardTestFiles = []; scriTrainFiles = []; scriTestFiles = [];

% PSS
pssCatNum = [length(pss1), length(pss2), length(pss3)]; % List numbers of each PSS category
pssCatNum = nonzeros(pssCatNum)'; % Remove any zeros - those categories are unrepresented
pssCatNum = min(pssCatNum); % Keep only the smallest number of represented classes
pssTest = floor(pssCatNum)/3; % Number of datasets to test
pssTrain = pssCatNum - pssTest; % Number of datasets to train on
psstrainIndex = randperm(pssCatNum,pssTrain); % Random index values 
pssTrainFiles = [pssTrainFiles, pss1s(psstrainIndex)]; % Grab filenames from pss category 1
pssTestIndex = (setdiff(1:length(pss1s),psstrainIndex));
pssTestFiles = [pssTestFiles, pss1s(pssTestIndex)];
psstrainIndex = randperm(pssCatNum,pssTrain); % Random index values
pssTrainFiles = [pssTrainFiles, pss2s(psstrainIndex)]; % Grab filenames from pss category 1
pssTestIndex = (setdiff(1:length(pss2s),psstrainIndex));
pssTestFiles = [pssTestFiles, pss2s(pssTestIndex)];

% Ardell
ardCatNum = [length(ard1), length(ard2), length(ard3),length(ard4),length(ard5),length(ard6)]; % List numbers of each Ardell category
ardCatNum = nonzeros(ardCatNum); % Remove any zeros - those categories are unrepresented
ardCatNum = min(ardCatNum); % Keep only the smallest number of represented classes
ardTest = floor(ardCatNum)/3; % Number of datasets to test
ardTrain = ardCatNum - ardTest; % Number of datasets to train on
ardtrainIndex = randperm(ardCatNum,ardTrain); % Random index values
ardTrainFiles = [ardTrainFiles, ard3s(ardtrainIndex)]; % Grab filenames from ard category 3
ardTestIndex = (setdiff(1:length(ard3s),ardtrainIndex));
ardTestIndex = randperm(length(ardTestIndex),ardTest);
ardTestFiles = [ardTestFiles, ard3s(ardTestIndex)];
ardtrainIndex = randperm(ardCatNum,ardTrain); % Random index values
ardTrainFiles = [ardTrainFiles, ard4s(ardtrainIndex)]; % Grab filenames from ard category 4
ardTestIndex = (setdiff(1:length(ard4s),ardtrainIndex));
ardTestIndex = randperm(length(ardTestIndex),ardTest);
ardTestFiles = [ardTestFiles, ard4s(ardTestIndex)];
ardtrainIndex = randperm(ardCatNum,ardTrain); % Random index values
ardTrainFiles = [ardTrainFiles, ard5s(ardtrainIndex)]; % Grab filenames from ard category 5
ardTestIndex = (setdiff(1:length(ard5s),ardtrainIndex));
ardTestIndex = randperm(length(ardTestIndex),ardTest);
ardTestFiles = [ardTestFiles, ard5s(ardTestIndex)];
% NEED TO THEN SELECT ONLY ARDTEST NUMBER OF FILES FROM THE FILES IN
% ARDTESTFILES

% SCRI
scriCatNum = [length(scri1), length(scri2), length(scri3)]; % List numbers of each SCRI category
scriCatNum = nonzeros(scriCatNum); % Remove any zeros - those categories are unrepresented
scriCatNum = min(scriCatNum); % Keep only the smallest number of represented classes
scriTest = floor(scriCatNum)/3; % Number of datasets to test
scriTrain = scriCatNum - scriTest; % Number of datasets to train on
scritrainIndex = randperm(scriCatNum,scriTrain);
scriTrainFiles = [scriTrainFiles, scri2s(scritrainIndex)];
scriTestIndex = (setdiff(1:length(scri2s),scritrainIndex));
scriTestFiles = [scriTrainFiles, scri2s(scriTestIndex)];
scritrainIndex = randperm(scriCatNum,scriTrain);
scriTrainFiles = [scriTrainFiles, scri3s(scritrainIndex)];
scriTestIndex = (setdiff(1:length(scri3s),scritrainIndex));
scriTestFiles = [scriTestFiles, scri3s(scriTestIndex)];


% Pull out all PSS files of interest
for i=1:length(pssTrainFiles)
    for n=1:length(allFeatures)
       if (allFeatures(n).features.fName == pssTrainFiles{i})
           pssTrainFeatures(i) = allFeatures(n);
           pssTrainStressVals(i) = allStressVals(n);
       end
    end
end
for i=1:length(pssTestFiles)
    for n=1:length(allFeatures)
       if (allFeatures(n).features.fName == pssTestFiles{i})
           pssTestFeatures(i) = allFeatures(n);
           pssTestStressVals(i) = allStressVals(n);
       end
    end
end

% Pull out all Ardell files of interest
for i=1:length(ardTrainFiles)
    for n=1:length(allFeatures)
       if (allFeatures(n).features.fName == ardTrainFiles{i})
           ardTrainFeatures(i) = allFeatures(n);
           ardTrainStressVals(i) = allStressVals(n);
       end
    end
end
for i=1:length(ardTestFiles)
    for n=1:length(allFeatures)
       if (allFeatures(n).features.fName == ardTestFiles{i})
           ardTestFeatures(i) = allFeatures(n);
           ardTestStressVals(i) = allStressVals(n);
       end
    end
end

% Pull out all SCRI files of interest
for i=1:length(scriTrainFiles)
    for n=1:length(allFeatures)
       if (allFeatures(n).features.fName == scriTrainFiles{i})
           scriTrainFeatures(i) = allFeatures(n);
           scriTrainStressVals(i) = allStressVals(n);
       end
    end
end
for i=1:length(scriTestFiles)
    for n=1:length(allFeatures)
       if (allFeatures(n).features.fName == scriTestFiles{i})
           scriTestFeatures(i) = allFeatures(n);
           scriTestStressVals(i) = allStressVals(n);
       end
    end
end

%% Pick which test to return

testLower = lower(testType);
switch testLower
    case 'cohen'
        trainFeat = pssTrainFeatures;
        trainStress = pssTrainStressVals;
        testFeat = pssTestFeatures;
        testStress = pssTestStressVals;
    case {'ardell','ardwell','ard'}
        trainFeat = ardTrainFeatures;
        trainStress = ardTrainStressVals;
        testFeat = ardTestFeatures;
        testStress = ardTestStressVals;
    case 'scri'
        trainFeat = scriTrainFeatures;
        trainStress = scriTrainStressVals;
        testFeat = scriTestFeatures;
        testStress = scriTestStressVals;
    otherwise
        fprintf('Incorrect TYPE argument to classifyExtract.m\n');
end

end