function fv3 = appendFV (fv1, fv2)
% append two patch structures(附加两个补丁结构)
%Helper functions for constructing the simulation environment.(辅助函数用于构建仿真环境。)

n1 = size(fv1.vertices,1);%第一维的长度3

fv3.vertices = [fv1.vertices; fv2.vertices];
fv3.faces = [fv1.faces; fv2.faces + n1];
