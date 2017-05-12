function [mfs alfa f Intercept]= partitionFunction4(varLaw, L, Q)

    f(length(varLaw),1) = 0;
    alfa(length(varLaw),1) = 0;
    log2X = [log(L) ones(length(L),1)];
    
    for s = 1:length(L)
        log_sigma{s} = log(varLaw{s});
    end
    %figure, hold on, grid on;
    for q = 1:length(Q)
        for s = 1:length(L)
            sigma_q = varLaw{s}.^Q(q);
            chi = sum(sigma_q);
            mu = sigma_q/chi;
            logmu = log(mu);
            f(s) = sum(mu.*logmu);
            alfa(s) = sum(mu.*log_sigma{s});
        end
     %   if (Q(q) ~= 0)
     %       plot(log2X(:,1), alfa,':.');
     %   else
     %       plot(log2X(:,1), alfa,'ro:');
     %   end
        p = log2X\[f alfa]; %TODO: WHAT IS THAT @__@?
        %p = inv((log2X)'*log2X) * log2X' * f;
        f_(q) = p(1,1);
        alfa_(q) = p(1,2);
        Intercept(q) = p(2,2);   % TODO: WHAT IS INTERCEPT @_@?   
    end
    
    mfs = [f_; alfa_];    
end