addpath('./ICA/');
path = '/Users/artemlenskiy/Documents/Research/Data/EEG/Synchronized and segmented/new eeg/';
%[session_raw_fp1, session_raw_fp2 labels] = readSplitFrontElectrodes2(path);
load('./Data/eeg28.mat');
[session_raw_fp1_fp3, session_raw_fp2_fp4] = clear_manually(session_raw_fp1_fp3, session_raw_fp2_fp4);
load('./Data/fp1_fp2_all_new.mat');
%combine old bipolar and new monopolar data
for k = 1:5
    session_raw{k} = [session_raw_fp1_fp3{k}; session_raw_fp1{k}];
end
good_ind_bi = setdiff(1:size(session_raw_fp1_fp3{1}, 1), [19 24 27 21 17 10 8 7 6 4 25 11 3 18]);
good_ind_mono = setdiff(1:size(session_raw_fp1{1}, 1), [22 19 18 7 4 1 23, 9 8,13,20 5]);
good_ind = union(good_ind_bi, good_ind_mono + 23);

colors = get(gca,'colororder');close;
colors = [colors; colors; colors; colors];
sampling_rate = 250;
% k = 1;
% for i = 1:23
%     figure, 
%     subplot(2,1,1), hist(session_raw_fp1{k}(i,:));
%     subplot(2,1,2), plot(session_raw_fp1{k}(i,:));
% end
% bad_ind_s1 = [19 18 7 6 4 1];
% bad_ind_s2 = [19 12 9 8 4];
%% Preprocess EEG by removing low and high frequencies and apply ICA
for k = 1:size(session_raw,2)
    for i = 1:size(session_raw{1}, 1)
        i
        session{k}(i, :) = amplify_blinks(session_raw{k}(i,:), session_raw{k}(i,:), sampling_rate);
    end
end

% k = 1;
% for i = 1:23
%     figure, 
%     subplot(2,1,1), hist(session{k}(i,:));
%     subplot(2,1,2), plot(session{k}(i,:));
% end

%% Detect blinks and form inter-blink intervals

%good_ind = setdiff(1:size(session_raw_fp1{1}, 1), union(bad_ind_s1, bad_ind_s2)); % remove bad [20 19 18 13 8 2 1]
% focus on 11, 5, 3, 13: relatively good signal, but plenty incorrectly detected beats
clear session_ibi session_beat_pos
plot_detected_beats = 0;
for k = 1:size(session_raw,2)
    k
    for i = 1:length(good_ind)
        i
        [ibli, maxtab] = extract_ibli(session{k}(good_ind(i),:), sampling_rate);
         session_ibi{k}{good_ind(i)} = ibli;
         session_beat_pos{k}{good_ind(i)} = [maxtab(:,1) maxtab(:,2)];
         if plot_detected_beats
             figure('Position', [100, 100, 800, 600]), hold on;
             plot(((1:length(session{k}(good_ind(i),:))))/sampling_rate, session{k}(good_ind(i),:)); 
             title(['Session = ' num2str(k) ' Subject = ' num2str(good_ind(i))]);
             plot(maxtab(:,1)/sampling_rate, maxtab(:,2), 'ro', 'MarkerSize', 5);
             for j = 1:length(maxtab)
                text(maxtab(j,1)/sampling_rate, maxtab(j,2) + 0.1, num2str(j));
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

%% Estimate multifractal spectrum for BRV
L = round(2.^[2.0:0.25:3]);
%L = L(1:10);
Q = [-15:3:15];
sessions1 = [3 3 4];
sessions2 = [2 4 5];
drawBRV_FS(Q, L, session_ibi, good_ind, sessions1, sessions2);

