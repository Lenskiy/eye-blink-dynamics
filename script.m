addpath('./ICA/');
colors = get(gca,'colororder');close;
colors = [colors; colors; colors; colors];
%load up fp1-fp3 and fp2-fp4 EEG for all patients w/o and w/ music
%subjects 1 ~ 18 are w/o music
% load('./Data/fp1_fp3_iq_all.mat');;
% load('./Data/fp1_fp3_memory_all.mat');
% load('./Data/fp1_fp3_rest1_all.mat')
% load('./Data/fp1_fp3_rest2_all.mat');
% 
% load('./Data/fp2_fp4_iq_all.mat');
% load('./Data/fp2_fp4_memory_all.mat');
% load('./Data/fp2_fp4_rest1_all.mat');
% load('./Data/fp2_fp4_rest2_all.mat');
load('./Data/eeg28.mat');
%labels_nomusic = [1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 32]; %subjects IDs
sampling_rate = 250;

%path = '/Users/artemlenskiy/Documents/Research/Data/EEG/Synchronized and segmented/eeg all/';
%[session_raw_fp1_fp3 session_raw_fp2_fp4] = readSplitFrontElectrodes(path);

pseudo_std = 20;
%manually remove artifacts
%replace original signals with manually cleaned up ones
session_raw_fp2_fp4{1}(21,6900:7650) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(21,6900:7650), pseudo_std);
session_raw_fp2_fp4{1}(19,12000:14000) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(19,12000:14000), pseudo_std);
session_raw_fp2_fp4{1}(19,46240:46340) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(19,46240:46340), pseudo_std);
session_raw_fp2_fp4{1}(22,74000:74380) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(22,74000:74380), pseudo_std);
session_raw_fp2_fp4{2}(19,74400:74650) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(19,74400:74650), pseudo_std);
session_raw_fp2_fp4{2}(19,2000:2800) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(19,2000:2800), pseudo_std);
session_raw_fp2_fp4{2}(2,77600:79400) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(2,77600:79400), pseudo_std);
session_raw_fp2_fp4{2}(5,47750:48000) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(5,47750:48000), pseudo_std);
session_raw_fp2_fp4{2}(6,20300:20450) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(6,20300:20450), pseudo_std);
session_raw_fp2_fp4{2}(26,56950:57100) = replaceWithBrownNoise(session_raw_fp2_fp4{2}(26,56950:57100), pseudo_std);
session_raw_fp2_fp4{3}(26,5600:5900) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(26,5600:5900), pseudo_std);
session_raw_fp2_fp4{3}(26,21330:21480) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(26,21330:21480), pseudo_std);
session_raw_fp2_fp4{3}(26,16350:16450) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(26,16350:16450), pseudo_std);
session_raw_fp2_fp4{4}(26,50850:51050) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(26,50850:51050), pseudo_std);
session_raw_fp2_fp4{5}(26,41660:42150) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(26,41660:42150), pseudo_std);
session_raw_fp2_fp4{3}(28,20600:22300) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(28,20600:22300), pseudo_std);
session_raw_fp2_fp4{1}(28,42525:43000) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(28,42525:43000), pseudo_std);
session_raw_fp2_fp4{1}(28,25300:25900) =  replaceWithBrownNoise(session_raw_fp2_fp4{1}(28,25300:25900), pseudo_std);
session_raw_fp2_fp4{3}(28,20600:22300) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(28,20600:22300), pseudo_std);

session_raw_fp2_fp4{3}(25,67600:69200) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,67600:69200), pseudo_std);
session_raw_fp2_fp4{3}(17,55500:56300) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(17,55500:56300), pseudo_std);
session_raw_fp2_fp4{3}(17,74650:74800) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(17,74650:74800), pseudo_std);
session_raw_fp2_fp4{3}(1,28550:28700) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(1,28550:28700), pseudo_std);
session_raw_fp2_fp4{3}(21,43400:43550) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(21,43400:43550), pseudo_std);
session_raw_fp2_fp4{3}(19,10800:11100) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(19,10800:11100), pseudo_std);
session_raw_fp2_fp4{3}(24,74600:75000) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(24,74600:75000), pseudo_std);
session_raw_fp2_fp4{3}(24,56400:57000) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(24,56400:57000), pseudo_std);
session_raw_fp2_fp4{3}(24,58800:59100) = replaceWithBrownNoise(session_raw_fp2_fp4{3}(24,58800:59100), pseudo_std);
session_raw_fp2_fp4{5}(24,9850:10250) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(24,9850:10250), pseudo_std);
session_raw_fp2_fp4{1}(25,29600:30300) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(25,29600:30300), pseudo_std);
session_raw_fp2_fp4{1}(25,32790:33500) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(25,32790:33500), pseudo_std);
session_raw_fp2_fp4{1}(25,60000:61000) = replaceWithBrownNoise(session_raw_fp2_fp4{1}(25,60000:61000), pseudo_std);
session_raw_fp2_fp4{2}(25,47600:47750)  = replaceWithBrownNoise(session_raw_fp2_fp4{2}(25,47600:47750), pseudo_std);
session_raw_fp2_fp4{3}(25,2980:3100)  = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,2980:3100), pseudo_std);
session_raw_fp2_fp4{3}(25,63050:63450)  = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,63050:63450), pseudo_std);
session_raw_fp2_fp4{3}(25,67600:69200)  = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,67600:69200), pseudo_std);
session_raw_fp2_fp4{3}(25,66460:66560)  = replaceWithBrownNoise(session_raw_fp2_fp4{3}(25,66460:66560), pseudo_std);
session_raw_fp2_fp4{4}(25,58350:58700) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(25,58350:58700), pseudo_std);
session_raw_fp2_fp4{5}(25,16600:17100) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(25,16600:17100), pseudo_std);
session_raw_fp2_fp4{5}(28,68675:75000) = session_raw_fp2_fp4{5}(28,62350:68675);


