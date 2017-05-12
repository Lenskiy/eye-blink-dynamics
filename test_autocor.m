clc;close all;clear all;
n=1000;
fs = 100;

white=randn(1,n)
brown=cumsum(white)

x=white;

[autocor,lags] = xcorr(x,n,'coeff');

plot(lags,autocor)
xlabel('Lag')
ylabel('Autocorrelation')
axis([-n n -0.2 1.1])

shift=20;
[autocor,lags] = xcorr(x(shift:end),n+1-shift,'coeff');

figure;plot(lags,autocor)
xlabel('Lag')
ylabel('Autocorrelation')
axis([-n n -0.2 1.1])

shift=50;
[autocor,lags] = xcorr(x(shift:end),n+1-shift,'coeff');

figure;plot(lags,autocor)
xlabel('Lag')
ylabel('Autocorrelation')
axis([-n n -0.2 1.1])
%%
