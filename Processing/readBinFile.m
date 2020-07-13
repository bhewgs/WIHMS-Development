% Open file and read data from a binary WIHMS data file
function data = readBinFile(str)
%display(str);
fileID = fopen(str);
D = size(fread(fileID));
fclose('all');
fileID = fopen(str);
A = fread(fileID,[16 D(1)/16], 'uint8'); % read bin file - each column is a sample
%% Determine when the file was collected
% Not all that relevant right now
day = A(5,1); % Day of month of file creation
hour = A(6,1); % Hour of file creation
minute = A(7,1); % Minute of file creation
second = A(8,1); % Second of file creation
bytes = [A(1,1) A(2,1) A(3,1) A(4,1)];
mics = typecast(uint8(bytes), 'uint32')/1000; % Milliseconds since program start
%% Read the bin file to pull out sensor data
data = zeros(length(A)-1,7); % Preallocate the data vector
for i = (2:length(A)) % First row is a timestamp - bio data starts at column 2
    bytes = [A(1,i) A(2,i) A(3,i) A(4,i)]; % Uint32: microseconds since start time
    mil32 = typecast(uint8(bytes), 'uint32');
    data(i-1,1) = mil32; % Place the microseconds elapsed into the data vector
    
    bytes = [A(5,i) A(6,i)]; % ECG value stored as 16 bit int
    ECG16 = typecast(uint8(bytes),'int16');
    data(i-1,2) = ECG16; % Place ECG value into data matrix
    
    bytes = [A(7,i) A(8,i)]; % IR Pulse oximeter reading
    POX32 = typecast(uint8(bytes),'uint16');
    data(i-1,3) = POX32;
    
    %bytes = [A(11,i) A(12,i)]; % red pox
    bytes = [A(9,i) A(10,i)]; % red pox
    m16 = typecast(uint8(bytes),'uint16');
    data(i-1,4) = m16;
    
    %bytes = [A(13,i) A(14,i)]; % Thermometer reading
    bytes = [A(11,i) A(12,i)]; % Thermometer reading
    temp16 = typecast(uint8(bytes),'int16');
    data(i-1,5) = double(temp16)/100;
    
    %bytes = [A(15,i) A(16,i)]; % Moisture sensor 2
    bytes = [A(13,i) A(14,i)]; % Moisture sensor 2
    mcnt = typecast(uint8(bytes),'int16');
    data(i-1,6) = mcnt;
    
    bytes = [A(15,i) A(16,i)]; % Gyroscope
    mcnt = typecast(uint8(bytes),'int16');
    data(i-1,7) = mcnt;
    
end

for n = (2:length(data(:,3))-1)
        if (((data(n-1,3)-data(n,3))>60000)||(data(n,3)<10000))
          data(n,3) = data(n,3)+65535;
        end
        if (((data(n-1,4)-data(n,4))>60000)||(data(n,4)<10000))
          data(n,4) = data(n,4)+65535;
        end
end

if (abs(data(1,3)-data(2,3))>10000) % Handle if first pox sample is problematic
    data(1,3) = data(1,3) + 65535;
end

if (abs(data(1,4)-data(2,4))>10000) % Handle if first pox sample is problematic
    data(1,4) = data(1,4) + 65535;
end

% Divide Temperature Vector into Skin, Ambient, Diff
[data(:,5), data(:,8), data(:,9)] = splitTemps(data(:,5),0); % Separate skin and ambient temperatures

compStr = sprintf("Binary file %s read into workspace as WIHMSdata",str);
disp(compStr);
end