session_raw_fp2_fp4{4}(22,40140:40220) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(22,40140:40220), pseudo_std);
session_raw_fp2_fp4{4}(19,21300:21650) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(19,21300:21650), pseudo_std);
session_raw_fp2_fp4{4}(2,20500:20700) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(2,20500:20700), pseudo_std);
session_raw_fp2_fp4{4}(9, 30200:30800) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(9, 30200:30800), pseudo_std); %50
session_raw_fp2_fp4{4}(14, 54600:54900) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(14, 54600:54900), pseudo_std);
session_raw_fp2_fp4{4}(15, 72500:75000) = replaceWithBrownNoise(session_raw_fp2_fp4{4}(15, 72500:75000), pseudo_std); %50
session_raw_fp2_fp4{5}(20, 72500:73300) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(20, 72500:73300), pseudo_std);
session_raw_fp2_fp4{5}(20, 70400:71600) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(20, 70400:71600), pseudo_std);

session_raw_fp2_fp4{5}(9, 64500:66500) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(9, 64500:66500), pseudo_std); % 50
session_raw_fp2_fp4{5}(2,64940) = session_raw_fp2_fp4{5}(2,64941); %because of NaN
session_raw_fp2_fp4{5}(2,65000:end) = session_raw_fp2_fp4{5}(2,55000:65000);
session_raw_fp2_fp4{5}(1,64445) = session_raw_fp2_fp4{5}(1,64446); %because of NaN
session_raw_fp2_fp4{5}(1,65000:end) = session_raw_fp2_fp4{5}(1,55000:65000);
session_raw_fp2_fp4{5}(15, 44500:46500) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(15, 44500:46500), pseudo_std); % 50
session_raw_fp2_fp4{5}(17, 48400:50600) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(17, 48400:50600), pseudo_std);
session_raw_fp2_fp4{5}(18,40900:41000) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(18,40900:41000), pseudo_std);
session_raw_fp2_fp4{5}(18,68671:end) = session_raw_fp2_fp4{5}(18, 62342:68671);
session_raw_fp2_fp4{5}(18, 68676) = session_raw_fp2_fp4{5}(18, 68677);
session_raw_fp2_fp4{5}(9, 46000:48000) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(9, 46000:48000), pseudo_std); % 50
session_raw_fp2_fp4{5}(9, 63650:64000) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(9, 63650:64000), pseudo_std); % 50
session_raw_fp2_fp4{5}(21,36940:37750) = replaceWithBrownNoise(session_raw_fp2_fp4{5}(21,36940:37750), pseudo_std);


session_raw_fp1_fp3{1}(4,5000:6200) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(4,5000:6200), pseudo_std);
session_raw_fp1_fp3{1}(4,58000:58350) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(4,58000:58350), pseudo_std);
session_raw_fp1_fp3{1}(4,39600:39900) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(4,39600:39900), pseudo_std);
session_raw_fp1_fp3{1}(4,24200:24400) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(4,24200:24400), pseudo_std);
session_raw_fp1_fp3{1}(1,28550:28700) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(1,28550:28700), pseudo_std);
session_raw_fp1_fp3{1}(18,21750:22250) = replaceWithBrownNoise(session_raw_fp1_fp3{1}(18,21750:22250), pseudo_std);
session_raw_fp1_fp3{2}(19,74390:74531) = replaceWithBrownNoise(session_raw_fp1_fp3{2}(19,74390:74531), pseudo_std);
session_raw_fp1_fp3{2}(19,147100:147450) = replaceWithBrownNoise(session_raw_fp1_fp3{2}(19,147100:147450), pseudo_std);
session_raw_fp1_fp3{2}(19,145040:145160) = replaceWithBrownNoise(session_raw_fp1_fp3{2}(19,145040:145160), pseudo_std);
session_raw_fp1_fp3{4}(19,21350:21532) = replaceWithBrownNoise(session_raw_fp1_fp3{4}(19,21350:21532), pseudo_std);
session_raw_fp1_fp3{5}(19,18380:18520) =  replaceWithBrownNoise(session_raw_fp1_fp3{5}(19,18380:18520), pseudo_std);
session_raw_fp1_fp3{5}(19,24444:24560) =  replaceWithBrownNoise(session_raw_fp1_fp3{5}(19,24444:24560), pseudo_std);

