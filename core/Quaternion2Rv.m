function [theta v] = Quaternion2Rv(q)
% Project: Dense Visual Odometry
% Function: Quaternion2Rv
%
% Description:
%   Covert quaternion to rotation vector and corresponding theta.
%
% Example:
%   [theta v] = Quaternion2Rv(q)
%   
%   theta: The angle of rotation.
%   v: The  vector which represent the roation axis.
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-10: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta = acos(q(4))*2;
v = sin(theta/2)*[q(1) q(2) q(3)];