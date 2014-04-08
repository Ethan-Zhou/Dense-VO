function [J W r] = ComputeJacobianAndError(I1,Z1,I2,Z2,G,InParas,initial_sigma,default_dof)
% Project:   Dense Visual Odometry
% Functions: ComputeJacobianAndError
%
% Description:
%   Get the Jacobian, weight, and residual of a registration pair
%
% Example:
%   [J W r] = ComputeJacobianAndError(I1,Z1,I2,Z2,G,InParas,initial_sigma,default_dof)
%   
%   I1,I2: The input image pair, both are gray
%   Z1,Z2: The input depth image pair
%   G: Rigid body motion matrix, which describe the camera motion between the two successive snapshot 
%   InParas: A struct object which contains necessary intrinsic parameters
%            of the RGB-D camera
%   initial_sigma: useful initial parameter used in optimization process
%   default_dof: useful initial parameter used in optimization process
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-08: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[rows cols] = size(I1);
I22 = WarpImage(I2,Z2,G,InParas);
r = GetResidual(I1,I22);
[delta iteration]= TDistributionScaleEstimator(initial_sigma,default_dof,r);
W = TDistributionInfluenceFunction(r,delta,default_dof);
GetDerivative = CalcDerivative;
I22_dx = GetDerivative.fun1(I22);
I22_dy = GetDerivative.fun2(I22);

J = zeros(rows*cols,6);
for i = 1:rows*cols
    p2 = GetPosition(i,cols);
    y = p2(2);
    x = p2(1);
    J_I = [I22_dx(y,x) I22_dy(y,x)];
    J_w = ComputeJw(p2,Z1(y,x),InParas);
    J(i,:) = ComputeJacobian(J_I,J_w);  
end
