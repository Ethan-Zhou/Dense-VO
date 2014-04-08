function J = ComputeJacobian(J_I,J_w)
% Project:   Dense Visual Odometry
% Functions: ComputeJacobian
%
% Description:
%   Get the Jacobian value from J_I and J_w
%
% Example:
%   J = ComputeJacobian(J_I,J_w)
%
%   J: A 1*6 Jacobian matrix which contains the partial derivatives of a pixel
%   J_I: A 1*2 Jacobian matrix of the image derivatives in x and y
%        direction
%   J_w: A 2*6 Jacobian matrix. J_w = J_pi * J_g * J_G (See 'Odometry from RGB-D Cameras for Autonomous Quadrocopters', TUM, Christian Kerl, 4.2.1)
%
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
if isnan(J_I(1))==1 || isnan(J_I(2))==1 || isnan(J_w(1,1))==1
    J = [NaN NaN NaN NaN NaN NaN];
else
    J = J_I*J_w;
end

