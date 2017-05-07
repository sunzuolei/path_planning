%
% TwoLinkRobotCSpace
%

%% Draw Robot and obstacles
figure(1);

subplot(1,2,1);

% This function sets up the two link robot based on the coordinates
% in configuration space [theta1, theta2]. You can change the configuration
% of the robot by changing the two numbers in the input array.
fv = TwoLinkRobot ([330 90]);%配置空间的坐标 [theta1, theta2]

sz = 12;

p = patch (fv);%补丁函数，patch函数是matlab中用来给某个区域填充颜色的函数

%二连接机器人的面和边的颜色布局
p.FaceColor = 'blue';
p.EdgeColor = 'none';%不用颜色

hold on;%hold on 是保存axis内图像用的。如果你在新画图像之后不想覆盖原图像就要加上hold on这句话

% These arrays define the vertices and faces of the obstacle as a patch
obstacle.vertices = [3 3; 3 4; 4 3; -6 6; -6 8; -7 6; -8 -6; 8 -6; -8 -10; 8 -10];
obstacle.faces = [1 2 3; 4 5 6; 7 8 9; 8 9 10];

obs = patch(obstacle);

hold off;%使当前轴及图形不在具备被刷新的性质

axis equal;%坐标轴的长度单位设成相等
axis (sz*[-1 1 -1 1]);%控制轴的范围

%% Compute Configuration Space

theta1_range = 0:2:360;%theta1的范围
theta2_range = 0:2:360;%theta2的范围

nrows = length(theta2_range);%行
ncols = length(theta1_range);%列

cspace = true(nrows, ncols);

for i = 1:nrows
    for j = 1:ncols
        
        fv = TwoLinkRobot ([theta1_range(j) theta2_range(i)]);
        
        cspace (i,j) = CollisionCheck (fv, obstacle);%确定机器人的三角形面与障碍物三角形面是否重合
        
    end
    
    fprintf ('%d of %d\n', i, nrows);
end

%% Plot configuration space
subplot (1,2,2);

axis equal;
axis ([0 360 0 360]);%确定XY边界值

cmap = [1 1 1; 0 0 0];%白色，黑色
colormap(cmap);

% Here we may flip the cspace image to match the axes
%我们可以翻转cspace图像与轴相匹配
imagesc([0 360], [0 360], cspace);%在[0 360]*[0 360]的范围内染色。
axis xy;%使用矩阵坐标系：坐标原点在左上角、横坐标（y-轴）的值从左到右增加，纵坐标（x-轴）的值从上到下增加

xlabel ('theta1 in degrees');
ylabel ('theta2 in degrees');

title ('Configuration Space');

%% Plot a path through torus space
%%画一条路径通过环形空间

% New figure to visualize progress of planner
figure(2);

% You should experiment by changing these coordinates
start_coords = [40, 80];
end_coords = [100, 110];

% Find a route between the start and end nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU CAN COMMENT LINE 61-64 in the DijkstraTorus.m to compute the route
% without drawing the map every iteration!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
route = DijkstraTorus (cspace, start_coords, end_coords);

%% Animate the route(动画路线)

[i,j] = ind2sub (size(cspace), route);
%对应直角坐标系下，在配置空间两角度的坐标
y = theta2_range(i);
x = theta1_range(j);

% Plot point in configuration space
figure(1);
subplot(1,2,2);%一行2列的第二个图
hold on;
%x(1), y(1)是配置空间角度的坐标系，ro表示用红色o（圈线）画图，MarkerSize表示点大小
%MarkerFaceColor表示标记点内部的填充颜色
h = plot (x(1), y(1), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'red');
hold off;

n = length(x);

for i = 1:n
    fv = TwoLinkRobot ([x(i), y(i)]);
    p.Vertices = fv.vertices;
    
    h.XData = x(i);
    h.YData = y(i);
    
    drawnow;
    
end
