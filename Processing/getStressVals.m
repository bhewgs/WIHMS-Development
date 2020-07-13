function record = getStressVals(filenameBin)
% This function takes the name of a binfile (ie '4142111.bin'), and returns
% the stressvalues assoiated with each of the 4 stress assessments, as well
% as the time the file was taken
filename = filenameBin(1:length(filenameBin)-4); % Remove '.bin' from the name
if (filename(1) == '0') % Correct for a 0 in the filename. Sometimes happens, sometimes doesn't.
    filename = filenameBin(2:length(filenameBin)-4); % Remove '.bin' from the name
end
MLversion = version;
is2020 = 0;
for i=1:length(MLversion)-5
    if (lower(char((MLversion(i:i+4))))=='r2020')
        is2020 = 1;
        break;
    end
end
if (is2020)
    stressFiles = readtable('C:\Users\bhewg\Documents\UVM\SpaceGrant\Stress\StressTracker.xlsx','ReadVariableNames',false,'ReadRowNames',false,'TextType','string','NumHeaderLines',0);
    fprintf('MATLAB Version %s detected.\nBe warned this code is not fully tested with your version of MATLAB and instability may occur.\n',MLversion);
    [long, width] = size(stressFiles);
    for j=1:long
        for k=1:width-1
            stressItem = table2array(stressFiles(j,k+1));
            stressFiley(j,k) = stressItem;
        end
    end
    clear stressFiles;
    stressFiles = stressFiley;
else
    stressFiles = readtable('C:\Users\bhewg\Documents\UVM\SpaceGrant\Stress\StressTracker.xlsx','ReadVariableNames',false,'ReadRowNames',false,'TextType','string');
    [long, width] = size(stressFiles); % Need the width of our table
    stressFiles = table2array(stressFiles(1:long,2:width)); % Work with a string matrix rather than a table.
end
%% Locate our record of interest
[long, width] = size(stressFiles); % Need the width of our table
for i=1:width % Only read columns until we found our file of interest
    if ((is2020 == 0) & (char(stressFiles(1,i)) == filename)) % We have found our record using old MATLAB version
        str = sprintf('File %s located. Reading self-eval measures.',filename);
        disp(str);
        break; % No need to keep looking for the file - "i" is left as the location of the file
    elseif (is2020) % Need to handle the naming convention differently. Thanks MATLAB.
        thisentry = num2str(stressFiles(1,i)); % examine filename as a string rather than double
        for n=1:length(thisentry)
            thisname(n) = thisentry(n); % Store individual chars.
        end
        if (thisentry == filename)
            str = sprintf('File %s located. Reading self-eval measures.',filename);
            disp(str);
            break;
        end
        
        
    elseif (i == width & stressFiles(1,width) ~= filename) % Looked for file, wasn't found
        str = sprintf('%s was not found as an entry in the StressTracker file.',filename);
        disp(str); % Notify user
        column = 0; % Return null
    end
end
%% Extract stress Values from the record of interest
corruptInd = char(stressFiles(96,i));

