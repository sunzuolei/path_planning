function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% 该函数基于作为2D数组传入的函数f的梯度，
% 计划从开始到目的地的2D环境的路径。 
% start_coords和end_coords两个参数分别表示阵列中起始和终止位置的坐标，
% 而max_its表示系统在放弃之前可以使用的迭代次数的上限。

% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y
% coordinate.
% 输出路径是具有2列和n行的数组，
% 其中行对应于机器人沿路线移动时的坐标。
% 第一列对应于x坐标，第二列对应于y坐标。
 [gy, gx] = gradient (-f);
 %势函数-f的梯度，
%  其中gx为其水平方向上的梯度，gy为其垂直方向上的梯度，
%gx的第一列元素为原矩阵-f第二列与第一列元素之差，gx的第二列元素为原矩阵第三列与第一列元素之差除以2，
% 以此类推：gx(i,j)=(-f(i,j+1)-(-f(i,j-1)))/2。最后一列则为最后两列之差。同理，可以得到gy。
 route = start_coords; 
 current = start_coords ; 
 %迭代开始
for k=1:max_its
	% new position of robot = start_cords + gradient 
	i = round(current(1)); 
%     对数组current(1)中每个元素朝最近的方向取整数部分，并返回与current(1)同维的整数数组i，
% 对于一个复数参量current(1)，则分别对其实部和虚数朝最近的方向取整数部分，并返回一复数数据i。
	j = round(current(2)); 
	gx_current = gx(j,i) ; 
	gy_current = gy(j,i) ; 
    ngy = gx_current/norm([gx_current gy_current]) ; 
%     morm函数返回的是矩阵[gx_current gy_current]的二范数，
% （二范数j就是矩阵[gx_current gy_current]的2范数就是 [gx_current gy_current]的转置矩阵乘以[gx_current gy_current]特征根 最大值的开根号）
    ngx = gy_current/norm([gx_current gy_current]) ;
    %ngx = gx_current(1)/norm([gx_current gy_current]) ; 
	%ngy = gy_current(2)/norm([gx_current gy_current]) ; 
	%new_p = current ; 
	new_p(1) = current(1) + ngx ; 
	new_p(2) = current(2) + ngy ; 
	route = [route ; new_p]
	if (pdist([new_p ; end_coords],'euclidean') < 2 ) 
		break ; 
	end 
	current = new_p ; 
end
end
