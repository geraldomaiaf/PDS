clc;
clear all;
close all;
xn= ones(1,8);
N= 16;

%xn = zeros(1,8);
%xn(1,1)= 1;
   
tic;
xk1 =  df_transform(xn,N);
t(1)= toc
   
tic;
xk = myFFT(xn,N);
t(2)= toc


tic;
xk5= fft(xn,N);
t(3)= toc

tic;
xk4 = minhaFFT_iterativa(xn, N);
t(4)= toc



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
