function [centers radius] = GetMovingRegions(Sp,CThreshold)
[SNum SDim] = size(Sp);
d = pdist(Sp);
z = linkage(d,'average');
c = cluster(z,'Cutoff',CThreshold);

% ��Ԫ����С����ֵ����ȡ�������������
% �����ݵ�����
% ��뾶

k = max(c);
[L,C] = kmeans(Sp,k);
[centers radius] = GetRegionsInfo(Sp,L,C);