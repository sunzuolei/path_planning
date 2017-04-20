function [route,numExpanded] = AStarGrid (input_map, start_coords, dest_coords)
% Run A* algorithm on a grid.
% Inputs : 
%   input_map : a logical array where the freespace cells are false or 0 and
%   the obstacles are true or 1
%   start_coords and dest_coords : Coordinates of the start and end cell
%   respectively, the first entry is the row and the second the column.
% Output :
%    route : An array containing the linear indices of the cells along the
%    shortest route from start to dest or an empty array if there is no
%    route. This is a single dimensional vector
%    numExpanded: Remember to also return the total number of nodes
%    expanded during your search. Do not count the goal node as an expanded node. 

% set up color map for display
% 1 - white - clear cell
% 2 - black - obstacle
% 3 - red = visited
% 4 - blue  - on list
% 5 - green - start
% 6 - yellow - destination

cmap = [1 1 1; ...
    0 0 0; ...
    1 0 0; ...
    0 0 1; ...
    0 1 0; ...
    1 1 0; ...
    0.5 0.5 0.5];

colormap(cmap);

% variable to control if the map is being visualized on every
% iteration
drawMapEveryTime = true;

[nrows, ncols] = size(input_map);

% map - a table that keeps track of the state of each grid cell
map = zeros(nrows,ncols);

map(~input_map) = 1;   % Mark free cells
map(input_map)  = 2;   % Mark obstacle cells

% Generate linear indices of start and dest nodes
start_node = sub2ind(size(map), start_coords(1), start_coords(2));
dest_node  = sub2ind(size(map), dest_coords(1),  dest_coords(2));

map(start_node) = 5;
map(dest_node)  = 6;

% meshgrid（用于三维曲面的分格线座标；产生“格点”矩阵） will `replicate grid vectors' nrows and ncols to produce
% a full grid（meshgrid将复制网格向量的nrows和ncols产生一个完整的网格）
% type `help meshgrid' in the Matlab command prompt for more information（类型的帮助meshgrid Matlab命令提示符的更多信息）
parent = zeros(nrows,ncols);%定义一个变量来保存路径


[X, Y] = meshgrid (1:ncols, 1:nrows);%用于生成网格采样点的函数

xd = dest_coords(1);%终点的横坐标
yd = dest_coords(2);%终点的纵坐标

% Evaluate Heuristic function, H, for each grid cell 启发式评估函数,H,每个网格单元曼哈顿距离
% Manhattan distance

 H= abs(X - xd) + abs(Y - yd);%为了计算每一个邻居与终点的距离权值,曼哈顿距离
 H = H';
 
% Initialize cost arrays
f = Inf(nrows,ncols);%搜索中心与起始节点之间的距离和对在该搜索中心和目标位置之间剩余多少距离的估计的总和
g = Inf(nrows,ncols);%当前节点和开始位置之间的距离,相当于distancefromstart

g(start_node) = 0;
f(start_node) = H(start_node);

% keep track of the number of nodes that are expanded
numExpanded = 0;

% Main Loop

while true
    
    % Draw current map
    map(start_node) = 5;
    map(dest_node) = 6;
    
    % make drawMapEveryTime = true if you want to see how the 
    % nodes are expanded on the grid. 
    if (drawMapEveryTime)
        image(1.5, 1.5, map);
        grid on;%网格
        axis image;%在原图上继续绘图
        drawnow;
        pause(0.5);
    end
    
    % Find the node with the minimum f value
    [min_f, current] = min(f(:));
    
    if ((current == dest_node) || isinf(min_f))
        break;
    end;
    
    % Update input_map
    map(current) = 3;
    f(current) = Inf; % remove this node from further consideration
    
    % Compute row, column coordinates of current node
    [i, j] = ind2sub(size(f), current);
    
    % Visit all of the neighbors around the current node and update the
    % entries in the map, f, g and parent arrays
    
    neighbor = [i-1,j;... 
            i+1,j;... 
            i,j+1;... 
            i,j-1];
        

        outRangetest = (neighbor(:,1)<1) + (neighbor(:,1)>nrows) +...
                   (neighbor(:,2)<1) + (neighbor(:,2)>ncols );
locate = find(outRangetest>0);
neighbor(locate,:)=[];
neighborIndex = sub2ind(size(map),neighbor(:,1),neighbor(:,2));
for i=1:length(neighborIndex) 
if ((map(neighborIndex(i))~=2) && (map(neighborIndex(i))~=3 && map(neighborIndex(i))~= 5))
    map(neighborIndex(i)) = 4; 
  if (f(neighborIndex(i))> min_f + 1)     
      f(neighborIndex(i)) = min_f+1; 
        parent(neighborIndex(i)) = current;
         f(neighborIndex(i)) = H(neighborIndex(i)); 
  end 
 end 
end 
    
  
    
end

%% Construct route from start to dest by following the parent links
if (isinf(f(dest_node)))
    route = [];
else
    route = [dest_node];
    
    while (parent(route(1)) ~= 0)
        route = [parent(route(1)), route];
    end

    % Snippet of code used to visualize the map and the path
    for k = 2:length(route) - 1        
        map(route(k)) = 7;
        pause(0.1);
        image(1.5, 1.5, map);
        grid on;
        axis image;
        pause(0.5);
    end
end

end
