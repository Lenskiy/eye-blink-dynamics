clear all; close all;
load alpha_peaks.mat; %aplha_peak (for q=0) 

rest1=a_peak(1,:); %rest 1
iq=a_peak(2,:); %IQ test
rest2=a_peak(3,:); %rest 2
read=a_peak(4,:); %reading
memory=a_peak(5,:); %memory test

%% One-sample Kolmogorov-Smirnov test - SCALE EXPONENTS
%https://www.mathworks.com/help/stats/kstest.html
%h = kstest(x) returns a test decision for the null hypothesis that the data in vector x comes from a standard normal distribution, against the alternative that it does not come from such a distribution, 
%The result h is 1 if the test rejects the null hypothesis at the 5% significance level, or 0 otherwise.
x = memory;
h = kstest((x-mean(x))/std(x), 'Alpha',0.05) %if x is normal distribution with mean x and std x? 0 for yes, 1 for no
%RESULTS
%we have 0 for all sessions, so all the data comes from a normal
%distributions - which is good


%% Two-sample Kolmogorov-Smirnov test - SCALE EXPONENTS
%https://www.mathworks.com/help/stats/kstest2.html#btno0lk-2
%Test the alternative hypothesis that the empirical cdf of x1 is unequal to the empirical cdf of x2.
x1=memory;
x2=read;
x1_dis=x1;%(x1-mean(x1))/std(x1);
x2_dis=x2;%(x2-mean(x2))/std(x2);
[h,p,k] = kstest2(x1_dis,x2_dis,'Alpha',0.1) 
% h = 1 indicates that kstest rejects the null hypothesis, in favor of the alternative hypothesis
%  value of k is the test statistic for the two-sample Kolmogorov-Smirnov test.
%RESULTS
%h_0 - distributions are unequal
%h_A - distributions are equal

%rest1 - rest2 - accepted: h_0
%iq - memory - h_A
%iq - read - h_0
%iq - rest1 - h_0
%iq - rest2 - h_0
%memory - read - h_A

%% One-sample Kolmogorov-Smirnov test - BLINK RATE
    clear all;close all;clc;
    load 51-session-ibi-len.mat;
    load good_ind.mat;
    % for all subjects
    for k = 1:5  
        %for i = 1:length(good_ind)
            x = session_ibi_len(k,:); 
            h = kstest((x-mean(x))/std(x), 'Alpha',0.05) %if x is normal distribution with mean x and std x? 0 for yes, 1 for no
        %end
    end
    
    % only for good_ind subjects
    for k = 1:5  
        for i = 1:length(good_ind)
            x(i) = session_ibi_len(k,good_ind(i)); 
        end
            h = kstest((x-mean(x))/std(x), 'Alpha',0.05) %if x is normal distribution with mean x and std x? 0 for yes, 1 for no

    end
% RESULTS: BLINK RATEs of subjects per each session are distributed normally with p=0.05

%% One-sample Kolmogorov-Smirnov test - BRV(IBI)
    clear all;close all;clc;
    load 51-session-ibi.mat;
    load good_ind.mat;
    % for all subjects
%     for k = 1:5  
%         for i = 1:length(good_ind)
%             x = session_ibi(k,:); 
%             h = kstest((x-mean(x))/std(x), 'Alpha',0.05) %if x is normal distribution with mean x and std x? 0 for yes, 1 for no
%        end
%     end
    sum_1 = 0;
    sum_0 = 0;
    % only for good_ind subjects
    for k = 1:5  
        s = session_ibi{k};
        for i = 1:length(good_ind)
            x = s{good_ind(i)}; 
            h = kstest((x-mean(x))/std(x), 'Alpha',0.05); %if x is normal distribution with mean x and std x? 0 for yes, 1 for no
            if(h==0) sum_0 = sum_0+1; disp(k);  end
            if(h==1) sum_1 = sum_1+1; end
        end          
    end
% RESULTS: BLINK RATEs of subjects per each session are distributed normally with p=0.05

%%a [H, pValue, SWstatistic] = swtest(rest2) - BRV(IBI)

    clear all;close all;clc;
    load 51-session-ibi.mat;
    load good_ind.mat;
    % for all subjects
%     for k = 1:5  
%         for i = 1:length(good_ind)
%             x = session_ibi(k,:); 
%             h = kstest((x-mean(x))/std(x), 'Alpha',0.05) %if x is normal distribution with mean x and std x? 0 for yes, 1 for no
%        end
%     end
    sum_1 = 0;
    sum_0 = 0;
    % only for good_ind subjects
    for k = 1:5  
        s = session_ibi{k};
        for i = 1:length(good_ind)
            x = s{good_ind(i)}; 
            h = swtest(x); %if x is normal distribution with mean x and std x? 0 for yes, 1 for no
            if(h==0) sum_0 = sum_0+1; disp(k);  end
            if(h==1) sum_1 = sum_1+1; end
        end          
    end
% RESULTS: BLINK RATEs of subjects per each session are distributed normally with p=0.05

