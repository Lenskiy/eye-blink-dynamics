function noise = sbf1d_(noise, L)
    N = length(noise);
    dim = 2^length(dec2bin(N));
    eim(dim) = 0;
    offest = floor((dim - N)/2);
    eim(1:offest) = noise(1);
    eim(offest+N+1:dim) = noise(N);
    eim(offest+1:offest+N) = noise;
    W(dim) = 0;
    cf = L/N;
    S = fft(double(eim));   %<----- Fourier transform of orginal signal (USDJPY)
    
    %coef1 = (cf^6)/(2*pi);
    %coef2 = -0.5*(cf^2);
    for r = 1:dim/2
            %temp = sqrt(sqrt(coef1*(r.^2).*exp(coef2*r.^2)));
            %temp = ((cf^4)/4)*w1*w2*exp((-1/2)*(cf^2)*(w1^2 + w2^2));
        temp = ((r)^3)*(cf^4)*exp(-(cf^2)*((r)^2)/2);       %<---- kernel - derivative of Gaussian
            %temp = (r^2)*(cf^3)*exp(-(cf^2)*(r^2)/2)/sqrt(2*pi);
            %temp = r*(cf^2)*exp(-(cf^2)*(r^2)/2);        
        W(r + 1) = temp; % @TODO: why here is r+1???
        W(dim - r + 1) = temp;
    end
 
    result = ifft(S.*W); %<--- filtering in Fourier domain
    noise = result(offest+1:offest+N);
    %noise = result(offest+L/2:offest+N-L/2);
end