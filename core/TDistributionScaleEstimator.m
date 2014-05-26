function [scale iteration]= TDistributionScaleEstimator(initial_sigma,default_dof,residual)
% Project: Dense Visual Odometry
% Function: TDistributionScaleEstimator
%
% Description:
%   Get the scale of the T distribution.
%
% Example:
%   [scale iteration]= TDistributionScaleEstimator(initial_sigma,default_dof,residual)
%   
%   initial_sigma: Initial sigma, which is used in scale estimation
%   iteratively.
%   default_dof: Default degree of freedom, which is used in scale estimation
%   iteratively. 
%   residual: Residual of a pair of registration.
%
% NOTE: 
%       iteration is used to count the number of the iteration (used for
%       debug).
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-06: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initial_lamda = 1/initial_sigma^2;
lamda = initial_lamda;
dof = default_dof;
iteration = 0;
[rows cols] = size(residual);
while 1
    iteration = iteration + 1;
    initial_lamda = lamda;
    num = 0;
    lamda = 0;
    
    for y = 1:rows
        for x = 1:cols
            if(isnan(residual(y,x))~=1)
                num = num + 1;
                lamda = lamda + residual(y,x)^2*((dof+1)/(dof+initial_lamda*residual(y,x)^2));
            end
        end
    end
    
    lamda = lamda/num;
    lamda = 1/lamda;
    if abs(lamda - initial_lamda)<=1e-3
        break;
    end
end
scale = sqrt(1/lamda);
if scale < 0.001
    scale = 0.001;
end

    
    
    
    