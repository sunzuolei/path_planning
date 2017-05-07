function out = transformFV (fv, theta, t)
% Rotate and translate a patch data structure（旋转并平移补丁数据结构）
%Helper functions for constructing the simulation environment.(辅助函数用于构建仿真环境。)

out.faces = fv.faces;

c = cosd(theta);%余弦值
s = sind(theta);%正弦值

out.vertices = bsxfun(@plus, fv.vertices*[c s; -s c], t);%fv.vertices*[c s; -s c]+t,实现旋转与平移
