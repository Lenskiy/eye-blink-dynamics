%% Goal
% LDA example for 3D data
%% Data generation
% The following code shows the data generation process.
% The feature space contains only 3 dimensions.
% First we have to define clusters' centroids that will be used as seeds
% for data generation
clear all; close all;


c1_x = 10;
c1_y = 10;
c1_z = 10;

c2_x = 14;
c2_y = 12;
c2_z = 12;


original_centroids = [c1_x c2_x; c1_y c2_y; c1_z c2_z];
poins_in_class = [1500 1000];

% Generate points around each centroid

x1 = 1.5 * randn(1, poins_in_class(1)) + c1_x;
y1 = 0.5 * randn(1, poins_in_class(1)) + c1_y;
z1 = 0.5 * randn(1, poins_in_class(1)) + c1_z;

% The second cluster 
% The points will be a bit more spread out in X direction as well.
x2 = 0.5 * randn(1, poins_in_class(2)) + c2_x;
y2 = 1.5 * randn(1, poins_in_class(2)) + c2_y;
z2 = 1.5 * randn(1, poins_in_class(2)) + c2_z;

% Lastly, we generate 200 noise points across the whole feature space.
x_noise = 20 * rand(1, 1000);
y_noise = 20 * rand(1, 1000);
z_noise = 20 * rand(1, 1000);
 

% The following lines visualize generated points
figure('Position', [100, 100, 600, 600]), hold on, grid on, axis equal;
plot3(x1, y1, z1, 'g.', 'MarkerSize', 10);
plot3(x2, y2, z2, 'b.', 'MarkerSize', 10)
%plot(x_noise, y_noise, 'k.', 'MarkerSize', 10)

%% data preparation
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

%% proper LDA
[ldaClass, err, P, logp, coeff] = classify(All_data(:,:),All_data(:,:),All_data_label(:,:),'linear');
errind = find(ldaClass ~= All_data_label(:,:))

%confussion matrix - diagonal shows correctly found points
[ldaResumbCM, grpOrder]=confusionmat(All_data_label(:,:),ldaClass)

K = coeff(1,2).const
L = coeff(1,2).linear

f = @(x,y, z) K + [x y z]*L;

h2 = ezimplot3(sym(f),[min(All_data(:,1))-0.05 max(All_data(:,1))+0.05 min(All_data(:,2))-0.05 max(All_data(:,2))+0.05 min(All_data(:,3))-0.05 max(All_data(:,3))+0.05]);

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
    plot3(All_data(errind(i),1), All_data(errind(i),2), All_data(errind(i),3),'o', 'Color','k', 'MarkerSize',15, 'Linewidth', 2)
    hold on
end