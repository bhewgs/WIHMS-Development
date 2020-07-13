function [moistDat,moistDiffs,maxPos,maxNeg,mDomFreq] = moistureProc(data,Fs)
    moistDat = smoothdata(data); % Smooth data with moving mean
    moistDiffs = diff(moistDat); % First difference of each successive sample
    mDomFreq = get_dom_freqs(data,Fs); % Dominant frequency of moisture data
    maxPos = max(moistDiffs);
    maxNeg = min(moistDiffs);
    
% rmap = 5/1024;
% gsr = data*rmap;
% gsrPhas = detrend(gsr,5);
% gsrTon = ((gsr-gsrPhas));
% figure;
% subplot(2,1,1);
% plot(t,gsr,'k');
% title('Unaltered GSR Data');
% xlim([0 360]);
% xlabel('Time (s)');
% ylabel('Volts (V)')
% subplot(2,1,2);
% yyaxis left;
% plot(t,gsrPhas,'-k');
% ylim([-.25 .25]);
% ylabel('Voltage (Phasic)')
% hold on;
% yyaxis right;
% plot(t,gsrTon,'--k');
% title('Separated GSR Data');
% xlim([0 360]);
% xlabel('Time (s)');
% ylabel('Voltage (Tonic)')
% legend('Phasic','Tonic')
% ax=gca;
% ax.YAxis(1).Color = 'k';
% ax.YAxis(2).Color = 'k';
end