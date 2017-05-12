%% calculates how many words is in each sentence 
% WARNING: text has to be single paragraph ONLY!

clear all; close all;
load good_ind.mat
text = importdata('etiopia.txt');
sentences = strsplit(text{1},{'. ', '.'});
n_sentences = numel(sentences);
lengths = zeros(1,n_sentences); %number of words per sentence
l_lengths = lengths; %number of words longer than 1 per sentence
for i=1:n_sentences
    words = strsplit(sentences{i},' ');
    for j=1:numel(words)
        if numel(words{j})>2
           l_lengths(i) = l_lengths(i) + 1;
        end
    end

    lengths(i) = numel(words);
end;
%n_of_words = sum(lengths);
figure;hist(lengths);
figure;hist(l_lengths);
     
        %for i = 1:length(good_ind)
            x = lengths;
            h = kstest((x-mean(x))/std(x), 'Alpha',0.05); %if x is normal distribution with mean x and std x? 0 for yes, 1 for no
            [H, pValue, SWstatistic] = swtest(x)
        %end
   
        
        %% test
        clc
        nsample = 100;
        n1 = rand(nsample, 1);
        n1 = (n1-mean(n1))/std(n1);
        n2 = randn(nsample, 1);
        
%         figure, hist(n1);
%         figure, hist(n2);
        
        %[H,P,KSSTAT,CV] = kstest(n1, 'Alpha',0.5)
        [H,P,KSSTAT,CV] = kstest(n2, 'Alpha',0.1);
        
     %   h = kstest((n1), 'Alpha',0.05) %this seem to be wrong
       % h = kstest(n2) %if x is normal distribution with mean x and std x? 0 for yes, 1 for no
