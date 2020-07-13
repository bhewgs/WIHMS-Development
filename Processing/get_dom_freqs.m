function doms = get_dom_freqs(modes,Fs)
% Compute fft
sz = length(modes);
n = 2^(nextpow2(sz)+1);
Y = fft(modes,n,1);

% Compute single sided spectrum
P2 = abs(Y/sz);
P1 = P2(1:n/2+1,:);
P1(2:end-1,:) = 2*P1(2:end-1,:);

% Define frequency range
freqs = (0:(Fs/n):(Fs/2)).';

% Find dominant frequency of each mode
[~,inds] = max(P1);
doms = freqs(inds,1);
end