session_raw_fp1_fp3{2}(6,20300:20450) = replaceWithBrownNoise(session_raw_fp1_fp3{2}(6,20300:20450), pseudo_std);
session_raw_fp1_fp3{3}(11,73200:73800) = replaceWithBrownNoise(session_raw_fp1_fp3{3}(11,73200:73800), pseudo_std);
session_raw_fp1_fp3{3}(19,10800:11400) = replaceWithBrownNoise(session_raw_fp1_fp3{3}(19,10800:11400), pseudo_std);
session_raw_fp1_fp3{3}(19,45700:46150) =  replaceWithBrownNoise(session_raw_fp1_fp3{3}(19,45700:46150), pseudo_std);
session_raw_fp1_fp3{3}(19,37440:37540) =  replaceWithBrownNoise(session_raw_fp1_fp3{3}(19,37440:37540), pseudo_std);


session_raw_fp1_fp3{4}(4,35100:35900) = replaceWithBrownNoise(session_raw_fp1_fp3{4}(4,35100:35900), pseudo_std);
session_raw_fp1_fp3{4}(4,60200:60700) = replaceWithBrownNoise(session_raw_fp1_fp3{4}(4,60200:60700), pseudo_std);
session_raw_fp1_fp3{4}(11,800:1200) = replaceWithBrownNoise(session_raw_fp1_fp3{4}(11,800:1200), pseudo_std);

session_raw_fp1_fp3{5}(11,41986:42120) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,41986:42120), pseudo_std);
session_raw_fp1_fp3{5}(11,65230:65870) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,65230:65870), pseudo_std);
session_raw_fp1_fp3{5}(11,34800:35300) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,34800:35300), pseudo_std);
session_raw_fp1_fp3{5}(11,60300:61070) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,60300:61070), pseudo_std);
session_raw_fp1_fp3{5}(11,72750:73695) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,72750:73695), pseudo_std);
session_raw_fp1_fp3{5}(11,28500:29000) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,28500:29000), pseudo_std);
session_raw_fp1_fp3{5}(11,46840:47375) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,46840:47375), pseudo_std);
session_raw_fp1_fp3{5}(11,38144:39000) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,38144:39000), pseudo_std);
session_raw_fp1_fp3{5}(11,52140:52320) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,52140:52320), pseudo_std);
session_raw_fp1_fp3{5}(11,42100:42900) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(11,42100:42900), pseudo_std);
session_raw_fp1_fp3{5}(1,64441:end) = session_raw_fp2_fp4{5}(1,64441:end);
session_raw_fp1_fp3{5}(2,65000:end) = session_raw_fp1_fp3{5}(2,55000:65000);
session_raw_fp1_fp3{5}(4,23200:23700) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,23200:23700), pseudo_std);
session_raw_fp1_fp3{5}(4,32150:32500) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,32150:32500), pseudo_std);
session_raw_fp1_fp3{5}(4,44400:44700) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,44400:44700), pseudo_std);
session_raw_fp1_fp3{5}(4,49300:49990) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,49300:49990), pseudo_std);
session_raw_fp1_fp3{5}(4,54420:54600) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,54420:54600), pseudo_std);
session_raw_fp1_fp3{5}(4,57600:57750) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,57600:57750), pseudo_std);
session_raw_fp1_fp3{5}(4,61200:61350) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(4,61200:61350), pseudo_std);
session_raw_fp1_fp3{5}(18,40900:41200) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(18,40900:41200), pseudo_std);
session_raw_fp1_fp3{5}(18,68671:end) = session_raw_fp2_fp4{5}(18, 68671:end);
session_raw_fp1_fp3{5}(28,68675:75000) = session_raw_fp1_fp3{5}(28,62350:68675);
session_raw_fp1_fp3{5}(20,70500:73500) = replaceWithBrownNoise(session_raw_fp1_fp3{5}(20,70500:73500), pseudo_std);

