function [centers radius] = GetMovingRegions(Sp,CThreshold)
[SNum SDim] = size(Sp);
d = pdist(Sp);
z = linkage(d,'average');
c = cluster(z,'Cutoff',CThreshold);

% 将元素数小于阈值的类取消，求出种类数
% 求数据的质心
% 求半径

k = max(c);
[L,C] = kmeans(Sp,k);
[centers radius] = GetRegionsInfo(Sp,L,C);