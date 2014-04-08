function [X Y Z] = InvPiProjection(x,y,depth,InParas)
% Project: Dense Visual Odometry
% Function: InvPiProjection
%
% Description:
%   The inverse Pi projection function, R2->R3.
%
% Example:
%   [X Y Z] = InvPiProjection(x,y,depth,InParas)
%   
%   x,y: The x,y coordinate of a pixel
%   depth: The corresponding depth of the pixel
%   InParas: The intrinsic parameters of the RGB-D camera
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-02: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fx = InParas(1);
fy = InParas(2);
ox = InParas(3);
oy = InParas(4);

Z = depth;
X = (x-ox)/fx*Z;
Y = (y-oy)/fy*Z;