session_raw_fp1_fp3{5}(26,41400:42105)  = replaceWithBrownNoise(session_raw_fp1_fp3{5}(26,41400:42105), pseudo_std);
session_raw_fp1_fp3{5}(21,37000:37420)  = replaceWithBrownNoise(session_raw_fp1_fp3{5}(21,37000:37420), pseudo_std);

%% Preprocess EEG by removing low and high frequencies and apply ICA
for k = 1:5
    for i = 1:28
        session{k}(i, :) = amplify_blinks(session_raw_fp1_fp3{k}(i,:), session_raw_fp2_fp4{k}(i,:), 250);
    end
end
% 1,3,9 patients had disconnted electrodes
%good_ind = setdiff(1:28, [3, 4, 6, 8, 9, 10, 21, 25, 27]); 
good_ind = setdiff(1:28, [3, 4, 6, 10]); 
%good_ind = setdiff(19:28, [4, 6, 8, 9, 10]);
%good_ind = 1:28;

%% Detect blinks and form inter-blink intervals
plot_detected_beats =0;
for k = 1:5
    k
    for i = 1:length(good_ind)
        i
        [ibli, maxtab] = extract_ibli(session{k}(good_ind(i),:));
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

miss_blinks{1}{25}(1,:) = [374, 1374, 2193, 6361, 8101, 8569, 12950, 13960, 14340, 14660, 15000, 16500, 18640, 20520, 21410, 22740, 31900, 32430, 36910, 41040, 41450, 43040, 43260, 43720, 44400, 46590, 52360, 54580, 54960, 56150, 61970, 62760, 67740, ] ;
miss_blinks{1}{23}(1,:) = [21140, 69090];
miss_blinks{1}{19}(1,:) = [66400];
miss_blinks{1}{17}(1,:) = [6445];
miss_blinks{1}{14}(1,:) = [28900, 29460, 50880, 66290, 69570];
miss_blinks{1}{13}(1,:) = [15030, 34590];
miss_blinks{1}{12}(1,:) = [6275, 12060, 25710];
miss_blinks{1}{11}(1,:) = [3493];
miss_blinks{1}{5}(1,:) = [20840, 50450];
miss_blinks{1}{1}(1,:) = [68150];

miss_blinks{2}{28}(1,:)= [23975, 24048, 40710];
miss_blinks{2}{27}(1,:)= [24980, 41520, 68210, 85430, 91580];
miss_blinks{2}{26}(1,:)= [57400, 88160];
miss_blinks{2}{24}(1,:)= [35930, 147362];
miss_blinks{2}{23}(1,:)= [18590, 51280, 59160];
miss_blinks{2}{21}(1,:)= [17250, 19850, 46890, 61750, 110175, 119411, 123120, 13150];
miss_blinks{2}{20}(1,:)= [79010];
miss_blinks{2}{19}(1,:)= [58120, 64530, 78820, 132096, 139610, 141720];
miss_blinks{2}{18}(1,:)= [5430, 106340];
miss_blinks{2}{18}(1,:)= [5430, 106340];
miss_blinks{2}{14}(1,:)= [34020, 37880, 40180, 55520, 57620, 65010, 91780];
miss_blinks{2}{13}(1,:)= [85040, 87220, 113040]; %107412
miss_blinks{2}{12}(1,:)= [10095, 11095, 14940, 67550, 70980, 72080, 89510, 1];
miss_blinks{2}{11}(1,:)= [142472];
miss_blinks{2}{9}(1,:) = [22250, 23110, 48870, 107726, 145261];
miss_blinks{2}{8}(1,:) = [23490, 68660, 80250, 144455];
miss_blinks{2}{7}(1,:) = [7853, 7965, 9104, 13540, 45260, 50250, 60880, 68060, 80840, 82170, 85220, 95980, 99920, 102629, 108484, 109005, 116236, 126815, 127794, 131366, 142852, 144432 ];
miss_blinks{2}{1}(1,:) = [3616, 10090, 14940, 62650, 72080, 82060, 142166];

false_blinks{2}{27}(1,:)= [30483, 31649, 31861, 32617];
false_blinks{2}{21}(1,:)= [17412];
false_blinks{3}{27}(1,:)= [21078, 33451, 70367];
false_blinks{3}{24}(1,:)= [30636];
false_blinks{5}{18}(1,:)= [11735, 61172];
false_blinks{5}{22}(1,:)= [73370];
false_blinks{5}{23}(1,:)= [40440];

