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
good_ind = union(good_ind_bi, good_ind_mono + 28); %23

%% we assume, resting stages are same, therefore blinks reflecting them, should have similar statistics

% 1. Removed because resting stages number of blinks is too different
% a) correctly detected
good_ind = good_ind(good_ind~=5) 
good_ind = good_ind(good_ind~=20)


% b) resting 1 is incorrectly detected (amplified?)
good_ind = good_ind(good_ind~=29) 

% c) resting 2nd is incorrectly detected
good_ind = good_ind(good_ind~=26) 

% d) both resting stages are incorecctly detected
good_ind = good_ind(good_ind~=39)
good_ind = good_ind(good_ind~=15)


% e) closed eyes in 1st resting stage - different IBI sigma (to check)
good_ind = good_ind(good_ind~=40)
good_ind = good_ind(good_ind~=37)
good_ind = good_ind(good_ind~=35)
good_ind = good_ind(good_ind~=34)
good_ind = good_ind(good_ind~=1)

% f) closed eyes in 2nd resting stage - different sigma
good_ind = good_ind(good_ind~=33)
good_ind = good_ind(good_ind~=44)






colors = get(gca,'colororder');close;
colors = [colors; colors; colors; colors];
sampling_rate = 250;
% k = 1;
% for i = 1:length(good_ind)
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
    for i = 1:size(session_raw{1},1)
        i
        [ibli, maxtab] = extract_ibli(session{k}(i,:), sampling_rate);
        if(isempty(ibli))
            session_ibi{k}{i} = [];
            session_beat_pos{k}{i} = [];
            continue;
        end
         session_ibi{k}{i} = ibli;
         session_beat_pos{k}{i} = [maxtab(:,1) maxtab(:,2)];
         if plot_detected_beats
             figure('Position', [100, 100, 800, 600]), hold on;
             plot(((1:length(session{k}(i,:))))/sampling_rate, session{k}(i,:)); 
             title(['Session = ' num2str(k) ' Subject = ' num2str(good_ind(i))]);
             plot(maxtab(:,1)/sampling_rate, maxtab(:,2), 'ro', 'MarkerSize', 5);
             for j = 1:length(maxtab)
                text(maxtab(j,1)/sampling_rate, maxtab(j,2) + 0.1, num2str(j));
             end
         end
    end
