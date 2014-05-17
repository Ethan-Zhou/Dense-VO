function [centers radius] = ClusterPoints(Sp2,threshold)
d = pdist(Sp2);
z = linkage(d);
c = cluster(z,'maxclust',5);