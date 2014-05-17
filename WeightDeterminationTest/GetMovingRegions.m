function [centers radius] = GetMovingRegions(Sp)
[SNum SDim] = size(Sp);
d = pdist(Sp);
z = linkage(d);
c = cluster(z,'Cutoff',1.5);

% ��Ԫ����С����ֵ����ȡ�������������
% �����ݵ�����
% ��뾶

k = max(c);
[L,C] = kmeans(Sp,k);
[centers radius] = GetRegionsInfo(Sp,L,C);