miss_blinks{3}{2}(1,:) = [23730, 33260, 45680, 46630];
miss_blinks{3}{5}(1,:) = [65550];
miss_blinks{3}{7}(1,:) = [37770, 37950, 38210, 63660, 65930, 72160, 72930];
miss_blinks{3}{8}(1,:) = [2268, 14950];
miss_blinks{3}{9}(1,:) = [11610, 34810];
miss_blinks{3}{11}(1,:) = [29900];
miss_blinks{3}{13}(1,:) = [54860, 55620];
miss_blinks{3}{14}(1,:) = [19150, 22640, 24220, 38470, 38610, 38720, 39210, 51430,55920,  60870, 68040,  68160, 68950, 74490, 74560];
miss_blinks{3}{15}(1,:) = [15180, 15860, 16060];
miss_blinks{3}{16}(1,:) = [73504];
miss_blinks{3}{17}(1,:) = [3098, 3706, 7656, 8345, 8616, 13220, 13790, 14380, 14740, 16140, 16220, 17160, 17220, 20060, 20800, 20880, 22940];
miss_blinks{3}{19}(1,:) = [11820, 39520, ]; %19 ?
miss_blinks{3}{20}(1,:) = [19370, 58440, 73120];
miss_blinks{3}{23}(1,:) = [14000, 20450];
miss_blinks{3}{24}(1,:) = [53065, 54800, 55700, 57330, 59570, 60080, 64790, 66294, 72310, 73540, 74550];
miss_blinks{3}{25}(1,:) = [51, 481, 1137, 1551, 5859, 6428, 7068, 7774, 8036, 8425, 9762, 10730, 11740, 12510, 12920, 13870, 15940, 18160, 18380, 18960, 20930, 22690, 25120, 25790, 26750, 28780, 29420, 30580, 31740, 31970, 59210, 59530, 61110, 73040, 73360, 73670]; % check again
miss_blinks{3}{26}(1,:) = [1134, 3485, 7687, 8010, 8435, 17040, 18830, 19020, 22090, 22280, 26320, 26520, 39310, 39970, 40340, 46780, 51410, 51640, 63160, 64540, 64890, 71940, 72890];
miss_blinks{3}{28}(1,:) = [2598, 4563, 11690, 17600, 18940, 19200, 25110, 25590, 52010, 56100, 56500, 56580, 5840, 61120, 68510, 68630, 71590];

miss_blinks{4}{2}(1,:) = [31100];
miss_blinks{4}{7}(1,:) = [29480, 32370, 37570, 38100, 41400];
miss_blinks{4}{8}(1,:) = [33630, 72690, 72750];
miss_blinks{4}{9}(1,:) = [23430, 38790, 46150];
miss_blinks{4}{11}(1,:) = [44420];
miss_blinks{4}{13}(1,:) = [11290, 23370, 35630, 38790, 70000];
miss_blinks{4}{15}(1,:) = [51190, 56000, 74200];
miss_blinks{4}{16}(1,:) = [797, 15000, 28240];
miss_blinks{4}{18}(1,:) = [2202, 24450, 33070, 38160, 44970, 50260, 61250, 68630, 68870, 69480, 71970, 73120, 73670];
miss_blinks{4}{19}(1,:) = [5089, 14200, 14940, 15890, 16600, 20800, 27050, 35250, 42350, 62380, 63040, 63840, 66680, 68150, 69570, 72770];
miss_blinks{4}{21}(1,:) = [37410, 20850];
miss_blinks{4}{23}(1,:) = [66750];
miss_blinks{4}{24}(1,:) = [410, 1244, 8863, 13270];
miss_blinks{4}{25}(1,:) = [8089];
miss_blinks{4}{26}(1,:) = [13050];
miss_blinks{4}{27}(1,:) = [16140];

miss_blinks{5}{1}(1,:) = [14620];
miss_blinks{5}{2}(1,:) = [14850, 20300, 52020];
miss_blinks{5}{7}(1,:) = [2117, 4344, 5773, 6949, 14030, 16710, 20870, 24670, 31800, 34360, 35560, 46940, 49560, 51150, 51330, 69600];
miss_blinks{5}{8}(1,:) = [27450, 54300, 55700, 55790];
miss_blinks{5}{9}(1,:) = [8341, 32280, 62720, 63860];
miss_blinks{5}{11}(1,:) = [5045, 7235, 8400, 19410, 40790, 45420, 45890, 48570, 53070, 53740, 54430, 57840, 68860, 71200, 72020] ;
miss_blinks{5}{13}(1,:) = [9805, 48140, 67950];
miss_blinks{5}{14}(1,:) = [10490, 30840, 55610];
miss_blinks{5}{17}(1,:) = [524, 623, 918, 2890, 3718, 3828, 4360, 4443, 9023, 9862, 10320, 11005, 12330, 13550, 15770, 17610, 18320, 19610, 20480, 22080, 22780, 22940, 25140, 25270, 25670, 26060, 27340, 28250, 34460, 34750, 36350, 36690, 37650, 38620, 38710, 41820, 44410, 46300, 46390, 50490, 51480, 53370, 54460, 55220, 56650, 58090, 59840, 61040, 62280, 62900, 64140, 65830, 68060, 68380, ];
miss_blinks{5}{18}(1,:) = [45680];
miss_blinks{5}{19}(1,:) = [2871, 12630, 14950, 18500, 19850, 19910, 28310, 37030, 41910, 55370, 57440];
miss_blinks{5}{20}(1,:) = [73590];
miss_blinks{5}{21}(1,:) = [3531, 39050, 47220, 56440];
miss_blinks{5}{22}(1,:) = [26230];
miss_blinks{5}{24}(1,:) = [27950, 28080, 28150, 28320, 28390, 41660];
miss_blinks{5}{26}(1,:) = [43010, 43260, 43830, 43910];

