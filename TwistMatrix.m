function T = TwistMatrix(Vec)
% Project: Dense Visual Odometry
% Function: TwistMatrix
%
% Description:
%   Get the twist matrix of a vector.
%   vector = (v1,v2,v3);
%   Twist = |0 -v3 v2|
%           |v3 0 -v1|
%           |-v2 v1 0|
%
% Example:
%   T = TwistMatrix(Vec)
%   
%   Vec: The input vector.
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
w1 = Vec(1);
w2 = Vec(2);
w3 = Vec(3);

T = [0 -w3 w2;w3 0 -w1;-w2 w1 0];

