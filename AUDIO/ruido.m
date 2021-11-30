Podemos filtrar alguns tipos de ruídos com o Octave, fazendo uso da transformada discreta de Fourier. Conheça as estratégias e participe de nossa LIVE.


[Y, fs] = audioread('samples/original/sample1.wav');
% Y corresponde a matriz de dados do audio, fs é a taxa de amostragem
t = linspace(0, length(Y)/fs, length(Y));
figure; plot(t, Y);
xlabel("Tempo"); ylabel("Amplitude");
title("Audio original no Domínio do Tempo");

% Usando FFT

N = length(Y);
f = linspace(0, fs, N);
X = fft(Y, N);
figure; plot(f(1:N/2), X(1:N/2));
xlabel("Frequencia"); ylabel("Amplitude");
title("Audio Original no Domínio da Frequência");

% Minimizando o ruído

X(1:10) = 0;
for i = 1:length(X)
if abs(X(i)) < 30
X(i) = 0;
endif
endfor

figure; plot(f(1:N/2), X(1:N/2));
xlabel("Frequencia"); ylabel("Amplitude");
title("Áudio modificado no Dominio da Frequência (Minimizando o ruído)");

% Usando IFFT

y_prime = ifft(X);
t = linspace(0, length(y_prime), length(y_prime));
figure; plot(t, y_prime);
xlabel("Time"); ylabel("Amplitude");
title("Sinal de áudio modificado no Domínio do Tempo (Minimizando o ruído)");
audiowrite(y_prime, fs, 'samples/clean/sample1.wav');