%% Merge manual detection with automatic detection
for k = 1:5
    for i = 1:28
        if (i < length(miss_blinks{k}) & ~isempty(miss_blinks{k}{i}))
            session_beat_pos_corrected{k}{i} = sort(union(miss_blinks{k}{i}, session_beat_pos{k}{i}(:,1)));
            session_beat_pos_corrected{k}{i}(:,2) = session{k}(i,session_beat_pos_corrected{k}{i});
            session_ibi{k}{i} = diff(session_beat_pos_corrected{k}{i}(:,1))  / sampling_rate;
        else
            if(~isempty(session_beat_pos{k}{i}))
                session_beat_pos_corrected{k}{i} = session_beat_pos{k}{i}(:,1);
                session_beat_pos_corrected{k}{i}(:,2) = session{k}(i,session_beat_pos_corrected{k}{i});
                session_ibi{k}{i} = diff(session_beat_pos_corrected{k}{i}(:,1)) / sampling_rate;
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

%%
%plot blink numbers for each "good" subject for every session
markers = {'+','o','*','.','x'};
figure('Position', [100, 100, 540, 257]), hold on; title('Relationship between number blinks and a task');
xlabel('Subject number'); ylabel('Number of blinks');
for k = 1:5
    plot(good_ind, session_ibi_len(k, good_ind),'LineStyle',':','Marker',markers{k}, 'LineWidth', 2, 'MarkerSize',5, 'color', colors(k,:));
end
legend(gca, 'Resting stage 1','IQ test', 'Resting stage 2', 'Reading passage', 'Memory test' );

% Idea select only those that have more than 50 blinks, others assumed to be corrupted
% ind1 = find(session_ibi_len(1,:) > 50);
% ind2 = find(session_ibi_len(2,:) > 50);
% ind3 = find(session_ibi_len(3,:) > 50);
% ind4 = find(session_ibi_len(4,:) > 50);
% ind5 = find(session_ibi_len(5,:) > 50);
% selected = intersect(ind1, intersect(ind2, intersect(ind3, intersect(ind4, ind5))));

%%
% Draw BRV for every session
drawBRVarray3(session_ibi, good_ind, session_ibi_len);


%% Calcualte mean and standard deviation for BRV
clear session_ibi_stat
for k = 1:5
    for i = 1:length(good_ind)
        session_ibi_stat(good_ind(i),:,k) = [mean(session_ibi{k}{good_ind(i)}) std(session_ibi{k}{good_ind(i)}) std(diff(session_ibi{k}{good_ind(i)}))];
    end
end
%% Calculate ratios between different sessions
[s ind] = sort(session_ibi_len(4, good_ind(:)));
pair(1,:) = [2 1];
pair(2,:) = [5 1];
pair(3,:) = [4 2];
for i = 1:length(good_ind)
    for k = 1:length(pair)
        ratio_blinks_number(i, k) = session_ibi_len(pair(k,1),good_ind(ind(i))) / session_ibi_len(pair(k,2),good_ind(ind(i)));
        ratio_mean_ibi(i, k) = (session_ibi_stat(good_ind(ind(i)),1,pair(k,1))) / (session_ibi_stat(good_ind(ind(i)),1,pair(k,2)));
        ratio_std_ibi(i, k) = (session_ibi_stat(good_ind(ind(i)),2,pair(k,1))) / (session_ibi_stat(good_ind(ind(i)),2,pair(k,2)));
    end
end

labels = {'# of blinks IQ over # of blinks Resting 1','# of blinks Memory over # of blinks Resting 1', '# of blinks Reading over # of blinks Resting 1'};
figure('Position', [100, 100, 540, 257]), hold on; 
%title('Average IBI vs task');
xlabel('Subject number'); ylabel('Ratio');
for k = 1:size(pair,1)
    plot(1:length(good_ind), ratio_blinks_number(:,k),'LineStyle',':','Marker', markers{pair(k)}, 'LineWidth', 2, 'MarkerSize',5, 'color', colors(pair(k),:));
    ghandler = gca;
	ghandler.XTick = 1:length(ind);
	ghandler.XTickLabel = good_ind(ind);
