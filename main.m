clc;
clear all;
close all;
xn= input('Escolha um sinal =');
N= input('Valor de N = ');

tic;
xk = mainFFT(xn,N);
t(1)= toc;


tic;
xk1 =  df_transform(xn,N);
t(2)= toc;

tic;
fourierFFT= fft(xn);
t(3)= toc

k=0:N-1;
subplot(2,1,1)
stem(k,abs(xk))
xlabel('k');
ylabel('|xK|')
title('Magnitude Plot')
subplot(2,1,2)
stem(k,angle(xk))
xlabel('k');
ylabel('angle(XK)')
title('phase Plot')