function drawBRVarray(session_ibi, good_ind, session_ibi_len)
    colors = get(gca,'colororder');
    colors = [colors; colors; colors; colors];
    close;
    figure(11), hold on;
    set(gca, 'YTick', []);
    axis([0 max(session_ibi_len(1,good_ind)) + 0 0 250]);
    xlabel('interval number');
    ylabel('interval length');
    %title('Inter-blink interval dynamics extracted while 1st time resting stage')
    figure(12), hold on;
    set(gca, 'YTick', []);
    axis([0 max(session_ibi_len(2,good_ind)) + 0 0 250]);
	xlabel('interval number');
    ylabel('interval length');
    %title('Inter-blink interval dynamics extracted while IQ testing')    
    figure(13), hold on;
    set(gca, 'YTick', []);
    axis([0 max(session_ibi_len(3,good_ind)) + 0 0 250]);
    xlabel('interval number');
    ylabel('interval length');
    %title('Inter-blink interval dynamics extracted while 2nd time resting stage')
    figure(14), hold on;
    set(gca, 'YTick', []);
    axis([0 max(session_ibi_len(4,good_ind)) + 0 0 250]);
    xlabel('interval number');
    ylabel('interval length');
    %title('Inter-blink interval dynamics extracted while reading the passage')
    figure(15), hold on;
    set(gca, 'YTick', []);
    axis([0 max(session_ibi_len(5,good_ind)) + 0 0 250]);
    %title('Inter-blink interval dynamics extracted while memory testing');
    xlabel('interval number');
    ylabel('interval length');
    plot_step = floor(length(good_ind)/ 2.2);

    for i = 1:length(good_ind);
        i
        for k = 1:5
            figure(10 + k), line([0 max(session_ibi_len(k,good_ind))],[(i-1)*plot_step (i-1)*plot_step], 'Color', [0.5 0.5 0.5]);
            figure(10 + k), plot(session_ibi{k}{good_ind(i)} + (i-1)*plot_step, 'color', colors(i,:));
            figure(10 + k), text(max(session_ibi_len(k,good_ind)) + 5, (i-1)*plot_step + 2, num2str(good_ind(i)), 'color', colors(i,:));
        end
    end
end