end
legend(gca, labels,'Location','Best');

labels = {'Mean(IBI) for IQ over Mean(IBI) for Resting 1','Mean(IBI) for Memory over Mean(IBI) for Resting 1', 'Mean(IBI) for Reading over # Mean(IBI) for Resting 1'};
figure('Position', [100, 100, 540, 257]), hold on; 
%title('Average IBI vs task');
xlabel('Subject number'); ylabel('Ratio');
for k = 1:size(pair,1)
    plot(1:length(good_ind), ratio_mean_ibi(:,k),'LineStyle',':','Marker', markers{pair(k)}, 'LineWidth', 2, 'MarkerSize',5, 'color', colors(pair(k),:));
    ghandler = gca;
	ghandler.XTick = 1:length(ind);
	ghandler.XTickLabel = good_ind(ind);
end
legend(gca, labels,'Location','Best');


labels = {'/sigma(IBI) for IQ over /sigma(IBI) for Resting 1','/sigma(IBI) for Memory over /sigma(IBI) for Resting 1', '/sigma(IBI) for Reading over /        sigma(IBI) for Resting 1'};
figure('Position', [100, 100, 540, 257]), hold on; 
%title('Average IBI vs task');
xlabel('Subject number'); ylabel('Ratio');
for k = 1:size(pair,1)
    plot(1:length(good_ind), ratio_std_ibi(:,k),'LineStyle',':','Marker', markers{pair(k)}, 'LineWidth', 2, 'MarkerSize',5, 'color', colors(pair(k),:));
    ghandler = gca;
	ghandler.XTick = 1:length(ind);
	ghandler.XTickLabel = good_ind(ind);
end
legend(gca, labels,'Location','Best');

%% Calculate relative ratios
clear session_ibi_relative;
for k = 1:5
    for i = 1:length(good_ind)
        session_ibi_relative{k}{good_ind(i)} = diff(session_ibi{k}{good_ind(i)}) ./ session_ibi{k}{good_ind(i)}(1:end-1);
    end
end
drawBRVarray(session_ibi_relative, good_ind, session_ibi_len);

clear session_ibi_relative_stat
for k = 1:5
    for i = 1:length(good_ind)
        session_ibi_relative_stat(good_ind(i),:,k) = [-1 + prod(1 + session_ibi_relative{k}{good_ind(i)}).^(1/length(session_ibi_relative{k}{good_ind(i)})) std(session_ibi_relative{k}{good_ind(i)})];
    end
end

plotBlinkMeanPerSubject(session_ibi_relative_stat, good_ind, session_ibi_len);



%% Calculate Root Mean Square of the Successive Differences (RMSSD)

% figure, hold on;
% for i = 1:length(good_ind)
%     plot(session_ibi{4}{good_ind(i)}/250 + 10*i* ones(length(session_ibi{4}{good_ind(i)}), 1))
% end
%%
% Plot average IBI 
markers = {'+','o','*','.','x'};
figure('Position', [100, 100, 540, 257]), hold on; title('Average IBI vs task');
xlabel('Subject number'); ylabel('Average inter-blink interval');
for k = 1:5
        plot(1:length(good_ind), session_ibi_stat(good_ind, 1, k),'LineStyle',':','Marker',markers{k}, 'LineWidth', 2, 'MarkerSize',5, 'color', colors(k,:));
        %errorbar(1:length(good_ind), session_ibi_stat(good_ind, 1, k),session_ibi_stat(good_ind, 2, k),'LineStyle',':','Marker',markers{k}, 'LineWidth', 2, 'MarkerSize',5);
end
legend(gca, 'Resting stage 1','IQ test', 'Resting stage 2', 'Reading passage', 'Memory test', 'Location', 'Best' );

%%
% Plot standard deviation IBI 
markers = {'+','o','*','.','x'};
figure('Position', [100, 100, 540, 257]), hold on; title('\sigma(IBI) vs task');
xlabel('Subject number'); ylabel('\sigma(IBI)');
for k = 1:5
        plot(1:length(good_ind), session_ibi_stat(:, 2, k),'LineStyle',':','Marker',markers{k}, 'LineWidth', 2, 'MarkerSize',5, 'color', colors(k,:));
        %errorbar(1:length(good_ind), session_ibi_stat(:, 1, k),session_ibi_stat(:, 2, k),'LineStyle',':','Marker',markers{k}, 'LineWidth', 2, 'MarkerSize',5);
end
legend(gca, 'Resting stage 1','IQ test', 'Resting stage 2', 'Reading passage', 'Memory test', 'Location', 'Best' );

