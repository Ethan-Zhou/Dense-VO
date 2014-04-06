function [u v] = Warpping(G,x,y,depth,InParas)
% Project: Dense Visual Odometry
% Function: Warpping
%
% Description:
%   Warp a pixel from the original iamge onto the warped image.
%
% Example:
%   [u v] = Warpping(G,x,y,depth,InParas)
%   
%   G: The camera motion matrix.
%   x,y: The pixel coordinate of the a point in the original image.
%   depth: The correspoding depth of the input point.
%   Inparas: The intrinsic parameters of the proposed RGB-D camera.
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-03: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[X Y Z] = InvPiProjection(x,y,depth,InParas);
P = [X Y Z 1]';
%G = RBMotion(kesi);
[u v] = PiProjection(G*P,InParas);
