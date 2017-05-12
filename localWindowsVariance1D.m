function varLaw = localWindowsVariance1D(detrended, L)
    
    N = length(detrended);

    for i = 1:length(L)
        varLaw{i} = zeros(1,ceil((N-2*L(i))/L(i)));
    end
    for i = 1:length(L)
         i;
        S = zeros((ceil((N - 2*L(i))/L(i))),1);
        subwindow_length = 2*L(i);
        for k = 1:L(i):N-2*L(i)
            subSignal = detrended(k:k+2*L(i)-1, i);
            %xmean = sum(subSignal(:)) ./ subwindow_length;
            %x = subSignal - xmean;
            %S(((k-1)/L(i))) = sum(x .* x) ./ (subwindow_length-1);
            S(((k-1 + L(i))/L(i))) = sqrt((sum(subSignal .* subSignal) - (sum(subSignal)^2)/subwindow_length)/(subwindow_length - 1)); 
            %R(((k-1)/L(i))) = max(subSignal(:)) - min(subSignal(:));                
        end
        %varLaw{i} = (S./R);
        varLaw{i} = S;
        %varLaw{i} = R;
        %S = 0;
        %R = 0;
    end
end