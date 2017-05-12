function plotBlinkMeanPerSubject(session_ibi_stat, good_ind, session_ibi_len)
    colors = get(gca,'colororder');close;
    colors = [colors; colors; colors; colors];
	markers = {'+','o','*','.','x'};
    %plot blink numbers for each "good" subject for every session
    labels = {'Resting stage 1','IQ test', 'Resting stage 2', 'Reading passage', 'Memory test'};
    pair{1} = [1 3]; % resting stage 1 and stage 2 
    pair{2} = [4 5]; % reading and comprehension test 
    pair{3} = [2 4]; % IQ and reading
    pair{4} = [2 5]; % IQ and memory testing 
    pair{5} = [1 3 2]; % resting 1 and 2 and IQ test
    pair{6} = [1 3 4]; % resting 1 and 2 and Reading
    pair{7} = [1 3 5]; % resting 1 and 2 and Memory
	pair{8} = [1 2 3 4 5];  
    [s ind] = sort(session_ibi_len(4, good_ind(:))); %sort based on the number of blinks in reading 
    for j = 1:size(pair,2)
        figure('Position', [100, 100, 540, 257]), hold on; 
        %title('Average IBI vs task');
        xlabel('Subject number'); ylabel('Average inter-blink interval');
        for k = 1:size(pair{j}(:),1)
            %[s ind] = sort(session_ibi_stat(good_ind(:), 1, pair{j}(k)));
            %session_ibi_stat(good_ind(ind(:,1)), 1, pair{j}(k))
            plot(1:length(good_ind), session_ibi_stat(good_ind(ind), 1, pair{j}(k)),'LineStyle',':','Marker', markers{pair{j}(k)}, 'LineWidth', 2, 'MarkerSize',5, 'color', colors(pair{j}(k),:));
            %errorbar(1:length(good_ind), session_ibi_stat(good_ind, 1, k),session_ibi_stat(good_ind, 2, k),'LineStyle',':','Marker',markers{k}, 'LineWidth', 2, 'MarkerSize',5);
            ghandler = gca;
            ghandler.XTick = 1:length(ind);
            ghandler.XTickLabel = good_ind(ind);%R:old numeration
            %ghandler.XTickLabel = [1:11];%R:more appropriate for PLOS numeration
        end
        
        if size(pair{j}, 2) == 2
            legend(gca, labels{pair{j}(1)} ,labels{pair{j}(2)},'Location','Best');
        end
        if size(pair{j}, 2) == 3
            legend(gca, labels{pair{j}(1)}, labels{pair{j}(2)}, labels{pair{j}(3)},'Location','Best');
        end
        if size(pair{j}, 2) == 5
            legend(gca, labels{pair{j}(1)}, labels{pair{j}(2)}, labels{pair{j}(3)}, labels{pair{j}(4)}, labels{pair{j}(5)},'Location','Best');
        end           
    end
end
