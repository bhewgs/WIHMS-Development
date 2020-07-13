function is2020 = checkVersion()
MLversion = version;
is2020 = 0;
for i=1:length(MLversion)-5
    if (lower(char((MLversion(i:i+4))))=='r2020')
        is2020 = 1;
        break;
    end
end
end