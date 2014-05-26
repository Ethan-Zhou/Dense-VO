function Weight = WeightDetermination(r2,dr,initial_sigma,default_dof,thresh1,thresh2)
% Project: Dense Visual Odometry
% Function: WeightDetermination
%
% Description:
%   WeightDetermination(r2,dr,initial_sigma,default_dof,thresh1,thresh2)
%
% Example:
%   Weight = WeightDetermination(r2,dr,initial_sigma,default_dof,thresh1,thresh2)
%   
%   See: CheckMotion, ComputeWeight, TDistributionInfluenceFunction
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
[Output Sp] = CheckMotion(r2,dr,thresh1,thresh2);
[SNum SDim] = size(Sp);
if SNum > 0
    [centers radius] = GetMovingRegions(Sp,1);
    Weight = ComputeWeight(r2,centers,radius,initial_sigma,default_dof);
else
    W = TDistributionInfluenceFunction(r2,delta,default_dof);
end