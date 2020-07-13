% Data comes in as a single vector, but contains both ambient and skin
% temps separated by 16 samples
function [tempDiff, skinTemps, ambientTemps] = splitTemps(data,showTemps)

skinVect = zeros(length(data),1);
skinVect(1) = data(17);
ambientVect = zeros(length(data),1);
tempVect = zeros(16,1);

for i = 1:length(data)-16

    if ((mod(i,32)<17)&(mod(i,32)>0)) % Are we looking at ambient temp or skin temp?
        ambientVect(i) = data(i);
    else 
        skinVect(i) = data(i);
    end
    
     if ambientVect(i) == 0 % This ambient temp lost because we were recording skin temp
          tempVect = linspace(ambientVect(i-1),data(i+16),16);
          for j = 0:1:15
            ambientVect(i+j) = tempVect(j+1);
          end
     end
     if skinVect(i) == 0 % This skin temp lost because we were recording ambient temp
         tempVect = linspace(skinVect(i-1),data(i+16),16);
          for j = 0:1:15
            skinVect(i+j) = tempVect(j+1);
          end
     end
end

ambientVect(length(ambientVect)-16:length(ambientVect)) = ambientVect(length(ambientVect)-17);
skinVect(length(skinVect)-16:length(skinVect)) = skinVect(length(skinVect)-17);

skinTemps = skinVect;
skinTemps = skinTemps;
ambientTemps = ambientVect;
tempDiff = skinTemps-ambientTemps;
if (showTemps)
    figure; plot(skinTemps);hold on;plot(ambientTemps);hold on;plot(tempDiff); 
    legend('Skin','Ambient','Difference');ylabel('Temp (degrees F)');
    xlabel('Sample Num');title("Measured Temperatures")
end

% t=linspace(0,length(data)/200,length(data));
% figure;
% subplot(4,1,1);
% plot(t,data);
% title('Raw Temperature Data');
% subplot(4,1,2);
% plot(t,skinTemps); hold on;
% plot(t,ambientTemps);
% title('Extracted Skin and Ambient');
end