%% Prepare for correlation 
clear session_ibi_conv;
for k = 1:5
	for i = 1:length(good_ind);
        if k == 2
            session_ibi_conv{k}(good_ind(i), 150000) = 0;
        else
            session_ibi_conv{k}(good_ind(i), 75000) = 0;
        end
        blink_times = cumsum(sampling_rate * session_ibi{k}{good_ind(i)});
        session_ibi_conv{k}(good_ind(i), int64(blink_times)) = sampling_rate * session_ibi{k}{good_ind(i)};
        session_ibi_conv{k}(good_ind(i),:) = conv(session_ibi_conv{k}(good_ind(i),:), gausswin(sampling_rate/25), 'same');
	end
end
figure, plot(session_ibi_conv{1}(good_ind(5), :));


for k = 1:5
    k
	for j = 1:length(good_ind)
        for i = j+1:length(good_ind)
            [acor,lag] =  xcorr(session_ibi_conv{k}(good_ind(i), :) - mean(session_ibi_conv{k}(good_ind(i), :)), session_ibi_conv{k}(good_ind(j), :) - mean(session_ibi_conv{k}(good_ind(j), :)), 'coeff');
            len = length(session_ibi_conv{k}(good_ind(i), :));
            [max_cor,I] = max(acor(len-1000:len+1000));
            Gs_cor{k}(i, j) = max_cor;
            Gs_cor{k}(j, i) = max_cor;
            Gs_lag{k}(i, j) = lag(I + len-1000);
            Gs_lag{k}(j, i) = lag(I + len-1000);
        end
    end
    a(k) = sum(sum((Gs_cor{k} > 0.4))) / 2;
    G_cor = Gs_cor{k};
    G_cor(logical(eye(size(G_cor)))) = 0;            % Zero main diagonal       
    figure, imagesc(G_cor);                                 
    ax = gca;
    ax.XTick = [1:size(G,2)];
    ax.YTick = [1:size(G,2)];
    set(gca, 'XTickLabelRotation', 45)   
end

%     [max_cor,I] = max(abs(acor));
%     timeDiff = lag(I)         % sensor 2 leads sensor 1 by 350 samples
%     subplot(311); plot(session_ibi_conv{5}(good_ind(2), :)); title('s1');
%     subplot(312); plot( session_ibi_conv{5}(good_ind(1), :)); title('s2');
%     subplot(313); plot(lag,acor);

G_cor = Gs_cor{5};
% G = session_ibi_conv{5}(good_ind(:), :)';    
% clear G_norm;
% %G_norm = (G - ones(size(G,1),1) * mean(G));      % subtract mean
% G_norm = G./ (ones(size(G,1),1) * std(G)); % normalize so STD is one 
% G_cor = (G_norm' * G_norm) / size(G,1);             % claculte correlation matrix
G_cor(logical(eye(size(G_cor)))) = 0;            % Zero main diagonal       
figure, imagesc(G_cor);                                 
ax = gca;
ax.XTick = [1:size(G,2)];
ax.YTick = [1:size(G,2)];
set(gca, 'XTickLabelRotation', 45)
%% Estimate multifractal spectrum for BRV
L = round(2.^[5.0:0.25:7]);
%L = L(1:10);
Q = [-5:1:5];
for k = 1:5
    for i = 1:length(good_ind)
        [alfa mfs] = estimateGFD(session_ibi{k}{good_ind(i)}', L, Q);
        session_alfas{k}(i,:) = alfa;   
    end
end

%% Plot multifractal space
figure, hold on, grid on;
xlabel('\alpha(-)')
ylabel('\alpha(0)')
zlabel('\alpha(+)')
for k = 1:5
    for i = 1:length(good_ind)
    %    text(rest1_alfas(i,1), rest1_alfas(i,6), rest1_alfas(i,11), num2str(final_ind(i)), 'color', 'r');
        plot3(session_alfas{k}(i,1), session_alfas{k}(i,6),session_alfas{k}(i,end), 'Marker', markers{k}, 'color', colors(k, :));
        text(session_alfas{k}(i,1), session_alfas{k}(i,6), session_alfas{k}(i,end), num2str(good_ind(i)), 'color', colors(k, :));
    end
end

figure, hold on, grid on;
for i = 1:length(good_ind)
    color1 = [0.5 0 rand/2 *.5  + 0.5];
    color2 = [rand/2 *.5 + 0.5 0.5 0];
    plot(Q,session_alfas{4}(i,:), 'Color', color1);
    text(Q(1) - 1.25, session_alfas{4}(i,1), num2str(good_ind(i)), 'Color', color1);
    plot(Q,session_alfas{5}(i,:), 'Color', color2);
    text(Q(1) - 0.75, session_alfas{5}(i,1), num2str(good_ind(i)), 'Color', color2);
end

