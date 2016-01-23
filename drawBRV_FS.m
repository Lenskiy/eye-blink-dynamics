function drawBRV_FS(Q, L, session_ibi, good_ind, sessions1, sessions2)
    colors = get(gca,'colororder');
    colors = [colors; colors; colors; colors];
    close;
    markers = {'+','o','*','.','x'};
    
    for k = 1:5
        for i = 1:length(good_ind)
            [alfa mfs] = estimateGFD(session_ibi{k}{good_ind(i)}', L, Q);
            session_alfas{k}(i,:) = alfa;   
        end
    end

    q0 = round(size(session_alfas{1},2)/2);
    for k = 1:length(sessions1)
        figure, hold on, grid on;
        xlabel('q_{min}');ylabel('q_0');zlabel('q_{max}');
        for i = 1:length(good_ind)
            plot3(session_alfas{sessions1(k)}(i,1), session_alfas{sessions1(k)}(i,q0),...
                session_alfas{sessions1(k)}(i,end), 'Marker', markers{sessions1(k)}, 'color', colors(sessions1(k), :), 'markersize', 8);
            text(session_alfas{sessions1(k)}(i,1), session_alfas{sessions1(k)}(i,q0),...
                session_alfas{sessions1(k)}(i,end), num2str(good_ind(i)), 'color', colors(sessions1(k), :));
            plot3(session_alfas{sessions2(k)}(i,1), session_alfas{sessions2(k)}(i,q0),...
                session_alfas{sessions2(k)}(i,end), 'Marker', markers{sessions2(k)}, 'color', colors(sessions2(k), :), 'markersize', 8);
            text(session_alfas{sessions2(k)}(i,1), session_alfas{sessions2(k)}(i,q0),....
                session_alfas{sessions2(k)}(i,end), num2str(good_ind(i)), 'color', colors(sessions2(k), :));
            line([session_alfas{sessions1(k)}(i,1) session_alfas{sessions2(k)}(i,1)],...
                 [session_alfas{sessions1(k)}(i,q0) session_alfas{sessions2(k)}(i,q0)],...
                 [session_alfas{sessions1(k)}(i,end) session_alfas{sessions2(k)}(i,end)],...
                 'Color', [0.5*(colors(sessions1(k), :) + colors(sessions2(k), :)), 0.2], 'LineWidth', 2);
        end
    end
end