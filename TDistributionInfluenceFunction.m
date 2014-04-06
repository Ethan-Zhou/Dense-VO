function weight = TDistributionInfluenceFunction(r,delta,dof)
% Project: Dense Visual Odometry
% Function: TDistributionInfluenceFunction
%
% Description:
%   Get the weight for every element of residual, which will be used in
%   re-weighted least square algorithm.
%
% Example:
%   weight = TDistributionInfluenceFunction(r,delta,dof)
%   
%   r: The residual of a registration pair.(Same size as the input image).
%   delta, dof: Important parameters, see TUM paper 'Odometry from RGB-D
%   Cameras for Autonomous Quadropters',5.3.8 .
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-06: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = r./delta;
[rows cols] = size(X);
length = rows*cols;
weight = zeros(length,1);
for i = 1:length
    p2 = GetPosition(i,cols);
    x = p2(1);
    y = p2(2);
    if isnan(X(y,x))==0
        weight(i) = (dof+1)/(dof+X(y,x)^2);
    else
        weight(i) = NaN;
    end
end

