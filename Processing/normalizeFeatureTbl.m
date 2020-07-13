function normalizedTable = normalizeFeatureTbl(features)
 % This function takes a table of data features and stress parameters and
 % normalizes the features. Returns a table the same size as the input.
 
 [numCollects, NumCols] = size(features);
 
for i = 1:NumCols-7 % There are 7 columns of stress values. We don't want to normalize these.
    normalizedTable(:,i) = zscore(table2array(features(:,i)));
end

for j=(i+1):NumCols
    normalizedTable(:,j) = table2array(features(:,j));
end

normalizedTable = array2table(normalizedTable,'VariableNames',{'time','maxHR','rMSSD','avgHR','LFHF','rrPtStd','rrDisagree','domFreq','redROCposMax','redROCposMin','redROCposMed','redROCposMean','redROCposStd','redROCnegMax','redROCnegMin','redROCnegMed','redROCnegMean','redROCnegStd','irROCposMax','irROCposMin','irROCposMed','irROCposMean','irROCposStd','irROCnegMax','irROCnegMin','irROCnegMed','irROCnegMean','irROCnegStd','spo_1_Max','spo_1_Min','spo_1_Med','spo_1_Mean','spo_1_Std','spo_2_Max','spo_2_Min','spo_2_Med','spo_2_Mean','spo_2_Std','exMax','exMin','exMed','exMean','exStd','inMax','inMin','inMed','inMean','inStd','ampMax','ampMin','ampMed','ampMean','ampStd','respRate','respFreq','gsrStd','gsrMean','gsrMed','gsrMax','gsrMin','gsrFreq','skinMax','skinMin','skinMed','skinMean','skinStd','skinDiffMax','skinDiffMin','skinDiffMed','skinDiffMean','skinDiffStd','skinDomFreq','tdiffMax','tdiffMin','tdiffMed','tdiffMean','tdiffStd','tdiffDomFreq','stressCohen','stressCatCohen','stressArdell','stressCatArdell','stressSymptoms','stressTW','stressCatTW'});
end