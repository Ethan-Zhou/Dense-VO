function Weight = ComputeWeight(r2,centers,radius,initial_sigma,default_dof)
[delta iteration]= TDistributionScaleEstimator(initial_sigma,default_dof,r2);
Weight = TDistributionInfluenceFunction(r2,delta,default_dof);
[rows cols] = size(r2);
len = rows*cols;
for i = 1:len
    p2 = GetPosition(i,cols);
    if InMovingRegion(p2,centers,radius) == 1
        Weight(i) = NaN;
    end
end