if ((corruptInd == 0) || (corruptInd == '0')) % No corruption indicated in data in either 2019 or 2020 versions of matlab
    if (is2020 == 0) % Indexes must be converted to type double
        record = struct; % Return all stress information to the user in a struct
        record.FileName = filename;
        record.time = str2double(stressFiles(3,i)); % What time of day was file recorded?
        record.Total.Symptoms = str2double(stressFiles(16,i)); % Return total stress val as double
        record.Total.Cohen = str2double(stressFiles(28,i)); % Return total stress val as double
        record.Total.Ardwell = str2double(stressFiles(55,i)); % Return total stress val as double
        record.Total.TW = str2double(stressFiles(95,i)); % Return total stress val as double
        record.Total.TWwellness = str2double(stressFiles(89,i)); % Return total stress val as double
        record.Total.TWthoughtcontrol = str2double(stressFiles(90,i)); % Return total stress val as double
        record.Total.TWactivecoping = str2double(stressFiles(91,i)); % Return total stress val as double
        record.Total.TWsocialease = str2double(stressFiles(92,i)); % Return total stress val as double
        record.Total.TWtensionreduction = str2double(stressFiles(93,i)); % Return total stress val as double
        record.Total.TWspirituality = str2double(stressFiles(94,i)); % Return total stress val as double
        % Return vectors of all self evaluation answers
        record.symptoms = str2double(stressFiles(4:15,i)); % Return vector of self eval scores
        record.cohen = str2double(stressFiles(18:27,i)); % Return vector of self eval scores
        record.ardwell = str2double(stressFiles(30:54,i)); % Return vector of self eval scores
        record.TW = str2double(stressFiles(57:88,i)); % Return vector of self eval scores
        % Categorize each total value on a sliding scale
        record.categories.cohen = categorizeStress(record.Total.Cohen,'cohen');
        record.categories.ardwell = categorizeStress(record.Total.Ardwell,'ardwell');
        record.categories.tw.w = categorizeStress(record.Total.TWwellness,'totalwellness');
        record.categories.tw.tc = categorizeStress(record.Total.TWthoughtcontrol,'totalwellness');
        record.categories.tw.ac = categorizeStress(record.Total.TWactivecoping,'totalwellness');
        record.categories.tw.se = categorizeStress(record.Total.TWsocialease,'totalwellness');
        record.categories.tw.tr = categorizeStress(record.Total.TWtensionreduction,'totalwellness');
        record.categories.tw.s = categorizeStress(record.Total.TWspirituality,'totalwellness');
        record.categories.tw.total = categorizeStress(record.Total.TW,'totalwellness');
        record.note = stressFiles(97,i); % Any notes associated with this set?

    elseif (is2020 == 1) % Indexes are already type double
        record = struct; % Return all stress information to the user in a struct
        record.FileName = filename;
        record.time = (stressFiles(3,i)); % What time of day was file recorded?
        record.Total.Symptoms = (stressFiles(16,i)); % Return total stress val as double
        record.Total.Cohen = (stressFiles(28,i)); % Return total stress val as double
        record.Total.Ardwell = (stressFiles(55,i)); % Return total stress val as double
        record.Total.TW = (stressFiles(95,i)); % Return total stress val as double
        record.Total.TWwellness = (stressFiles(89,i)); % Return total stress val as double
        record.Total.TWthoughtcontrol = (stressFiles(90,i)); % Return total stress val as double
        record.Total.TWactivecoping = (stressFiles(91,i)); % Return total stress val as double
        record.Total.TWsocialease = (stressFiles(92,i)); % Return total stress val as double
        record.Total.TWtensionreduction = (stressFiles(93,i)); % Return total stress val as double
        record.Total.TWspirituality = (stressFiles(94,i)); % Return total stress val as double
        % Return vectors of all self evaluation answers
        record.symptoms = (stressFiles(4:15,i)); % Return vector of self eval scores
        record.cohen = (stressFiles(18:27,i)); % Return vector of self eval scores
        record.ardwell = (stressFiles(30:54,i)); % Return vector of self eval scores
        record.TW = (stressFiles(57:88,i)); % Return vector of self eval scores
        record.note = stressFiles(97,i); % Any notes associated with this set?


        % Categorize each total value on a sliding scale
        record.categories.cohen = categorizeStress(record.Total.Cohen,'cohen');
        record.categories.ardwell = categorizeStress(record.Total.Ardwell,'ardwell');
        record.categories.tw.w = categorizeStress(record.Total.TWwellness,'totalwellness');
        record.categories.tw.tc = categorizeStress(record.Total.TWthoughtcontrol,'totalwellness');
        record.categories.tw.ac = categorizeStress(record.Total.TWactivecoping,'totalwellness');
        record.categories.tw.se = categorizeStress(record.Total.TWsocialease,'totalwellness');
        record.categories.tw.tr = categorizeStress(record.Total.TWtensionreduction,'totalwellness');
        record.categories.tw.s = categorizeStress(record.Total.TWspirituality,'totalwellness');
        record.categories.tw.total = categorizeStress(record.Total.TW,'totalwellness');
        
    end
    
elseif ((is2020 & corruptInd > 0) | ((is2020 == 0) & corruptInd == '1')) % Previously indicated corruption in the file of interest
    record.FileName = '0';
    str = sprintf('There is corruption indicated in this file. To continue, manually remove the corruption flag and try again.');
    disp(str);
    return;
end

if (length(char(record.note)) > 1)
    if (record.note == 'No note to provide.')
        ;
    else
        str = sprintf('There is a note associated with this record:\n%s',record.note);
        disp(str);
    end
end
end