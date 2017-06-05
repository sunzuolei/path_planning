%% Generate some points
% 400行*600列
nrows = 400;
ncols = 600;

obstacle = false(nrows, ncols);

[x, y] = meshgrid (1:ncols, 1:nrows);

%% Generate some obstacle

obstacle (300:end, 100:250) = true;
obstacle (150:200, 400:500) = true;

t = ((x - 200).^2 + (y - 50).^2) < 50^2;
obstacle(t) = true;

t = ((x - 400).^2 + (y - 300).^2) < 100^2;
obstacle(t) = true;

%% Compute distance transform
% 计算矩阵obstacle中零点到非零点（即中心点）的最短距离，构造出一个新的几何体
d = bwdist(obstacle);

% Rescale and transform distances（重新缩放和转换距离）
%使用距离函数d2构造排斥势函数
d2 = (d/100) + 1;
% 控制排斥势场函数的参数d0
d0 = 2;
% nu势缩放参数
nu = 800;
% 排斥势函数的计算公式
repulsive = nu*((1./d2 - 1/d0).^2);
% 如果机器人与障碍物之间的距离大于d0，则函数关闭
repulsive (d2 > d0) = 0;


%% Display repulsive potential

figure;
% mesh函数是用来画三维的网格表面的。
m = mesh (repulsive);
% phong是光照模式。图像的一种显示方式。
m.FaceLighting = 'phong';
axis equal;

title ('Repulsive Potential');

%% Compute attractive force

goal = [400, 50];
% xi势缩放参数
xi = 1/700;

attractive = xi * ( (x - goal(1)).^2 + (y - goal(2)).^2 );

figure;
m = mesh (attractive);
m.FaceLighting = 'phong';
axis equal;

title ('Attractive Potential');

%% Display 2D configuration space

figure;
% imshow是matlab中显示图像的函数。
imshow(~obstacle);

hold on;
plot (goal(1), goal(2), 'r.', 'MarkerSize', 25);
hold off;

axis ([0 ncols 0 nrows]);
axis xy;
axis on;

xlabel ('x');
ylabel ('y');

title ('Configuration Space');

%% Combine terms

f = attractive + repulsive;

figure;
m = mesh (f);
m.FaceLighting = 'phong';
axis equal;

title ('Total Potential');

%% Plan route
start = [50, 350];

route = GradientBasedPlanner (f, start, goal, 1000);

%% Plot the energy surface

figure;
m = mesh (f);
axis equal;

%% Plot ball sliding down hill
% 从上到下有21组点，所以构成20层。
% 然后，又像切西瓜一样，从顶到底切了20刀，这样就构成了21*21个小网格
[sx, sy, sz] = sphere(20);

scale = 20;
sx = scale*sx;
sy = scale*sy;
sz = scale*(sz+1);

hold on;
p = mesh(sx, sy, sz);
p.FaceColor = 'red';
p.EdgeColor = 'none';
p.FaceLighting = 'phong';
hold off;

for i = 1:size(route,1)
    P = round(route(i,:));
    z = f(P(2), P(1));
    
    p.XData = sx + P(1);
    p.YData = sy + P(2);
    p.ZData = sz + f(P(2), P(1));
    
    drawnow;
    
    drawnow;
    
end

%% quiver plot（箭图）

skip = 20;

figure;

xidx = 1:skip:ncols;
yidx = 1:skip:nrows;

[gx, gy] = gradient (-f);
quiver (x(yidx,xidx), y(yidx,xidx), gx(yidx,xidx), gy(yidx,xidx), 0.4);

axis ([1 ncols 1 nrows]);

hold on;

ps = plot(start(1), start(2), 'r.', 'MarkerSize', 30);%起点
pg = plot(goal(1), goal(2), 'g.', 'MarkerSize', 30);%终点
p3 = plot (route(:,1), route(:,2), 'r', 'LineWidth', 2);%路径
