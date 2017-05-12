function drawBRV_FS(Q, L, session_ibi, good_ind, sessions1, sessions2, flag_lda)
    colors = get(gca,'colororder');
    colors = [colors; colors; colors; colors];
    close;
    markers = {'+','o','*','.','x'};
    exponents = zeros(length(good_ind)*3,5);

    for k = 1:5
        for i = 1:length(good_ind)
            [alfa mfs] = estimateGFD(session_ibi{k}{good_ind(i)}', L, Q);
%             m=1;%order of detrending funcion
%             [Hq,tq,hq,Dq,Fq] = MFDFA1(session_ibi{k}{good_ind(i)}', L, Q,m,0);
%              session_alfas{k}(i,:) = Hq;   

            session_alfas{k}(i,:) = alfa;   
            
        end
    end
   % figure; plot(session_alfas{3}(1,:)) % plot 
    q0 = round(size(session_alfas{1},2)/2);
    z2 = []; z1 = z2; y2 = z1; y1 = y2; x2 = y1; x1 = x2; %for LDA
    a_peak = zeros(5,11);
    %labels=[9	  4		6     2    10    11    3     5      7    8      1];
    labels=[11 4 7 2 8 3 9 10 1 5 6];
    for k = 1:length(sessions1)        
        figure, hold on, grid on;
        xlabel('$\alpha_{max}$','Interpreter','latex');ylabel('$\alpha_{peak}$','Interpreter','latex');zlabel('$\alpha_{min}$','Interpreter','latex');
        for i = 1:length(good_ind)
            plot3(session_alfas{sessions1(k)}(i,1), session_alfas{sessions1(k)}(i,q0),...
                session_alfas{sessions1(k)}(i,end), 'Marker', markers{sessions1(k)}, 'color', colors(sessions1(k), :), 'markersize', 8);
            %old labeling
            %text(session_alfas{sessions1(k)}(i,1), session_alfas{sessions1(k)}(i,q0), session_alfas{sessions1(k)}(i,end), num2str(good_ind(i)), 'color', colors(sessions1(k), :));
            text(session_alfas{sessions1(k)}(i,1), session_alfas{sessions1(k)}(i,q0), ...
                session_alfas{sessions1(k)}(i,end), num2str(labels(i)), 'color', colors(sessions1(k), :));
            plot3(session_alfas{sessions2(k)}(i,1), session_alfas{sessions2(k)}(i,q0),...
                session_alfas{sessions2(k)}(i,end), 'Marker', markers{sessions2(k)}, 'color', colors(sessions2(k), :), 'markersize', 8);
            %old labeling
            %text(session_alfas{sessions2(k)}(i,1), session_alfas{sessions2(k)}(i,q0),session_alfas{sessions2(k)}(i,end), num2str(good_ind(i)), 'color', colors(sessions2(k), :));
            text(session_alfas{sessions2(k)}(i,1), session_alfas{sessions2(k)}(i,q0),...
                session_alfas{sessions2(k)}(i,end), num2str(labels(i)), 'color', colors(sessions2(k), :));
            line([session_alfas{sessions1(k)}(i,1) session_alfas{sessions2(k)}(i,1)],...
                 [session_alfas{sessions1(k)}(i,q0) session_alfas{sessions2(k)}(i,q0)],...
                 [session_alfas{sessions1(k)}(i,end) session_alfas{sessions2(k)}(i,end)],...
                 'Color', [0.5*(colors(sessions1(k), :) + colors(sessions2(k), :)), 0.2], 'LineWidth', 2);
%              disp(int2str(good_ind(i)))
%              disp(int2str(labels(i)))
%              disp(num2str(session_alfas{sessions1(k)}(i,q0)));
           
            %for table in paper:
            exponents(3*i-2, k)=session_alfas{sessions1(k)}(i,1);
            exponents(3*i-1, k)=session_alfas{sessions1(k)}(i,q0);
            exponents(3*i, k)=session_alfas{sessions1(k)}(i,end); 
% %             
%             a_peak(k,i) = exponents(3*i-1, k)
            exponents
            x1(i) = session_alfas{sessions1(k)}(i,1);
            y1(i) = session_alfas{sessions1(k)}(i,q0);
            z1(i) = session_alfas{sessions1(k)}(i,end); 
            
            x2(i) = session_alfas{sessions2(k)}(i,1);
            y2(i) = session_alfas{sessions2(k)}(i,q0);
            z2(i) = session_alfas{sessions2(k)}(i,end); 
        end
        
        %% LDA
        if(flag_lda==1)
            Group_X = [x1; y1; z1]';
            Group_Y = [x2; y2; z2]';
            All_data = [Group_X;Group_Y];
            All_data_label = [];
            for k=1:length(All_data)
                if k<=length(Group_X)
                    All_data_label = [All_data_label; 'X'];
                else
                    All_data_label = [All_data_label; 'Y'];
                end    
            end;

            % proper LDA
            [ldaClass, err, P, logp, coeff] = classify(All_data(:,:),All_data(:,:),All_data_label(:,:),'linear');
            errind = find(ldaClass ~= All_data_label(:,:));

            %confussion matrix - diagonal shows correctly found points
            [ldaResumbCM, grpOrder]=confusionmat(All_data_label(:,:),ldaClass);

            K = coeff(1,2).const;
            L = coeff(1,2).linear;

            f = @(x,y, z) K + [x y z]*L;

            h2 = ezimplot3(sym(f),[min(All_data(:,1))-0.05 max(All_data(:,1))+0.05 min(All_data(:,2))-0.05 max(All_data(:,2))+0.05 min(All_data(:,3))-0.05 max(All_data(:,3))+0.05]);
            
        xlabel('$\alpha_{max}$','Interpreter','latex');ylabel('$\alpha_{peak}$','Interpreter','latex');zlabel('$\alpha_{min}$','Interpreter','latex');

            hold on

            Group_X_testing = [];
            Group_Y_testing = [];

            for k = 1:length(All_data)
                if ~isempty(find(length(All_data)==k))
                    if strcmp(All_data_label(k,:),'X')==1
                        Group_X_testing = [Group_X_testing,k];
                            else
                        Group_Y_testing = [Group_Y_testing,k];
                    end
                end
            end
            plot3(All_data(Group_X_testing,1),All_data(Group_X_testing,2),All_data(Group_X_testing,3),'g.');
            hold on
            plot3(All_data(Group_Y_testing,1),All_data(Group_Y_testing,2),All_data(Group_Y_testing,3),'b.');
            hold on
            axis equal
            for i = 1:length(errind)
                plot3(All_data(errind(i),1), All_data(errind(i),2), All_data(errind(i),3),'o', 'Color','k', 'MarkerSize',15, 'Linewidth', 3);
                hold on;
            end
            view(145,45);%azimuth, elevation
        end
        %%-LDA
    end
 
end