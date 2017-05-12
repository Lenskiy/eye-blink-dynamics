    Fs = 50;
    tx = linspace(0,1,21) + .012*rand(1,21);
    x = sin(2*pi*tx);
    [y, ty] = resample(x, tx, Fs);
    plot(tx,x,'+-',ty,y,'o:')
    legend('original','resampled');
    xlabel('Time')
    axis tight 