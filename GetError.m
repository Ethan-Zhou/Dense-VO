function e = GetError(re,We)
% Project: Dense Visual Odometry
% Function: GetError
%
% Description:
%   Get the error set of the registration from effective residual and
%   weight.
%
% Example:
%   e = GetError(re,We)
%   
%   re: Effective residual set
%   We: Effective weight set
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
[rows cols]= size(re);
length = rows*cols;
e = 0;
for i = 1:length
        e = e + re(i)^2*We(i);
end
e = e/length;