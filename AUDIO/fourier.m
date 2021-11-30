%Transformada de Fourier
[y,Fs]=audioread('audio.wav');
Namostras=lenght(y);
t=(1/Fs)*(1:Namostras);
y_fft=abs(fft(y));
y_fft=y_fft(1:Namostras/2);
f=Fs*(0:Namostras/2-1/Namostras;
figure;
plot(f,y_fft);
xlim([0 4000]);
xlabel('Frequência (Hz)');
ylabel('Amplitude');
title('Transformada de Fourier').