end
%% [TO CHECK!!!] blinks detected by hand
% miss_blinks{1}{25}(1,:) = [374, 1374, 2193, 6361, 8101, 8569, 12950, 13960, 14340, 14660, 15000, 16500, 18640, 20520, 21410, 22740, 31900, 32430, 36910, 41040, 41450, 43040, 43260, 43720, 44400, 46590, 52360, 54580, 54960, 56150, 61970, 62760, 67740, ] ;
% miss_blinks{1}{23}(1,:) = [21140, 69090];
% miss_blinks{1}{19}(1,:) = [66400];
% miss_blinks{1}{17}(1,:) = [6445];
% miss_blinks{1}{14}(1,:) = [28900, 29460, 50880, 66290, 69570];
% miss_blinks{1}{13}(1,:) = [15030, 34590];
% miss_blinks{1}{12}(1,:) = [6275, 12060, 25710];
% miss_blinks{1}{11}(1,:) = [3493];
% miss_blinks{1}{5}(1,:) = [20840, 50450];
% miss_blinks{1}{1}(1,:) = [68150];
% 
% miss_blinks{2}{28}(1,:)= [23975, 24048, 40710];
% miss_blinks{2}{27}(1,:)= [24980, 41520, 68210, 85430, 91580];
% miss_blinks{2}{26}(1,:)= [57400, 88160];
% miss_blinks{2}{24}(1,:)= [35930, 147362];
% miss_blinks{2}{23}(1,:)= [18590, 51280, 59160];
% miss_blinks{2}{21}(1,:)= [17250, 19850, 46890, 61750, 110175, 119411, 123120, 13150];
% miss_blinks{2}{20}(1,:)= [79010];
% miss_blinks{2}{19}(1,:)= [58120, 64530, 78820, 132096, 139610, 141720];
% miss_blinks{2}{18}(1,:)= [5430, 106340];
% miss_blinks{2}{18}(1,:)= [5430, 106340];
% miss_blinks{2}{14}(1,:)= [34020, 37880, 40180, 55520, 57620, 65010, 91780];
% miss_blinks{2}{13}(1,:)= [85040, 87220, 113040]; %107412
% miss_blinks{2}{12}(1,:)= [10095, 11095, 14940, 67550, 70980, 72080, 89510, 1];
% miss_blinks{2}{11}(1,:)= [142472];
% miss_blinks{2}{9}(1,:) = [22250, 23110, 48870, 107726, 145261];
% miss_blinks{2}{8}(1,:) = [23490, 68660, 80250, 144455];
% miss_blinks{2}{7}(1,:) = [7853, 7965, 9104, 13540, 45260, 50250, 60880, 68060, 80840, 82170, 85220, 95980, 99920, 102629, 108484, 109005, 116236, 126815, 127794, 131366, 142852, 144432 ];
% miss_blinks{2}{1}(1,:) = [3616, 10090, 14940, 62650, 72080, 82060, 142166];
% 
% false_blinks{2}{27}(1,:)= [30483, 31649, 31861, 32617];
% false_blinks{2}{21}(1,:)= [17412];
% false_blinks{3}{27}(1,:)= [21078, 33451, 70367];
% false_blinks{3}{24}(1,:)= [30636];
% false_blinks{5}{18}(1,:)= [11735, 61172];
% false_blinks{5}{22}(1,:)= [73370];
% false_blinks{5}{23}(1,:)= [40440];
% 
% miss_blinks{3}{2}(1,:) = [23730, 33260, 45680, 46630];
% miss_blinks{3}{5}(1,:) = [65550];
% miss_blinks{3}{7}(1,:) = [37770, 37950, 38210, 63660, 65930, 72160, 72930];
% miss_blinks{3}{8}(1,:) = [2268, 14950];
% miss_blinks{3}{9}(1,:) = [11610, 34810];
% miss_blinks{3}{11}(1,:) = [29900];
% miss_blinks{3}{13}(1,:) = [54860, 55620];
% miss_blinks{3}{14}(1,:) = [19150, 22640, 24220, 38470, 38610, 38720, 39210, 51430,55920,  60870, 68040,  68160, 68950, 74490, 74560];
% miss_blinks{3}{15}(1,:) = [15180, 15860, 16060];
% miss_blinks{3}{16}(1,:) = [73504];
% miss_blinks{3}{17}(1,:) = [3098, 3706, 7656, 8345, 8616, 13220, 13790, 14380, 14740, 16140, 16220, 17160, 17220, 20060, 20800, 20880, 22940];
% miss_blinks{3}{19}(1,:) = [11820, 39520, ]; %19 ?
% miss_blinks{3}{20}(1,:) = [19370, 58440, 73120];
% miss_blinks{3}{23}(1,:) = [14000, 20450];
% miss_blinks{3}{24}(1,:) = [53065, 54800, 55700, 57330, 59570, 60080, 64790, 66294, 72310, 73540, 74550];
% miss_blinks{3}{25}(1,:) = [51, 481, 1137, 1551, 5859, 6428, 7068, 7774, 8036, 8425, 9762, 10730, 11740, 12510, 12920, 13870, 15940, 18160, 18380, 18960, 20930, 22690, 25120, 25790, 26750, 28780, 29420, 30580, 31740, 31970, 59210, 59530, 61110, 73040, 73360, 73670]; % check again
% miss_blinks{3}{26}(1,:) = [1134, 3485, 7687, 8010, 8435, 17040, 18830, 19020, 22090, 22280, 26320, 26520, 39310, 39970, 40340, 46780, 51410, 51640, 63160, 64540, 64890, 71940, 72890];
% miss_blinks{3}{28}(1,:) = [2598, 4563, 11690, 17600, 18940, 19200, 25110, 25590, 52010, 56100, 56500, 56580, 5840, 61120, 68510, 68630, 71590];
% 
% miss_blinks{4}{2}(1,:) = [31100];
% miss_blinks{4}{7}(1,:) = [29480, 32370, 37570, 38100, 41400];
% miss_blinks{4}{8}(1,:) = [33630, 72690, 72750];
% miss_blinks{4}{9}(1,:) = [23430, 38790, 46150];
% miss_blinks{4}{11}(1,:) = [44420];
% miss_blinks{4}{13}(1,:) = [11290, 23370, 35630, 38790, 70000];
% miss_blinks{4}{15}(1,:) = [51190, 56000, 74200];
% miss_blinks{4}{16}(1,:) = [797, 15000, 28240];
% miss_blinks{4}{18}(1,:) = [2202, 24450, 33070, 38160, 44970, 50260, 61250, 68630, 68870, 69480, 71970, 73120, 73670];
% miss_blinks{4}{19}(1,:) = [5089, 14200, 14940, 15890, 16600, 20800, 27050, 35250, 42350, 62380, 63040, 63840, 66680, 68150, 69570, 72770];
% miss_blinks{4}{21}(1,:) = [37410, 20850];
% miss_blinks{4}{23}(1,:) = [66750];
% miss_blinks{4}{24}(1,:) = [410, 1244, 8863, 13270];
% miss_blinks{4}{25}(1,:) = [8089];
% miss_blinks{4}{26}(1,:) = [13050];
% miss_blinks{4}{27}(1,:) = [16140];
% 
% miss_blinks{5}{1}(1,:) = [14620];
% miss_blinks{5}{2}(1,:) = [14850, 20300, 52020];
% miss_blinks{5}{7}(1,:) = [2117, 4344, 5773, 6949, 14030, 16710, 20870, 24670, 31800, 34360, 35560, 46940, 49560, 51150, 51330, 69600];
% miss_blinks{5}{8}(1,:) = [27450, 54300, 55700, 55790];
% miss_blinks{5}{9}(1,:) = [8341, 32280, 62720, 63860];
% miss_blinks{5}{11}(1,:) = [5045, 7235, 8400, 19410, 40790, 45420, 45890, 48570, 53070, 53740, 54430, 57840, 68860, 71200, 72020] ;
% miss_blinks{5}{13}(1,:) = [9805, 48140, 67950];
% miss_blinks{5}{14}(1,:) = [10490, 30840, 55610];
% miss_blinks{5}{17}(1,:) = [524, 623, 918, 2890, 3718, 3828, 4360, 4443, 9023, 9862, 10320, 11005, 12330, 13550, 15770, 17610, 18320, 19610, 20480, 22080, 22780, 22940, 25140, 25270, 25670, 26060, 27340, 28250, 34460, 34750, 36350, 36690, 37650, 38620, 38710, 41820, 44410, 46300, 46390, 50490, 51480, 53370, 54460, 55220, 56650, 58090, 59840, 61040, 62280, 62900, 64140, 65830, 68060, 68380, ];
% miss_blinks{5}{18}(1,:) = [45680];
% miss_blinks{5}{19}(1,:) = [2871, 12630, 14950, 18500, 19850, 19910, 28310, 37030, 41910, 55370, 57440];
% miss_blinks{5}{20}(1,:) = [73590];
% miss_blinks{5}{21}(1,:) = [3531, 39050, 47220, 56440];
% miss_blinks{5}{22}(1,:) = [26230];
% miss_blinks{5}{24}(1,:) = [27950, 28080, 28150, 28320, 28390, 41660];
% miss_blinks{5}{26}(1,:) = [43010, 43260, 43830, 43910];
% 
% %% Merge manual detection with automatic detection
% for k = 1:5
%     for i = 1:28
%         if (i < length(miss_blinks{k}) & ~isempty(miss_blinks{k}{i}))
%             session_beat_pos_corrected{k}{i} = sort(union(miss_blinks{k}{i}, session_beat_pos{k}{i}(:,1)));
%             session_beat_pos_corrected{k}{i}(:,2) = session{k}(i,session_beat_pos_corrected{k}{i});
%             session_ibi{k}{i} = diff(session_beat_pos_corrected{k}{i}(:,1))  / sampling_rate;
%         else
%             if(~isempty(session_beat_pos{k}{i}))
%                 session_beat_pos_corrected{k}{i} = session_beat_pos{k}{i}(:,1);
%                 session_beat_pos_corrected{k}{i}(:,2) = session{k}(i,session_beat_pos_corrected{k}{i});
%                 session_ibi{k}{i} = diff(session_beat_pos_corrected{k}{i}(:,1)) / sampling_rate;
%             end
%         end
%     end
% end
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
L = round(2.^[2.0:0.25:5]);
%L = L(1:10);
Q = [-15:3:15];
sessions1 = [3 3 4 2 2];
sessions2 = [2 4 5 4 5];
drawBRV_FS(Q, L, session_ibi, good_ind, sessions1, sessions2);

