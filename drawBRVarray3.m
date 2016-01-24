function drawBRVarray3(session_ibi, good_ind, session_ibi_len)
    colors = get(gca,'colororder');
    colors = [colors; colors; colors; colors];
    close;
    figure(11), hold on;
    xlabel('blink time');
    ylabel('interval length');
    %title('Inter-blink interval dynamics extracted while 1st time resting stage')
    figure(12), hold on;
	xlabel('blink time');
    ylabel('interval length');
    %title('Inter-blink interval dynamics extracted while IQ testing')    
    figure(13), hold on;
    xlabel('blink time');
    ylabel('interval length');
    %title('Inter-blink interval dynamics extracted while 2nd time resting stage')
    figure(14), hold on;
    xlabel('blink time');
    ylabel('interval length');
    %title('Inter-blink interval dynamics extracted while reading the passage')
    figure(15), hold on;
    %title('Inter-blink interval dynamics extracted while memory testing');
    xlabel('blink time');
    ylabel('interval length');
    plot_step = floor(length(good_ind)/ 2.2);
    

    for k = 1:5
        figure(10 + k), 
        %set(gca, 'XTick', []);
        axis([0 max(cumsum(session_ibi{k}{good_ind(1)})) 0 plot_step * length(good_ind)]);
        for i = 1:length(good_ind);
            line([0 max(cumsum(session_ibi{k}{good_ind(1)}))],[(i-1)*plot_step (i-1)*plot_step], 'Color', [0.5 0.5 0.5]);
            blink_times = cumsum(session_ibi{k}{good_ind(i)});
            for j = 1:length(blink_times)
                line([blink_times(j), blink_times(j)], [(i-1)*plot_step (i-1)*plot_step + session_ibi{k}{good_ind(i)}(j)], 'color', colors(i,:));
            end
            if(k == 2)
                text(600 + 5, (i-1)*plot_step + 2, num2str(good_ind(i)), 'color', colors(i,:));
            else
                text(300 + 5, (i-1)*plot_step + 2, num2str(good_ind(i)), 'color', colors(i,:));
            end
        end
    end
end