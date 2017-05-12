function [gfd intercept] = estimateGFD(signal, L, Q)
     for i = 1:length(L)
%         %detrended(:,i) = sbf2dFastv1(signal, L(i));
         detrended(:,i) = sbf1d_(signal, L(i));
%         %detrended(:,i) = sbf1d(signal, L(i));
%         %detrended(:,i) = gassianDerivativesFilterFast(signal, L(i));
     end
% 
      varLaw = localWindowsVariance1D(detrended, L);

%     varLaw = varForScale_(signal, L);
%     
%     for s = 1:length(L)
%         for q = 1:length(Q)
%             densGlobalMatrixPyr{s, q} = varLaw{s}.^Q(q);
%         end    
%     end
%     
%     ysTotal = [];

    %[h ysTotal intercept] = GFDp(densGlobalMatrixPyr,L', Q');
    %gfd = h
    %[mfs alfa f intercept] = partitionFunction3(densGlobalMatrixPyr, L', Q);
    %gfd = mfs(2,:);
    [mfs alfa f intercept] = partitionFunction4(varLaw, L', Q);
    gfd = mfs(2,:);
    
end