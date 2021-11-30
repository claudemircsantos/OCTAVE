% Produz : forma de onda, Análise espectral e espectrograma

clearvars;
[y,Fs] = audioread('audio.wav');
normal = length(y);
t = (1/Fs)*(1:normal)

%forma de onda
subplot(1,3,1);
plot(t,y(1:normal));
xlabel ('Tempo (s)');
ylabel ('Amplitude');
title ('Forma de onda');

%Código de análise espectral inspirado em material
%produzido por Wagner Rambo (youtube)

aux = 0:normal-1;
T = normal/Fs;
frequencia = aux/T;
y_fft = abs(fft(y));
S = y_fft/normal;
fc = ceil(normal/2);
S = S(1:fc);
eixo_x = frequencia(1:fc);

%Análise espectral
subplot(1,3,2);
plot(eixo_x,abs(S));
xlabel ('Frequência Hz');
ylabel ('Amplitude');
title ('Transformada de Fourier');

%Espectrograma
subplot(1,3,3);
colormap('gray'); map = colormap; imap = flipud(map);
M = round(0.02*Fs);
N = 2^nextpow2(4*M);
% w = 0.54 - 0.46 * cos(2*pi*[0:M-1]/(M-1)); % w = hamming(M);
colormap(imap);
specgram(y,N,Fs);
%colormap(imap);
title('Espectrograma');