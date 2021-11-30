%espectrograma

[y,fs]=audioread('audio.wav');
colormap('gray'); map=colormap; imap = flipud(map);
M=round(0.02*fs);
N=2^nestpow2(4*M);
% w = 0.54-0.46*cos(2*pi*[0:M-1]/(M-1) 
colormap(imap);
specgram(y,N,fs);
title('Espectrograma de um arquivo de sample rate de 8000Hz);
ylim([0,(fs/2)/1000]);
