function Z = GetDepth(x,y,Pcloud)
% Project: Dense Visual Odometry
% Function: GetDepth
%
% Description:
%   Get depth information from point cloud with given x,y coordinate.
%
% Example:
%   Z = GetDepth(x,y,Pcloud)
%   
%   x,y: coordinate in x,y direction
%   Pcloud: Point cloud set which contains the 3D information of a scene
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
Z = Pcloud(y,x,3);