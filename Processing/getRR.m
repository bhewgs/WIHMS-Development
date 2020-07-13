function LFHF = getRR(RR, Fs) 
% This function calculates the LFHF power ratio
[LFRR, HFRR] = RRfreqs(RRcenter, floor(Fs/10));
RRcenter = RR(floor((length(RR)/10)):floor(9*(length(RR)/10)));
LFRR = rrLow(RRcenter, floor(Fs/10));
HFRR = rrHigh(RRcenter, floor(Fs/10));

RRlowfreq = (rms(LFRR)^2);
RRhighfreq = (rms(HFRR)^2);

LFHF = RRlowfreq/RRhighfreq;
end