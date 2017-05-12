clear all; close all;
%% Goal
% LDA example for 2D data
%% Data generation
% The following code shows the data generation process.
% The feature space contains only two dimensions.
% First we have to define clusters' centroids that will be used as seeds
% for data generation
c1_x = 10;
c1_y = 10;
c2_x = 14;
c2_y = 12;
c3_x = 10;
c3_y = 6;

original_centroids = [c1_x c2_x c3_x; c1_y c2_y c3_y];
poins_in_class = [1500 1300 1400];

% Generate points around each centroid
% For the first cluster 125 points are generated.
% The points will be more spread out in X direction 
x1 = 1.5 * randn(1, poins_in_class(1)) + c1_x;
y1 = 0.5 * randn(1, poins_in_class(1)) + c1_y;

% The second cluster contains 75 points.
% The points will be a bit more spread out in X direction as well.
x2 = 0.5 * randn(1, poins_in_class(2)) + c2_x;
y2 = 1.5 * randn(1, poins_in_class(2)) + c2_y;

% For the third cluster 100 points are generated.
% The points will be a bit more spread out in Y direction 
x3 = 1.0 * randn(1, poins_in_class(3)) + c3_x;
y3 = 1.0 * randn(1, poins_in_class(3)) + c3_y;


% Lastly, we generate 200 noise points across the whole feature space.
x_noise = 20 * rand(1, 1000);
y_noise = 20 * rand(1, 1000);
 

% The following lines visualize generated points
figure('Position', [100, 100, 600, 600]), hold on, grid on, axis equal;
plot(x1, y1, 'r.', 'MarkerSize', 10);
plot(x2, y2, 'g.', 'MarkerSize', 10)
plot(x3, y3, 'b.', 'MarkerSize', 10)
plot(x_noise, y_noise, 'k.', 'MarkerSize', 10)

%% data preparation
Group_X = [x1; y1]';
Group_Y = [x2; y2]';
All_data = [Group_X;Group_Y];
All_data_label = [];
for k=1:length(All_data)
    if k<=length(Group_X)
        All_data_label = [All_data_label; 'X'];
    else
        All_data_label = [All_data_label; 'Y'];
    end    
end;

%we take 80% of data to classification, 20% to testing
testing_ind = [];
for i=1:length(All_data)
    if rand>0.8
        testing_ind = [testing_ind,i];
    end;
end;

training_ind = setxor(1:length(All_data),testing_ind);
% proper LDA
[ldaClass, err, P, logp, coeff] = classify(All_data(testing_ind,:),All_data(training_ind,:),All_data_label(training_ind,:),'linear');

%confussion matrix
[ldaResumbCM, grpOrder]=confusionmat(All_data_label(testing_ind,:),ldaClass)

K = coeff(1,2).const
L = coeff(1,2).linear

f = @(x,y) K + [x y]*L;

h2 = ezplot(f,[min(All_data(:,1)) max(All_data(:,1)) min(All_data(:,2)) max(All_data(:,2))]);

%%
hold on


Group_X_testing = [];
Group_Y_testing = [];

for k = 1:length(All_data)
if ~isempty(find(testing_ind==k))
if strcmp(All_data_label(k,:),'X')==1
Group_X_testing = [Group_X_testing,k];
else
Group_Y_testing = [Group_Y_testing,k];
end
end
end
plot(All_data(Group_X_testing,1),All_data(Group_X_testing,2),'g.');
hold on
plot(All_data(Group_Y_testing,1),All_data(Group_Y_testing,2),'r.');