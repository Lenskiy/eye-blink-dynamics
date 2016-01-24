addpath('./ICA/');
 path = '/Users/artemlenskiy/Documents/Research/Data/EEG/Synchronized and segmented/new eeg/';
 [session_raw_fp1, session_raw_fp2] = readSplitFrontElectrodes2(path);
%load('./Data/fp1_fp2_all_new.mat');
colors = get(gca,'colororder');close;
colors = [colors; colors; colors; colors];
sampling_rate = 250;
%% Preprocess EEG by removing low and high frequencies and apply ICA
for k = 1:size(session_raw_fp1,2)
    for i = 1:size(session_raw_fp1{1}, 1)
        session{k}(i, :) = amplify_blinks(session_raw_fp1{k}(i,:), session_raw_fp2{k}(i,:), sampling_rate);
    end
end

%% Detect blinks and form inter-blink intervals
good_ind = 1:size(session_raw_fp1{1}, 1);
%good_ind = setdiff(1:size(session_raw_fp1{1}, 1), [4]); % remove bad 
plot_detected_beats = 0;
for k = 1:size(session_raw_fp1,2)
    k
    for i = 1:length(good_ind)
        i
        [ibli, maxtab] = extract_ibli(session{k}(good_ind(i),:), sampling_rate);
         session_ibi{k}{good_ind(i)} = ibli;
         session_beat_pos{k}{good_ind(i)} = [maxtab(:,1) maxtab(:,2)];
         if plot_detected_beats
             figure('Position', [100, 100, 800, 600]), hold on;
             plot((1:length(session{k}(good_ind(i),:))), session{k}(good_ind(i),:)); 
             title(['Session = ' num2str(k) ' Subject = ' num2str(good_ind(i))]);
             plot(maxtab(:,1), maxtab(:,2), 'ro', 'MarkerSize', 5);
             for j = 1:length(maxtab)
                text(maxtab(j,1), maxtab(j,2) + 0.1, num2str(j));
             end
         end
    end
end


%% Calcualte number of blinks for each patient during each of five stages
for k = 1:5
    for i = 1:size(session_ibi{k},2);
        session_ibi_len(k,i) = length(session_ibi{k}{i});
    end
end
session_ibi_len(2,:) = session_ibi_len(2,:) /2 ;
%statistics for number of blinks
[mean(session_ibi_len); std(session_ibi_len)]

% Draw BRV for every session
drawBRVarray3(session_ibi, good_ind, session_ibi_len);

%% Calcualte mean and standard deviation for BRV
clear session_ibi_stat
for k = 1:5
    for i = 1:length(good_ind)
        session_ibi_stat(good_ind(i),:,k) = [mean(session_ibi{k}{good_ind(i)}) std(session_ibi{k}{good_ind(i)}) std(diff(session_ibi{k}{good_ind(i)}))];
    end
end
plotBlinkMeanPerSubject(session_ibi_stat, good_ind, session_ibi_len);
plotBlinkNumberPerSubject(session_ibi_len, good_ind);
plotBlinkStdPerSubject(session_ibi_stat, good_ind, session_ibi_len);
plotBlinkRMSSDPerSubject(session_ibi_stat, good_ind, session_ibi_len);

