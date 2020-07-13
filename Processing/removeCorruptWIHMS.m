function [validStress,validFeatures] = removeCorruptWIHMS(allStressVals,allFeatures)
% Function looks for corrupt data entries noted in stresstracker.xslx and removes
% associated data from the allStressVals and allFeatures structs.
emptyLocs = []; % Storage for locations of empty structs
for i=1:length(allStressVals)
    if (length(allStressVals(i).FileName) < 3)
        emptyLocs = [emptyLocs, i]; % Take note of indexes of empty filenames
    end
end

for n = 1:length(emptyLocs)
   indexLoc = emptyLocs(n);
   allStressVals = allStressVals([1:indexLoc-1,indexLoc+1:length(allStressVals)]); % Eliminate the empty location
   allFeatures = allFeatures([1:indexLoc-1,indexLoc+1:length(allFeatures)]); % Eliminate the empty location

   for w=n:length(emptyLocs) % Need to adjust all indexes of empty files, or we'll exceed array boundaries
       emptyLocs(w) = emptyLocs(w)-1; % Subtract 1 from indexes we haven't reached yet - leave others alone
   end
end

validStress = allStressVals;
validFeatures = allFeatures;

end