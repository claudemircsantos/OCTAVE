% Adaptado da obra de Ian McLoughlin
% Applied Speech and Audio Processing

[x,fs] = audioread('e.wav');

len=length(x);

%Cepstrum
ps=log(abs(fft(x)));
cep=ifft(ps);

%Filtro
cut=30;
cep2=zeros(1,len);
cep2(1:cut-1)=cep(1:cut-1)*2;
cep2(1)=cep(1);
cep2(cut)=cep(cut);

%Domínio da frequência
env=real(fft(cep2));
act=real(fft(cep));

%Resultados
pl1=20*log10(env(1:len/2));
pl2=20*log10(act(1:len/2));
span=[1:fs/len:fs/2];

subplot(1,2,1);
plot(span,pl2,'-b');
xlabel('Frequência  Hz');

subplot(1,2,2);
plot(span,pl1,'-r.');

xlabel('Frequência  Hz');