function [x y] = PiProjection(P,InParas)
% Project: Dense Visual Odometry
% Function: PiProjection
%
% Description:
%   Get the pixel coordinate of a 3D point with known camera intrinsic parameters. 
%
% Example:
%   [x y] = PiProjection(P,InParas)
%   
%   x,y: The pixel coordinate of a 3D point after projected on the focal
%       plane.
%   InParas: The intrinsic parameters of the proposed RGB-D camera.
%
% NOTE: 
%       R3 -> R2
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-03: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fx = InParas(1);
fy = InParas(2);
ox = InParas(3);
oy = InParas(4);

X = P(1);
Y = P(2);
Z = P(3);

x = X*fx/Z+ox;
y = Y*fy/Z+oy;


