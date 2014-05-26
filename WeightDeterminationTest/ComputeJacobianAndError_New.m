function [J2 r2] = ComputeJacobianAndError_New(I2,Z2,I3,Z3,G2_iter,InParas)
% Project:   Dense Visual Odometry
% Functions: ComputeJacobianAndError_New
%
% Description:
%   Get the Jacobian and residual of an aligning pair
%
% Example:
%   [J2 r2] = ComputeJacobianAndError_New(I2,Z2,I3,Z3,G2_iter,InParas)
%   
%   I2,I3: The input image pair, both are gray
%   Z2,Z3: The input depth image pair
%   G2_iter: Rigid body motion matrix, which describe the camera motion between the two successive snapshot 
%   InParas: A struct object which contains necessary intrinsic parameters
%            of the RGB-D camera
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
[rows cols] = size(I2);
length = rows*cols;
I33 = WarpImage(I3,Z3,G2_iter,InParas);
r2 = GetResidual(I2,I33);

GetDerivative = CalcDerivative;
I33_dx = GetDerivative.fun1(I33);
I33_dy = GetDerivative.fun2(I33);

%J = zeros(rows*cols,6);
for i = 1:length
    p2 = GetPosition(i,cols);
    y = p2(2);
    x = p2(1);
    J_I = [I33_dx(y,x) I33_dy(y,x)];
    J_w = ComputeJw(p2,Z2(y,x),InParas);
    J2(i,:) = ComputeJacobian(J_I,J_w);  
end
