function Weight = WeightDetermination(r2,dr,initial_sigma,default_dof,thresh1,thresh2)
[Output Sp] = CheckMotion(r2,dr,thresh1,thresh2);
[SNum SDim] = size(Sp);
if SNum > 0
    [centers radius] = GetMovingRegions(Sp,1);
    Weight = ComputeWeight(r2,centers,radius,initial_sigma,default_dof);
else
    W = TDistributionInfluenceFunction(r2,delta,default_dof);
end