function WIHMSdata = plotalldata(WIHMSdata)
   figure; 
   subplot(4,2,1); plot(WIHMSdata(:,2));title("ECG");
   subplot(4,2,2); plot(WIHMSdata(:,3)); title("IR PPG");
   subplot(4,2,3); plot(WIHMSdata(:,4));title("Red PPG");xlim([2 length(WIHMSdata(:,4))]); 
   subplot(4,2,4); plot(WIHMSdata(:,7)); title("Gyro"); 
   subplot(4,2,5); plot(WIHMSdata(:,6)); title("Moisture"); 
   % hold on; plot(detrend(WIHMSdata(:,6))); % What does the detrended data
   % look like?
   subplot(4,2,6); plot(WIHMSdata(:,5)); title("Temp: Skin vs Ambient");
   subplot(4,2,7); plot(WIHMSdata(:,8)); title("Temp: Skin");
   subplot(4,2,8); plot(WIHMSdata(:,9)); title("Temp: Ambient");
end