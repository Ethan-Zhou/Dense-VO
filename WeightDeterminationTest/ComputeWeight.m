function Weight = ComputeWeight(r2,centers,radiuses,initial_sigma,default_dof)
% Project:   Dense Visual Odometry
% Functions: ComputeWeight
%
% Description:
%   Compute the weight (New method)
%
% Example:
%   Weight = ComputeWeight(r2,centers,radius,initial_sigma,default_dof)
%   
%   r2: The residual of the current aligning pair.
%   centers, radiuses: The location and the scope of each moving region
%   initial_sigma,default_dof: Useful parameters used in
%   TDistributionInfluenceFunction.
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-05-27: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[delta iteration]= TDistributionScaleEstimator(initial_sigma,default_dof,r2);
Weight = TDistributionInfluenceFunction(r2,delta,default_dof);
[rows cols] = size(r2);
len = rows*cols;
for i = 1:len
    p2 = GetPosition(i,cols);
    if InMovingRegion(p2,centers,radiuses) == 1
        Weight(i) = NaN;
    end
end