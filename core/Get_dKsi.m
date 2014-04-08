function dksi = Get_dKsi(Je,We,re)
% Project:   Dense Visual Odometry
% Function: GetDksi
%
% Description:
%   Get the increment of the motion parameter ksi.
%
% Example:
%   dksi = Get_dKsi(Je,We,re)
%   
%   Je: Effective Jacobian matrix collection.
%   We: Effective weight coefficient collection (only contains diagonal elements w_ii to save ram)
%   re: Effective residual value collection.
%
% NOTE: 
%       The input of the function Je, We, re are subsets of the original J,
%       W, r, which exclude the ones whose values are invalid for various
%       reason.
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-07: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
up = zeros(6,1);
[rows cols] = size(re);
length = rows*cols;
temp = zeros(6,length);

for y = 1:6
    for i = 1:length
        temp(y,i) = Je(i,y)*We(i);
        up(y) = up(y) + temp(y,i)*re(i);
    end
end

down = temp*Je;
dksi = (down\up)*(-1);


