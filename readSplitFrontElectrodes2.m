%Biploar electrode placement
function [session_raw_fp1 session_raw_fp2 labels] = readSplitFrontElectrodes2(path, intervals_secs)

    if(nargin == 1)
        intervals_secs = [0; 300; 600; 300; 300; 300];
    end
    
    counter = 0;
    labels = [];
    for i = 1:40
        i
        eeg_file = [path num2str(i) '.txt'];
        if exist(eeg_file, 'file')
            counter = counter + 1;        
            eeg_recording = importdata(eeg_file, ' ', 0);
            labels(counter) = i;
            if(size(eeg_recording, 1) < (sum(intervals_secs) * 250 + 60 * 250))
                sampling_rate = 250;
                eeg_recording(sum(intervals_secs) * sampling_rate, size(eeg_recording,2)) = 0;
            else
                sampling_rate = 500;
                eeg_recording(sum(intervals_secs) * sampling_rate, size(eeg_recording,2)) = 0;
            end
            eeg_fp1(counter, :) = resample(eeg_recording(1:sum(intervals_secs) * sampling_rate,1), 1, sampling_rate/250);
            eeg_fp2(counter, :) = resample(eeg_recording(1:sum(intervals_secs) * sampling_rate,2), 1, sampling_rate/250);
        end
    end
    

    ac_intervals_secs = cumsum(intervals_secs);
	for j = 1:size(eeg_fp1,1)        
        for i = 1:length(intervals_secs) - 1
            session_raw_fp1{i}(j,:) = eeg_fp1(j,(ac_intervals_secs(i)* sampling_rate + 1:ac_intervals_secs(i + 1)* sampling_rate));
            session_raw_fp2{i}(j,:) = eeg_fp2(j,(ac_intervals_secs(i)* sampling_rate + 1:ac_intervals_secs(i + 1)* sampling_rate));
        end
	end

end