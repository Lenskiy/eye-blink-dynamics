%Self-similar random process generator
clc
clear all

%% setup

N=500;
fr=floor(N/2);

f=zeros(1,N);
a=randn(1,fr);
b=randn(1,fr);

S=zeros(1,N);
%% 1 PSD generator 
gamma=2; % hurst = alpha = (gamma+1)/2
for i=1:N
    S(i)=(1/i)^gamma;
end;
%% 2
f(1)=randn(1);
f(fr)=randn(1);
for i=2:N-1
    if(i<fr)
        f(i)=0.5*sqrt(S(i))*(a(i)+j*b(i));
    end;
    if(i>fr)
        f(i)=0.5*sqrt(S(N-i))*(a(N-i)-j*b(N-i));
    end;
end;
%% 3)
figure;plot(abs(ifft(f)))
